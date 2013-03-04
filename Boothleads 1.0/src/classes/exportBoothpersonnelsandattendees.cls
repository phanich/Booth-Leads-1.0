public with sharing class exportBoothpersonnelsandattendees {

public String selectedEvent { get; set; }
public List<QR_Attendee_BoothVisitSummary__c> listofBoothpersonnels{get;set;}
public List<selectOption> options{get;set;}
public MAP<string,string> mapIdwithOwner{get;set;}
public List<QR_AttendeeSummary__c> listOfAttendees{get;set;}
public boolean resderExport{get;set;}


public pageReference export(){
  if(listOfAttendees  != null && listOfAttendees.size()>0){
      PageReference pageRef= new PageReference('/apex/export');
            pageRef.setredirect(false);
            return pageRef;
       }
return null;
}


public exportBoothpersonnelsandattendees(){
mapIdwithOwner = new MAP<string,string>();
options = new List<selectOption>();
List<QR_Event__c> listofEvents =[select ownerid,id,Event_Title__c from QR_Event__c where createdDate>=:dateTime.newInstance(2012,8,28)];
options.add(new selectOption('Select','select'));
for( QR_Event__c Ev:listofEvents){
options.add(new selectOption(ev.id,ev.Event_Title__c));
mapIdwithOwner.put(ev.id,ev.Event_Title__c);
}
}

public string exportStringName{get;set;}
public pageREference getEventAttendees(){
 exportStringName = mapIdwithOwner.get(selectedEvent);
resderExport = true;
listOfAttendees = new List<QR_AttendeeSummary__c>();
system.debug('11111111111111 '+selectedEvent );

listofBoothpersonnels = new List<QR_Attendee_BoothVisitSummary__c>();
listofBoothpersonnels =[select Attendee_BarCode1__c from QR_Attendee_BoothVisitSummary__c where Attendee_ScannedBy__r.BoothAdmin_Id__r.Event_Id__c=:selectedEvent and (Attendee_ScannedBy__r.BoothPersonnel_EmailId__c!='raj@globalnest.com' OR Attendee_ScannedBy__r.BoothPersonnel_EmailId__c!='john@globalnest.com' OR Attendee_ScannedBy__r.BoothPersonnel_EmailId__c!='durga@globalnest.com')];
system.debug('222222222222222 '+listofBoothpersonnels);
set<string> setOfIds = new set<string>();
for(QR_Attendee_BoothVisitSummary__c bvs:listofBoothpersonnels ){
setOfIds.add(bvs.Attendee_BarCode1__c);
}
system.debug('3333333333333 '+setOfIds);
listOfAttendees  =[select Attendee_FirstName__c,Attendee_LastName__c,Attendee_EmailId__c,Attendee_CellPhoneNumber__c,Attendee_HomePhoneNumber__c,Attendee_WorkPhone__c,LastModifiedDate from QR_AttendeeSummary__c where Attendee_Barcode3__c in :setOfIds order by Attendee_CellPhoneNumber__c desc nulls last];
system.debug('4444444444444 '+listOfAttendees);
for(QR_AttendeeSummary__c a:listOfAttendees ){
a.Attendee_FirstName__c =escape(a.Attendee_FirstName__c);
a.Attendee_LastName__c=escape(a.Attendee_LastName__c);

}


return null;
}


 public string escape(string s){
      
     
      if(s != null && s.contains(',')){
          
         s=s.replaceAll('"','');
          
          s='"'+s+'"';
       } 
            
       return s;
      }
      
      
      
      



static testMethod void myUnitTest() {
 contact m = new contact(firstname='testcontactname',lastname='testcontactlastname');
           insert m;
       Profile w = [select id from profile where name='Standard User'];
 
        User u = new User(alias = 'test123', email='test123@noemail.com',
                 emailencodingkey='UTF-8',profileid = w.Id,lastname='Testing', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',
                  timezonesidkey='America/Los_Angeles', username='test123@noemail.com');
                  insert u;
                  
                  
       QR_Eventadmin__c  h = new QR_Eventadmin__c(
       EventAdmin_FirstName__c='testEvenfirstnametAdmin',EventAdmin_LastName__c='testEvenLastname',EventAdmin_EmailId__c=u.Email,User_ID__c=u.Id);    
        insert h;
     
     QR_Event__c x = new QR_Event__c(Event_Title__c='testEvent',Event_HostingTimeZone__c='Eastern Time(USA)',Eventadmin_Id__c=h.id,Start_Date__c=date.parse('04/06/2900'),End_Date__c=date.parse('04/06/2900'));
     insert x;
     
     QR_AttendeeSummary__c e = new QR_AttendeeSummary__c(Attendee_FirstName__c='testattendeesummaryfirstname',Attendee_LastName__c='testattendeelastname',Attendee_EmailId__c='test123@noemail.com',Attendee_Company__c='testattendeecompany');
     insert e;          
     
     
     
     
     QR_BoothAdmin__c t = new QR_BoothAdmin__c(BoothAdmin_FirstName__c='testboothadminfirstname',BoothAdmin_Organization_Name__c='testboothadminorganiname',BoothAdmin_LastName__c='testboothlastmname',BoothAdmin_EmailId__c='test123@noemail.com',Event_Id__c=x.id);
     insert t;
   
    
    QR_BoothPersonnel__c  q = new  QR_BoothPersonnel__c(BoothAdmin_Id__c=t.id,BoothPersonnel_FirstName__c='testboothpersonelfirstname',BoothPersonnel_LastName__c='testboothpersonellastname',BoothPersonnel_EmailId__c='test@gmail.com');
    insert q;

   QR_AttendeeSummary__c eList =[select Name from QR_AttendeeSummary__c  where id=:e.id]; 
  system.debug('hiiiiiiiiiii  '+eList.Name);
   QR_Attendee_BoothVisitSummary__c bvs =new QR_Attendee_BoothVisitSummary__c(Attendee_FirstName__c='test',Attendee_EmailId__c='test@globalnest.com',Attendee_LastName__c='testLast',Attendee_ScannedBy__c=q.id,Attendee_BarCode1__c=eList.Name);
   insert bvs;

   system.runas(u){
   exportBoothpersonnelsandattendees ebaCon = new exportBoothpersonnelsandattendees();
   system.debug('heloooooooooooooooooooooo '+x.id);
   ebaCon.selectedEvent =x.id;
   ebaCon.getEventAttendees();
   
   }

}




}