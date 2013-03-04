public with sharing class ScannigboothadminReportCon {
public boolean outBool { get; set; }
public  List<QR_Attendee_BoothVisitSummary__c> attendeesList{get;set;} 
 
    public PageReference close() {
    outBool =false;
        return null;
    }




    public PageReference showScannedAttendees() {
    outBool =true;
 
   system.debug('rrrrrrrrrrrrrrrr '+myDate );
    attendeesList =new List<QR_Attendee_BoothVisitSummary__c>();
    
    attendeesList= [select Attendee_FirstName__c,Attendee_EmailId__c,Attendee_LastName__c from QR_Attendee_BoothVisitSummary__c where createdDate>=:mydate  and Attendee_ScannedBy__r.BoothPersonnel_EmailId__c=:ApexPages.currentPage().getParameters().get('boothpersonnelValue')];
    system.debug('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh '+attendeesList);  
      system.debug('tttttt '+outBool);  
    return null;
    }


public List<QR_Attendee_BoothVisitSummary__c> listOfAdmins{get;set;}

public List<innercls> inn{get;set;}
public datetime myDate{get;set;}
public ScannigboothadminReportCon(){
 myDate = 
   datetime.newInstance(2012, 09, 18);
boothPersonnels();

}


public pageReference boothPersonnels(){

TotalScannedAttendees =0;
aggregateResult[] gh = new aggregateResult[]{};
inn = new  List<innercls>();
system.debug('gggggggggggggggggggggbb    '+myDate );
gh =[select Attendee_ScannedBy__r.BoothPersonnel_FirstName__c scan,count(id) cou,Attendee_ScannedBy__r.BoothPersonnel_LastName__c las,Attendee_ScannedBy__r.BoothPersonnel_EmailId__c em from QR_Attendee_BoothVisitSummary__c where createdDate>=:mydate group by Attendee_ScannedBy__r.BoothPersonnel_FirstName__c,Attendee_ScannedBy__r.BoothPersonnel_LastName__c,Attendee_ScannedBy__r.BoothPersonnel_EmailId__c Order By count(id) desc];
for(aggregateResult a:gh){
string str =string.valueOf(a.get('scan'));
integer intvalue = integer.valueOf(a.get('cou'));
string st =str+' '+ string.valueOf(a.get('las'));
string email=string.valueOf(a.get('em'));
inn.add(new innercls(st,intvalue,email));
TotalScannedAttendees +=intvalue; 

}

system.debug('valuesssssssssssssssssssssssss  '+TotalScannedAttendees);
totalBoothPersonnels= inn.size();

 return null;
}

public integer totalBoothPersonnels{get;set;}

public integer TotalScannedAttendees{get;set;}

public class innercls{
public string innerstr{get;set;}
public string inneridval{get;set;}
public string innerEmail{get;set;}
public integer innerintvalue {get;set;}
public innercls(string s,integer i,string r){
this.innerstr =s;
this.innerintvalue =i;
this.innerEmail=r;
}

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
   
   pageReference p = Page.ScannigboothadminReport;
   Test.setCurrentPage (p);
   ScannigboothadminReportCon abpc= new ScannigboothadminReportCon(); 
   p.getParameters().put('boothpersonnelValue','test@gmail.com'); 
   abpc.showScannedAttendees();
   abpc.close();
   }


}
}