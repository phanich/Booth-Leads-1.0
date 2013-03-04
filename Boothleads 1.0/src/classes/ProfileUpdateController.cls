public class ProfileUpdateController {

    public PageReference Profileupdatepage() {
   PageReference pf = new PageReference('/apex/QRcode_Resetpassword');
    //PageReference pf = new PageReference('/apex/ChangePassword123');
       pf.setRedirect(true);
        return pf;
    }


    public PageReference Reportsaction() {
    Pagereference pg = new Pagereference('/apex/QRCode_EventReport');
    pg.setRedirect(true);
    return pg;
        
    }


    public PageReference AttendeesAction() {
    Pagereference pg = new Pagereference('/apex/Qr_Booth_attendees');
    pg.setRedirect(true);
    return pg;
        
    }


    public PageReference Customeraction() {
    Pagereference pg = new Pagereference('/apex/QRCode_Eventadmin_Boothadmin');
    pg.setRedirect(true);
    return pg;
        
    }


    public PageReference EventAction() {
    Pagereference pg = new Pagereference('/apex/QRCode_EventAdmin_HomePage');
    pg.setRedirect(true);
    return pg;
        
    }
  

    Public QR_EventOrganizationDetails__c EventOrgDetails{get;set;}
    Public QR_Eventadmin__c EventAdmin{get;set;}
    Public QR_event__c Events{get;set;}
    Public User EventAdminUser{get;set;}
    Public Id userId{get;set;}
    
    
    public Pagereference checkUserId()
   {
   
       System.debug('RRRRRRRRRRRRRRRRRRRRRRRRRRRRRR'+UserInfo.getUserId());
      
    if(UserInfo.getUserId() == '00590000000zKNlAAM' || UserInfo.getUserId()==null)
    {
                              
       Pagereference pg = new Pagereference('/apex/QRcode_EventAdmin_signin?id=QRCode_extendsDataImport');
             Pg.setredirect(true);
             return pg;

       
    }else {
             return null;
        }

   }
    
    
    
    
    
    
    Public ProfileUpdateController(){
    try{
        userId =UserInfo.getUserId();
          
        //UserId = '005A0000002k18m'; 
             
        EventAdmin = [select id,Eventadmin_Emailid__c,EventHostingOrganization_Id__c,EventHostingOrganization_Id__r.Event_HostingOrganization_PhoneNumber__c,EventHostingOrganization_Id__r.Event_HostingOrganization_WebsiteURL__c,User_ID__c,EventAdmin_FirstName__c,EventAdmin_LastName__c,EventHostingOrganization_Id__r.Event_HostingOrganizationName__c,EventHostingOrganization_Id__r.Event_HostingOrganization_Address1__c,EventHostingOrganization_Id__r.Event_HostingOrganization_Address2__c,EventHostingOrganization_Id__r.Event_HostingOrganization_City__c,EventHostingOrganization_Id__r.Event_HostingOrganization_NewState__c,EventHostingOrganization_Id__r.Event_HostingOrganization_Zipcode__c,EventHostingOrganization_Id__r.Event_HostingOrganization_POBox__c,User_ID__r.FirstName,User_ID__r.LastName From QR_Eventadmin__c Where User_ID__c =: UserId];
         
        EventOrgDetails = [select id,Event_HostingOrganizationName__c,Event_HostingOrganization_PhoneNumber__c,Event_HostingOrganization_Address1__c,Event_HostingOrganization_Address2__c,Event_HostingOrganizationDescription__c,Event_HostingOrganization_ZipCode__c,Event_HostingOrganization_WebsiteURL__c,Event_HostingOrganization_City__c,Event_HostingOrganization_NewState__c,Event_HostingOrganization_POBox__c from QR_EventOrganizationDetails__c where id=:EventAdmin.EventHostingOrganization_Id__c];
        
        EventAdminUser = [select id,FirstName,Lastname from User where id=:EventAdmin.User_ID__c];
        
        Events = [select id,Event_HostingOrganization__c from QR_Event__c where Eventadmin_Id__c =:EventAdmin.id];
        
        system.debug('------------------------------------'+Events.Event_HostingOrganization__c);
             
        
        }catch(Exception e){} 
    }
       
        Public Pagereference  ProfileSave(){ //Saving the profile details
        try{
        EventAdmin.EventAdmin_FirstName__c = EventAdmin.EventAdmin_FirstName__c;
        EventAdmin.EventAdmin_LastName__c = EventAdmin.EventAdmin_LastName__c;               
        Update EventAdmin;// Updating EventAdmin Details
        system.debug('..............Updating EventAdmin Obejct...............'+EventAdmin);
        
        EventOrgDetails.Event_HostingOrganizationName__c = EventAdmin.EventHostingOrganization_Id__r.Event_HostingOrganizationName__c ;
        EventOrgDetails.Event_HostingOrganization_PhoneNumber__c = EventAdmin.EventHostingOrganization_Id__r.Event_HostingOrganization_PhoneNumber__c; 
        EventOrgDetails.Event_HostingOrganization_WebsiteURL__c = EventAdmin.EventHostingOrganization_Id__r.Event_HostingOrganization_WebsiteURL__c;
        EventOrgDetails.Event_HostingOrganization_Address1__c = EventAdmin.EventHostingOrganization_Id__r.Event_HostingOrganization_Address1__c;
        EventOrgDetails.Event_HostingOrganization_Address2__c = EventAdmin.EventHostingOrganization_Id__r.Event_HostingOrganization_Address2__c;
        EventOrgDetails.Event_HostingOrganization_City__c = EventAdmin.EventHostingOrganization_Id__r.Event_HostingOrganization_City__c; 
        EventOrgDetails.Event_HostingOrganization_NewState__c = EventAdmin.EventHostingOrganization_Id__r.Event_HostingOrganization_NewState__c;
        EventOrgDetails.Event_HostingOrganization_zipCode__c= EventAdmin.EventHostingOrganization_Id__r.Event_HostingOrganization_ZipCode__c;
        EventOrgDetails.Event_HostingOrganization_POBox__c = EventAdmin.EventHostingOrganization_Id__r.Event_HostingOrganization_POBox__c;
        update EventOrgDetails;// Updating EventOrganization Details
        System.debug('*************Updating EventOrganization Object**********'+EventOrgDetails);
        
        
        Events.Event_HostingOrganization__c = EventAdmin.EventHostingOrganization_Id__r.Event_HostingOrganizationName__c ;
        Update Events;//Updating Events Table
        System.debug('*************Updating Event Object**********'+Events);
        
        
        EventAdminUser.FirstName = EventAdmin.EventAdmin_FirstName__c;
        EventAdminUser.LastName = EventAdmin.EventAdmin_LastName__c;
        Update EventAdminUser;// Updating User Details
        System.debug('------------------Updating UserObject----------------'+EventAdminUSer);
        
        
   }    catch(Exception e){} 
        Pagereference pg = new Pagereference('/apex/Qrcode_Eventadmin_homepage');
        Pg.setredirect(true);
        return Pg;
     /**   return null;**/
} 
         public pagereference ProfileCancel(){
         Pagereference pg = new Pagereference('/apex/QRCode_Eventadmin_Profileupdate');
         Pg.setredirect(true);
         return Pg;
     }
   Public Boolean HelpPopUp{get;set;}
    Public void Help(){
    HelpPopUp = True;
    }
    Public Void CloseHelppopup(){
    HelpPopUp = false;
    } 
//----------------------------------Test Class --------------------------     
static testmethod void test_ProfileUpdateController(){

    Profile p = [select id FROM profile where name='Standard User'];

    User u = new User(alias = 'test123', email='test123@noemail.com',
    emailencodingkey='UTF-8',profileid = p.Id, lastname='Testing', languagelocalekey='en_US',
    localesidkey='en_US',country='United States',
    timezonesidkey='America/Los_Angeles', username='test123@noemail.com');

    insert u;
    
    system.debug('---$$$$ Insering User $$$----'+u);
    
    QR_EventOrganizationDetails__c HostingOrg = new QR_EventOrganizationDetails__c(    
    Event_HostingOrganizationName__c = 'Accenture'           
    );
    insert HostingOrg;
    
    system.debug('---$$$$ Insering HostingOrg  $$$----'+HostingOrg);
    
    QR_Eventadmin__c eventAdmin = new QR_Eventadmin__c(
    EventAdmin_FirstName__c='testEventadminfirstname',
    EventAdmin_LastName__c='testEventadminLastname',
    EventAdmin_EmailId__c=u.Email,
    User_ID__c=u.Id,
    EventHostingOrganization_Id__c = HostingOrg.id
    );
    
    insert eventAdmin;
    
    system.debug('---$$$$ Insering eventAdmin   $$$----'+eventAdmin );
    
    QR_Event__c event  = new QR_Event__c(Event_Title__c='testEvent',
    Event_HostingTimeZone__c='Eastern Time(USA)',
    End_Date__c=date.valueOf('2012-05-15 00:00:00'),
    Start_Date__c=date.valueOf('2012-05-11 00:00:00'),
    Eventadmin_Id__c=eventAdmin.id);
    insert event;
    
    system.debug('---$$$$ Insering event  $$$----'+event );
    
    

    
    ProfileUpdateController  Profile = new ProfileUpdateController ();
    Profile.Userid = u.id;
    Profile.Profileupdatepage();
    Profile.Reportsaction();
    Profile.AttendeesAction();
    Profile.Customeraction();
    Profile.EventAction();
    Profile.ProfileSave();             
    Profile.ProfileCancel();
    Profile.checkUserId();
    Profile.Help();
    Profile.CloseHelppopup();
    
    
        
}       
}