public with sharing class QRCode_Boothadmin_PersonnelsmultiEveCon {

       
public boolean displayButton{get;set;}
public  String loginUser {get;set;}
public string eventName{get;set;}
    public String selEventName{get;set;}
    public String strAdminId{get;set;}
    public QR_BoothAdmin__c objBothAdmin{get;set;}
    public QR_BoothPersonnel__c  objBothAdmin1{get;set;}
    //public List<QR_Event__c> returnList{get;set;}
    public String popupLabelName{get;set;}
    public List<QR_BoothPersonnel__c > bothAdminList1{get;set;}
    public List<QR_BoothAdmin__c > bothAdminList{get;set;}

    public List<QR_BoothPersonnel__c  > returnList1{get;set;}
   public List<QR_BoothAdmin__c> returnList{get;set;}
    public List<SelectOption> selEventNameList{get;set;}
    
    public Boolean displayPopUp{get;set;}
    public Boolean displayPopUpForAdd{get;set;}
    public Boolean displayPopUpForEdit{get;set;}
    public String bothAdminId{get;set;}
    public string nameoftheEvent {get;set;}

public Pagereference checkUserId()
{
system.debug('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh'+UserInfo.getUserId());

if(UserInfo.getUserId() == '00590000000zKNlAAM' || UserInfo.getUserId()==null)
{
  system.debug('ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt'+UserInfo.getUserId());
Pagereference pg = new Pagereference('/apex/QRcode_BoothAdmin_signinMultiEvent');
Pg.setredirect(true);
return pg;


}else {
return null;
}


}



 public PageReference boothqrcodeAction() {
      Pagereference pg = new pagereference('/apex/QRcode_Boothadmin_boothMultiEvent');
    pg.setredirect(true);
        return pg;
    }



    public pageREference closePopup3() {
    displayPopUpForAdd2 =false;
     return null;  
    }


    public PageReference EditPopupValues() {
    
     displayPopUpForAdd2 =false;
        if(objBothAdmin1 != null)
        {
          upsert objBothAdmin1;
          getBoothAdminDetails();
       
       
        }
    
      /** Pagereference pg = new Pagereference('/apex/QRCode_Boothadmin_PersonnelsMultiEvent');
        pg.setredirect(true);
        return pg;
       **/
       return null;
    }


    public boolean displayPopUpForAdd2 { get; set; }




    public PageReference Reportsaction() {
    pagereference pg = new pagereference('/apex/QRcode_Boothadmin_ReportsphMultiEvent');
    pg.setredirect(true);
        return pg;
        
    }
    
     public PageReference profileaction() {
    Pagereference pg = new pagereference('/apex/QRcode_BoothAdmin_ProfileMultiEvent');
    pg.setredirect(true);
        return pg;
       
    }


    public PageReference AttendeesAction() {
    pagereference pg = new pagereference('/apex/Boothadmin_AttendeesphMulti');
    pg.setredirect(true);
        return pg;
        
    }


    public PageReference Customeraction() {
    pagereference pg = new pagereference('/apex/QRCode_Boothadmin_PersonnelsMultiEvent');
    pg.setredirect(true);
        return pg;
    }


    public PageReference EventAction() {
    pagereference pg = new pagereference('/apex/QRCode_BoothadminEventsphMultiEvent');
    pg.setredirect(true);
        return pg;
       
    }




    
    
    //public integer RECcount{get;set;}
    public QRCode_Boothadmin_PersonnelsmultiEveCon()
    {
       loginUser = UserInfo.getUserName();
       //'phani+booth@globalnest.com';
       
       //UserInfo.getUserName();
       //'phani+chimata8@globalnest.com';
    
      // pageload();
        getBoothAdminDetails();
    }
    
    
    
   
   
    public void getBoothAdminDetails()
    {
       listforgetustring=new List<List<inn>>();
       integer  RECcount=0;
        String eventId=ApexPages.CurrentPage().getParameters().get('EventID');
          
        System.debug('***eveeventId'+selEventName);   
            
        if((eventId =='' || eventId ==null))
        {
            eventId =selEventName;
        }else if(selEventName == null || selEventName== '')
        {
            selEventName=eventId ;
        }
       
     
      
     
       
     
        Map<String,String> eventIdMap=new map<String,String>();
        
        for(QR_BoothAdmin__c obj :[Select g.id,g.Name,g.Event_Id__r.Name, g.Event_Id__r.Event_Title__c,  g.BoothAdmin_EmailId__c
                                                From QR_BoothAdmin__c g 
                                                WHERE g.BoothAdmin_EmailId__c =:loginUser]){
          
        
       
            system.debug('mallikkkkkkkkkkkkkkkkkkkkkkkk '+obj.Event_Id__r.Name);               
        
         nameoftheEvent =obj.Event_Id__r.Event_Title__c;                                   
        if(nameoftheEvent != null)
        {                               
        eventIdMap.put(obj.Event_Id__r.Name,obj.Event_Id__r.Event_Title__c);
        }
        if(strAdminId ==null||strAdminId==''){    
        strAdminId=  obj.BoothAdmin_EmailId__c;}
        if(bothAdminId ==null ||bothAdminId ==''){
        bothAdminId = obj.id;
       }
        
        
        }
        
        system.debug('eventIdMap::'+eventIdMap.size());
        selEventNameList = new List<SelectOption>();    
        selEventNameList.add(new Selectoption('ALL','ALL'));
         innerforgetsustring = new  List<inn>();
         
         
        if( !eventIdMap.isEmpty())
        {
            for(String evenId:eventIdMap.keySet())
            {
                selEventNameList.add(new Selectoption(evenId,eventIdMap.get(evenId)));
            }
        }
        
       
        
       if(selEventName != null && selEventName != 'ALL'){
       displayButton = true;
         bothAdminList1 = [Select   g.BoohtPersonnel_Designation__c,g.BoothAdmin_Id__c,
                            g.BoothPersonnel_EmailId__c,g.BoothPersonnel_FirstName__c,
                            g.BoothPersonnel_LastName__c,g.BoothAdmin_Id__r.Name,g.Event_HostedByEventBrite__c,
                            g.Name,g.isActive__c,Random_Number__c,g.BoothAdmin_Id__r.Event_Id__r.Event_Title__c
                          From QR_BoothPersonnel__c g where g.BoothAdmin_Id__r.BoothAdmin_EmailId__c = :strAdminId and isActive__c=true  and g.BoothAdmin_Id__r.Event_Id__r.Name=:selEventName  limit 1000];
            }else{
            displayButton =false;
            bothAdminList1 = [Select   g.BoohtPersonnel_Designation__c,g.BoothAdmin_Id__c,
                            g.BoothPersonnel_EmailId__c,g.BoothPersonnel_FirstName__c,
                            g.BoothPersonnel_LastName__c,g.BoothAdmin_Id__r.Name,g.Event_HostedByEventBrite__c,
                            g.Name,g.isActive__c,Random_Number__c,g.BoothAdmin_Id__r.Event_Id__r.Event_Title__c
                          From QR_BoothPersonnel__c g where g.BoothAdmin_Id__r.BoothAdmin_EmailId__c = :strAdminId and isActive__c=true   limit 1000];
            
            }
          
          
         
            for(QR_BoothPersonnel__c boothlist:bothAdminList1 ){
            
           boothlist.BoothPersonnel_FirstName__c =escapeSpecialCharacters(boothlist.BoothPersonnel_FirstName__c);
           boothlist.BoothPersonnel_LastName__c=escapeSpecialCharacters(boothlist.BoothPersonnel_LastName__c);
           boothlist.BoohtPersonnel_Designation__c=escapeSpecialCharacters(boothlist.BoohtPersonnel_Designation__c);
           boothlist.BoothAdmin_Id__r.Event_Id__r.Event_Title__c=escapeSpecialCharacters(boothlist.BoothAdmin_Id__r.Event_Id__r.Event_Title__c);
            innerforgetsustring.add(new inn(boothlist,boothlist.Random_Number__c));
           
            
      
            
            }
            
        }
        
  
    
    
     public String escapeSpecialCharacters(String input){
if(input!= null && input != '' && (input.contains('\\') )){
input = input.replace('\\','\\\\');

}
if(input!= null && input != '' && (input.contains('"') || input.contains('<'))){

if(input!= null && input != '' && (input.contains('"') )){
input = input.replace('"','\\\"');

}if(input!= null && input != '' && (input.contains('<') )){
input = input.replace('<','');
system.debug('llllllllllllllllllllll miru keka'+input);
}



}
return input;
    
    }

    
    
    
    
    public List<inn> innerforgetsustring{get;set;}
    public list<List<inn>> listforgetustring{get;set;}
    public class inn{
    
    public QR_BoothPersonnel__c p{get;set;}
    public string str{get;set;}
    
    public inn(QR_BoothPersonnel__c v,string s){
    
    this.p =v;
   this.str=s;
   }
    
    
    
    }
    
    public void closePopup() {        
        displayPopup = false;    
    } 
    
    public void closePopup1() {        
        displayPopUpForAdd = false; 
        objBothAdmin1 = new QR_BoothPersonnel__c();    
    }
     
    public void getEventDetails()
    {
       
        
        returnList1 = new List<QR_BoothPersonnel__c>();
        objBothAdmin1=null;
        system.debug('eventName'+eventName);
     if(eventName != null)  { 
     returnList1  =  [ Select   g.BoohtPersonnel_Designation__c,g.BoothAdmin_Id__c,
                            g.BoothPersonnel_EmailId__c,g.BoothPersonnel_FirstName__c,
                            g.BoothPersonnel_LastName__c,g.BoothAdmin_Id__r.Name,g.Event_HostedByEventBrite__c,
                            g.Name,g.isActive__c,Random_Number__c,g.BoothAdmin_Id__r.Event_Id__r.Event_Title__c
                          From QR_BoothPersonnel__c g where g.id=:eventName];
        displayPopUp= true;
        }
     /**   for(QR_BoothPersonnel__c emEvent :bothAdminList1)
        {
            if(eventName!= null && eventName !='' && eventName.equals(emEvent.id))
            {
            system.debug('phaniiiiiiiiiiii '+emEvent);
                returnList1.add(emEvent);
                displayPopUp= true;
                break;
            }
        }**/
        
    }

   
    
   public string sd{get;set;}
    
    public Pagereference savePopupValues()
    {
       
     List<QR_BoothPersonnel__c> boothPer = new List<QR_BoothPersonnel__c>();
      boothPer =[select Name,BoothPersonnel_EmailId__c,BoothPersonnel_FirstName__c,BoothPersonnel_LastName__c from QR_BoothPersonnel__c  where  BoothPersonnel_EmailId__c = :objBothAdmin1.BoothPersonnel_EmailId__c and BoothAdmin_Id__r.BoothAdmin_EmailId__c =:userInfo.getUserName() and BoothAdmin_Id__r.Event_Id__r.Name =:selEventName limit 1];
      
      if(!boothPer.isEmpty()){
         ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,'Email Already Existed'));
           return null;
       }
       
       else{
      system.debug('event Nameeeeeeeeeeeeee '+selEventName);
   List<QR_BoothAdmin__c> boothAdminBP = new List<QR_BoothAdmin__c>();
     boothAdminBP = [select id,BoothAdmin_EmailId__c from QR_BoothAdmin__c where BoothAdmin_EmailId__c =:userInfo.getUserName()and Event_Id__r.Name =:selEventName];
    system.debug('ggggggggggggggggggggggggggggggggggggg'+boothAdminBP);
    if(!boothAdminBP.isEmpty()){
       objBothAdmin1.BoothAdmin_Id__c=boothAdminBP[0].id;
       objBothAdmin1.isActive__c =true;
       GenerateRandomNumber gn = new GenerateRandomNumber();
       objBothAdmin1.Random_Number__c = gn.GenerateRandomNumber();
       system.debug('hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii'+objBothAdmin1);
       insert objBothAdmin1;
       sd = objBothAdmin1.id;   
            
       QR_BoothPersonnel__c boothPersonid = [select Random_Number__c,Name,BoothPersonnel_EmailId__c,BoothPersonnel_FirstName__c,BoothPersonnel_LastName__c from QR_BoothPersonnel__c  where id =:sd];  
        
        /** double d =math.random();
          system.debug('%%%%%%%%%%%%%%%%%%%%%%% '+ d );
          system.debug('############################'+ string.valueOf(d).substring(4,7) );
          system.debug('&&&&&&&&&&&&&&&&&&&&&&&&& '+string.valueOf(boothPersonid.Name).substring(7));
          system.debug('******************** '+boothPersonid);
         
          
          boothPersonid.Random_Number__c =string.valueOf(d).substring(4,7)+string.valueOf(boothPersonid.Name).substring(7);
          update boothPersonid;
        
         **/
        
        
     string firstNameForEmail =boothPersonid.BoothPersonnel_FirstName__c;
     string lastNameForEmail =boothPersonid.BoothPersonnel_LastName__c ;
     string emailIdForEmail =boothPersonid.BoothPersonnel_EmailId__c;
      string nameIdForEmail =boothPersonid.Name;
     string ff = nameIdForEmail;
     string boothPersonalId =boothPersonid.Random_Number__c;
     String emailMessage =  'Dear '+firstNameForEmail +' '+lastNameForEmail+','+'<br/><br/>'+
     'Congratulations!!'+'<br />'+'Your booth admin has created an id for your mobile app.'+'<br />'+
     'Booth Leads supports iPhone and Android apps.'+'<br />'+'<br /><br />'+'Please visit http://www.boothleads.com to download your mobile app.'+'<br /><br />'+
     'Please note that you will have 30 days of access to the leads at Boothleads.com portal after the event.'+'<br />'+
   'Please export your leads to a csv file prior to the expiration of your access.'+'<br /><br />'+

'Your booth User ID is: '+boothPersonalId +'<br /><br />'+'Thank you!'+ 
'<br />'+'BoothLeads Customer Support' ;
       
       
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            
             String[] toAddresses = new String[] {emailIdForEmail};
             
             mail.setToAddresses(toAddresses);
             mail.setSubject('Booth User ID has been created successfully!');
             mail.setPlainTextBody(emailMessage);
             mail.setHtmlBody(emailMessage);
            
             Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
             system.debug(objBothAdmin);
       
        displayPopUpForAdd = false;
       
    /**   Pagereference pg = new Pagereference('/apex/QRCode_Boothadmin_Personnelsmultievent');
        pg.setredirect(true);
        return pg;
       **/
      
     
       }else{
       
       }
       }
      
       getBoothAdminDetails();
      
    return null;
       
    }
    
    
    
    
    
    
    public void addAttendees()
    {   
        system.debug('eventName=========:::' +eventName);
        popupLabelName ='';
        //objBothAdmin= new QR_BoothAdmin__c();
       objBothAdmin1= new QR_BoothPersonnel__c();
        popupLabelName ='Add Booth User';
        displayPopUpForAdd =true;
    }
    
    public pageReference deleteAdminRecord()
    {
        system.debug('eventName=========:::' +eventName);
        objBothAdmin1=[select id from  QR_BoothPersonnel__c where id=:eventName];
        
       
        if(objBothAdmin1 != null)
        {
          
            objBothAdmin1.isActive__c =false;
            update objBothAdmin1;
            getBoothAdminDetails();
        }
        
     /**   pageReference pg = new pagereference('/apex/QRCode_Boothadmin_PersonnelsMultiEvent');
        pg.setRedirect(true);
        return pg;**/
        return null;
    }
    
    public void editAttendees()
    {   
        system.debug('eventName=========:::' +eventName);
        objBothAdmin= new QR_BoothAdmin__c();
        objBothAdmin1= new QR_BoothPersonnel__c();
           
            if(eventName!= null && eventName !='')
            {
                 displayPopUpForAdd2 =true; 

               
                objBothAdmin1=[Select   g.BoohtPersonnel_Designation__c,g.BoothAdmin_Id__c,
                            g.BoothPersonnel_EmailId__c,g.BoothPersonnel_FirstName__c,
                            g.BoothPersonnel_LastName__c,g.BoothAdmin_Id__r.Name,g.Event_HostedByEventBrite__c,
                            g.Name 
                          From QR_BoothPersonnel__c g where g.id=:eventName limit 1];
               
            }
         
        
    }
    //---------------Help-------------------
    Public Boolean HelpPopUp{get;set;}
    Public void Help(){
    HelpPopUp = True;
    }
    Public Void CloseHelppopup(){
    HelpPopUp = false;
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
                 
            
            
            
       QR_Eventadmin__c  rrr = new QR_Eventadmin__c(
       EventAdmin_FirstName__c='testEvenfirstnametAdmin',EventAdmin_LastName__c='testEvenLastname',EventAdmin_EmailId__c='phani***@gmail.com');    
       insert rrr;
            
                 
                 
                 
                  
       QR_Eventadmin__c  h = new QR_Eventadmin__c(
       EventAdmin_FirstName__c='testEvenfirstnametAdmin',EventAdmin_LastName__c='testEvenLastname',EventAdmin_EmailId__c=u.Email,User_ID__c=u.Id);    
       insert h;
     
     QR_Event__c x = new QR_Event__c(Event_Title__c='testEvent',Event_HostingTimeZone__c='Eastern Time(USA)',Eventadmin_Id__c=h.id,Start_Date__c =date.parse('05/22/2012'),End_Date__c=date.parse('05/29/2012'));
     insert x;
     
     QR_AttendeeSummary__c e = new QR_AttendeeSummary__c(Attendee_FirstName__c='testattendeesummaryfirstname',Attendee_LastName__c='testattendeelastname',Attendee_EmailId__c='test123@noemail.com',Attendee_Company__c='testattendeecompany');
     
            insert e;          
            system.debug('hiiiiii'+e);  
            
            QR_BoothAdmin__c t = new QR_BoothAdmin__c(BoothAdmin_FirstName__c='testboothadminfirstname',BoothAdmin_Organization_Name__c='testboothadminorganiname',BoothAdmin_LastName__c='testboothlastmname',BoothAdmin_EmailId__c='test123@noemail.com',Event_Id__c=x.id);
            insert t;
            
            
           QR_Report__c y = new QR_Report__c (QR_BoothAdmin__c=t.id,QR_Eventadmin__c=h.id); 
           insert y;
    
           account a = new account(name ='testName');
           insert a;
    
              QR_BoothPersonnel__c  q = new  QR_BoothPersonnel__c(BoothAdmin_Id__c=t.id,BoothPersonnel_FirstName__c='testboothpersonelfirstname',BoothPersonnel_LastName__c='testboothpersonellastname',BoothPersonnel_EmailId__c='test@gmail.com');
           insert q;
         
            QR_BoothPersonnel__c  z = new  QR_BoothPersonnel__c(BoothAdmin_Id__c=t.id,BoothPersonnel_FirstName__c='testboothpersonelfirstname',BoothPersonnel_LastName__c='testboothpersonellastname',BoothPersonnel_EmailId__c='test22@gmail.com');
           insert z;
              pageReference p = Page.QRCode_Boothadmin_Personnels;
              Test.setCurrentPage (p);
             
              List<QR_BoothPersonnel__c> tt = new LIst<QR_BoothPersonnel__c>();
              tt.add(q);
               
              QRCode_Boothadmin_PersonnelsmultiEveCon o = new QRCode_Boothadmin_PersonnelsmultiEveCon();
              o.eventName='t.id'; o.Reportsaction();o.AttendeesAction(); o.Customeraction();  o.EventAction();
               p.getParameters().put('EventID',t.id); o.loginUser =u.id; o.getBoothAdminDetails(); o.closePopup();
               o.closePopup1();o.bothAdminList1 = tt;o.eventName=q.id;o.getEventDetails(); 
               o.bothAdminId = t.id;
               o.objBothAdmin1 = q;
               o.savePopupValues();o.addAttendees(); o.eventName=z.id; o.deleteAdminRecord();
               o.eventName =q.id;
               o.bothAdminList1=tt; 
               o.editAttendees();
               o.escapeSpecialCharacters('phani"kumar<ch');
               o.profileaction();
               o.closePopup3();
               o.objBothAdmin1 =z;
               o.EditPopupValues();
               o.loginUser='test123@noemail.com';
               o.getBoothAdminDetails();
               o.Help();
               o.CloseHelppopup();
               o.boothqrcodeAction();
                system.runas(u){
              
           
                o.checkUserId();
     }
    }
 
    
     
     
     
     
 
   }