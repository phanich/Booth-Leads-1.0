public class EventAdminSignin {


    public pagereference cancel() {
    pagereference pf= new pagereference('/apex/QRcode_EventAdmin_signin');
        pf.setRedirect(true);
        return pf;
 
    }
    
    public pagereference SuccesPopUpclose() {
    pagereference pf= new pagereference('/apex/QRcode_EventAdmin_signin');
        pf.setRedirect(true);
        return pf;
      
    }

    public pagereference Signuppop() {
       Signuppopup = True;
       return null;
    }
    
    public void Onclickback()
    {
       signuppopup = False;
     }  

  
    public PageReference forgotpassword() 
    {
      PageReference pf = new PageReference('/apex/qrcode_forgotpassword');
       pf.setRedirect(true);
        return pf;
    }

    public String Loginname{get; set;}
    public String password {get; set;}
    public Pagereference mallikpg{get; set;}
    Public Boolean SucessPopUp{get;set;}
    public User u{get; set;}
    
    public User userid{get; set;}

    public PageReference login()
     
    {
          password = password.trim();
           Loginname = Loginname.trim(); 
          try{
        userid =[select Name,Profile.Name from user where Username=: Loginname];
        
        System.debug('UserName is'+userid );
        
        }
        
        catch(QueryException ex){
        
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Your login attempt has failed. Make sure the username and password are correct.'));
        return null;
        
        }
         
         //if(userid.Profile.Name !='NJ Admin')
         if(userid.Profile.Name =='Event Admin1'){
         return Site.login(Loginname, password, '/apex/Qrcode_Eventadmin_homepage');        
         }else if(userid.Profile.Name =='Booth Admin1'){
           return Site.login(loginname, password, '/apex/QRCode_BoothadminEventsphmultiEvent');
         }
         else{
          ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'User has no Privileges to access'));
          return null;
       }
       
    }
 
  
       public EventAdminSignin(){
       
              displayerror='';
              signuppopup = False;
              sucessPopUp = False;
             
       }
    
        public static testMethod void testEventAdminSignin  (){
        // Instantiate a new controller with all parameters in the page
        EventAdminSignin  controller = new EventAdminSignin  ();
        controller.Loginname = 'test@salesforce.com';
        controller.password = '123456';
        controller.forgotpassword();        
        System.assertEquals(controller.login(),null);                           
    } 

    public pagereference SignIn()
    {
    
        pagereference pf= new pagereference('/apex/QRcode_EventAdmin_signin');
        pf.setRedirect(true);
        return pf;
    
    
    
    }

    public String FirstName{get; set;}
    public String LastName{get; set;}
    public String Email{get; set;}
    public String Phone{get; set;}
    public String Street{get; set;}
    public String City{get; set;}
    public String State{get; set;}
    public String Country{get; set;}
    public String postalcode{get; set;}
    public String information{get; set;}
    public String UserName{get; set;}
        
    public Account acc{get; set;}
    Public Contact con{get; set;}
    //Public User u{get; set;}
    public Profile p{get; set;}
    Public UserRole r{get; set;}
    //public id UserId{get; set;}
    public String Searchstr{get;set;}
    Public QR_EventAdmin__c EventAdm{get;set;}
    Public QR_EventOrganizationDetails__c EventOrg{get; set;}
    Public string OrgName{get; Set;}
    Public String Website{get; set;}
    Public Boolean Onclickback{get;set;}
    Public Boolean SignupPopup{get;set;}
    Public String POBox{get;set;}
    Public string add1{get;set;}
    public string add2{get;set;}
    Public QR_Report__c EventAdminReports{get;set;}
    public LIST<User> BoothUsers{get; set;}
    public string displayerror{get;set;}
    public boolean booltet{get;set;}
  public boolean Emailvalidation(string s)
  {
  booltet =true;
    BoothUsers = [SELECT Email FROM user]; 
    System.debug('@@@@@@@@@@@@@@@@@@@@'+BoothUsers );  
   for(user u:BoothUsers){
     if(u.Email== Email)
     {
     System.debug('!!!!!!!!!!!!!!!!!!!!!!!!!' +u.email);
    displayerror ='Email already exist';
     booltet = false;
     }     
   System.debug('%%%%%%%%%%%%%%%%%%%%%%%%%%%'+ booltet );
   } 
  return booltet;
  }

    
    public pagereference userRegister()
    
    {
       
     Emailvalidation(Email);
     if(booltet){
       try{
        
       acc = new account();
       acc.Name = 'EventBrite';
       acc.Phone = Phone;
      // acc.email= email;  check it once
        acc.BillingCity = City;
        acc.BillingStreet = Street;
        acc.BillingState = State;
        acc.BillingCountry = Country;
        acc.Billingpostalcode = postalcode;       
        acc.Description = Information;
       
        con = new Contact();
                
        
        con.Phone = phone;
        con.Email= Email;
        con.LastName= LastName;
        con.FirstName= Firstname;
        con.MailingCity = City;
        con.MailingStreet = Street;
        con.MailingState = State;
        con.MailingCountry = Country;
        con.Mailingpostalcode = postalcode;       
        con.WelcomeNote__c='Welcome to BoothLeads.com Event Administration Portal.\n\nYour login details are provided at the end of this email.\n\n\nYou will be asked to set a password when you first login.Passwords are case sensitive.\nIf you forget the password, please use the forgot password link in the login page.\n\n\nTo login, go to http://www.boothleads.com and click on Login.\n\n\nFor assistance, contact us at support@boothleads.com\n\n\nOnce again Welcome to BoothLeads.com\n\n\nThank you,\nBooth Leads Customer Support\nSupport@boothleads.com';
        
       
            
           //p = [Select id, name from profile where UserLicense.Name like 'Customer Portal Manager' Limit 1 ];
        
        
        
       
        con.AccountId = '0019000000CvGXx';
        insert con;
        
        
        EventOrg = new QR_EventOrganizationDetails__c(
        Event_HostingOrganizationName__c = OrgName
        );  
        
        insert EventOrg; 
        
        system.debug('--------Event Organization Details---------'+EventOrg); 
        
        
         Profile p = [Select id, name from profile where Name='Event Admin1'];  
        
        u = new User(
            ContactId = con.Id,
            FirstName = FirstName,
            LastName= Lastname,
            Username = Email,
            Email = Email,
            Alias = 'EventAdm',
            ProfileID = p.id,
            //ProfileID ='00eA0000000axcv',
            PortalRole = 'Executive', 
            LocaleSidKey = 'en_US',
            LanguageLocaleKey = 'en_US',
            TimeZoneSidKey = 'America/Los_Angeles',
            EmailEncodingKey='UTF-8'
            
        );
        Database.DMLOptions dmo = new Database.DMLOptions();
        dmo.EmailHeader.triggerUserEmail = true;
        u.setOptions(dmo);
        system.debug('--------Trigger---------'+dmo); 
        try{
        insert u;
        system.debug('--------User Should be Inserted---------'+u);  
        
        
        }catch(Exception ex){
         system.debug('----------------'+ex);
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'License Limit Exceed Deactive the user and "Try Again"'));
        return null;
        }
        
        EventAdm = new QR_EventAdmin__c(
        EventAdmin_FirstName__c = FirstName,
        EventAdmin_LastName__c = LastName,
        EventAdmin_EmailId__c = Email,
        EventHostingOrganization_Id__c = EventOrg.id,
        User_ID__c = u.id
        //EventAdmin_PhoneNumber__c = Phone
        );    
                
        Insert EventAdm;
        
        system.debug('--------Event Admin Should be Inserted---------'+EventAdm);  
        
            EventAdminReports   = new  QR_Report__c(
            QR_Report_Name__c = 'Report By Industry',
            QR_Eventadmin__c = EventAdm.id
            );
                        
            Insert EventAdminReports;
            
            system.debug('--------Event Admin Report By Industry---------'+EventAdminReports); 
            
            EventAdminReports   = new  QR_Report__c(
            QR_Report_Name__c = 'Report By Geography',
            QR_Eventadmin__c = EventAdm.id
            );
                        
            Insert EventAdminReports;
            
            system.debug('--------Event Admin Report By Geography---------'+EventAdminReports); 
            
       }catch(exception e){}       
    
    }else
    {
    return null;
    }
    
   SucessPopUp = true;
   Signuppopup = false;
   return null;
    
    }
//---------------------------------- Test Class ----------------------------- 
   
        static testMethod void test_EventAdminSignin (){
        
        Profile p = [select id,name FROM profile where name='Standard User'];
        
        User us = new User(alias = 'test123', email='test123@noemail.com',
        emailencodingkey='UTF-8',profileid = p.Id, lastname='Testing', languagelocalekey='en_US',
        localesidkey='en_US',country='United States',
        timezonesidkey='America/Los_Angeles', username='test123@noemail.com');
        insert us;
        
        QR_EventOrganizationDetails__c HostingOrg = new QR_EventOrganizationDetails__c(    
        Event_HostingOrganizationName__c = 'Accenture'           
        );
        insert HostingOrg;
    
        system.debug('---$$$$ Insering HostingOrg  $$$----'+HostingOrg);

        QR_Eventadmin__c eventAdmin = new QR_Eventadmin__c(
        EventAdmin_FirstName__c='testEventadminfirstname',
        EventAdmin_LastName__c='testEventadminLastname',
        EventAdmin_EmailId__c='test@test.com',
        User_ID__c=us.Id,
        EventHostingOrganization_Id__c = HostingOrg.id);
    
       insert eventAdmin;
        
        account a=new account(name='govtnm');
        insert a;
        
        
       
        contact c=new contact(lastname='n',accountid = a.id);
        insert c;
        system.debug('cccccccccccccccccccccccccccccc'+c.lastname);
        EventAdminSignin  testsignin=new EventAdminSignin ();
        testsignin.SignIn();
        testsignin.forgotpassword();
        testsignin.Signuppop();
        testsignin.SuccesPopUpclose();
        testsignin.SuccesPopUpclose();
        testsignin.cancel();
        testsignin.Onclickback();               
        testsignin.userRegister();       
        system.runas(us){
        testsignin.userRegister();
     }

}



    
}