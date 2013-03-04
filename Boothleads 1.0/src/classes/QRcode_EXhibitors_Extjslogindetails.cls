public class QRcode_EXhibitors_Extjslogindetails{
    
    public boolean DupUserName{get;set;}
    public Boolean xyz{get;set;}
    public Boolean display{get;set{display=False;}}
    Public string Searchstr{get; set;}
    Public Boolean  userpopup{get; set;}
    public Boolean onclickback { get; set{ onclickback=FALSE;  } }
    public LIST<QR_Event__c> event1{get; set;} 
    public List<SelectOption> AllEvents{get; set;}
    public Qr_Boothadmin__c admin{get;set;}
    public Id sel{get;set;}
    public String user_username{get;set;}
    public String user_Information { get; set; }
    public String user_Restaurant { get; set; }
    public String user_Email { get; set; }
    public String user_Mobile { get; set; }
    public String user_zip { get; set; }
    public String user_State { get; set; }
    public String user_city { get; set; }
    public String user_Phone { get; set; }
    public String user_Last_Name { get; set; }
    public String user_First_Name { get; set; }
    public string x {get;set;}
    public String UserName{get; set;}
    public List<QR_BoothAdmin__c> BoothDetails{get;set;}
    public List<QR_BoothAdmin__c> BoothDetails1{get;set;}
    public List<QR_BoothAdmin__c> Boothallusers{get;set;}
    public List<QR_BoothAdmin__c>  Boothinactusers {get;set;}
    Public String OrgPoBox{get;set;}
    Public Boolean displaypopup{get;set;}
    Public QR_Event__c Eventadm{get; set;}
    Public QR_BoothAdmin__c BoothAdmin{get;set;}
    Public List<QR_BoothAdmin__c> BoothAdminList{get;set;}
    Public String OrgName{get;set;}
    Public String OrgWebsiteURL{get;set;}
    Public String OrgDes{get;set;} 
    Public String Add1{get;set;}
    Public String Add2{get;set;}
    Public Boolean EditExhibitorPopUp{get;set;}
    public QR_Event__c MEventstotal{get; set;}
    Public Boolean DisplayBAdminInfoPopup {get;set;}
    Public Boolean ValEmail{get;set;}
    Public String EmailErrorMesg{get;set;}
    Public List<selectoption> options{get;set;}
    Public String select1{get;set;}
    Public QR_Report__c Reports{get;set;}  
    public Account acc{get; set;}
    Public Contact con{get; set;}
    Public User u{get; set;}
    public LIST<User> BoothUsers{get; set;}
    public Profile p{get; set;}
    Public UserRole r{get; set;}
    public id UserId{get; set;}
    public LIST<string> ActiveUsers {get;set;}
    public LIST<string> InActiveUsers{get;set;}
    public List<innerforboothdisplay> innercls{get;set;}
    Public Boolean CatchMsg{get;set;}
    Public string select3{get;set;}
    Public List<selectoption> option4{get;set;}
    Public string[] StatusValue{get;set;}
    Public Boolean statusPopUp{get;set;}
    Public string PopUpDStatus{get;set;}
    public string displayerror{get;set;}
    Public string EventName{get;set;}
    public boolean booltet{get;set;}
    Public string FaxNum{get;set;}
    Public boolean NoEventDisplayboolean{get;set;}
    Public String NoEventDisplay{get;set;}
    
    
    //-------------- *** Tab Navigation ** --------------------
    
    
         public PageReference Dashboardaction() {
         
         pagereference pg = new pagereference('/apex/QRDashboard');
         pg.setRedirect(true);
         return pg;
       
        }
    
        
        Public PageReference ProfileSettings() {
        Pagereference pg = new Pagereference('/apex/Qrcode_EventAdmin_Profileupdate');
        Pg.setredirect(true);
        Return pg;
        }
        public PageReference Reportsaction() {        
        Pagereference pg = new Pagereference('/apex/QRCode_EventReport');
        pg.setRedirect(true);
        return pg;        
        }
        public PageReference Customeraction() {
        pagereference pg = new Pagereference('/apex/QRCode_Eventadmin_Boothadmin');
        pg.setredirect(true);
            return pg;
        }    
        public PageReference AttendeesAction() {
        Pagereference pg = new Pagereference('/apex/Qr_Booth_attendees');
        Pg.setredirect(true);
        return pg;
        }
        public PageReference EventAction() {
        Pagereference pg = new Pagereference('/apex/Qrcode_Eventadmin_homepage');
        Pg.setredirect(true);
        return pg;       
        }
        
        public PageReference ImportBoothAdmin() {
            if(sel == null)
              {
                  NoEventDisplay = 'Please create an Event';
                  NoEventDisplayboolean = True;
                  return null;
          
              }else
              {
                Pagereference pg = new Pagereference('/apex/QRcode_BoothAdminImport');
                Pg.setredirect(true);           
                return pg;
             }       
        }
    // --------------------------**** END **** ----------------------
    //------------------------------------ ADD Exhibitor -------------------------
    public void Add_Exhibitor() {
       
          if(sel == null)
          {
          NoEventDisplay = 'Please create an Event';
          NoEventDisplayboolean = True;
          
        }else
          {
           userpopup = TRUE;
            // ApexPages.addMessage(new ApexPages.message(ApexPages.severity.Info,'Please Create an Event'));
          }   
          
         
        }
    //--------------------------------- END ---------------------------------------
    
    
    //-------------------------- ** CANCEL POPUP'S -------------------
    
        public pageReference Canclepopup() {    
        pagereference pg = new Pagereference('/apex/QRCode_Eventadmin_Boothadmin');
        pg.setredirect(true);
        return pg;         
        }
        public void cancel2() {    
        DisplayBAdminInfoPopup = False;
        }
        public pagereference Cancle1() {
        pagereference pg = new Pagereference('/apex/QRCode_Eventadmin_Boothadmin');
        pg.setredirect(true);
        return pg;
        //EditExhibitorPopUp = false;
        }
        public PageReference Cancelstatus() {
        Statuspopup = false;
        return null;
        }
    //------------------------------- *** END *** --------------------
    
        public pagereference Cancle() {
        pagereference pg = new Pagereference('/apex/QRCode_Eventadmin_Boothadmin');
        pg.setredirect(true);
        return pg;
        //userpopup = False;
             
        }
    
      public void onclickback()
        {
            userpopup = FALSE;
            
        }
    //--------------------------------------------END--------------------------------
    
    
        public List<selectOption> getStates(){
              
        options = new List<SelectOption>();
        options.add(new SelectOption('NONE','None'));
        options.add(new SelectOption('AL','Alabama'));
        options.add(new SelectOption('AZ','Arizona'));
        options.add(new SelectOption('AR','Arkansas'));
        options.add(new SelectOption('CA','California'));
        options.add(new SelectOption('CO','Colorado'));
        options.add(new SelectOption('CT','Connecticut'));
        options.add(new SelectOption('DE','Delaware'));
        options.add(new SelectOption('DC','District of Columbia'));
        options.add(new SelectOption('FL','Florida'));
        options.add(new SelectOption('GA','Georgia'));
        options.add(new SelectOption('HI','Hawaii'));
        options.add(new SelectOption('ID','Idaho'));
        options.add(new SelectOption('IL','Illinois'));
        options.add(new SelectOption('IN','Indiana'));
        options.add(new SelectOption('IA','Iowa'));
        options.add(new SelectOption('KS','Kansas'));
        options.add(new SelectOption('KY','Kentucky'));
        options.add(new SelectOption('LA','Louisiana'));
        options.add(new SelectOption('ME','Maine'));
        options.add(new SelectOption('MD','Maryland'));
        options.add(new SelectOption('MA','Massachusetts'));
        options.add(new SelectOption('MI','Michigan'));
        options.add(new SelectOption('MN','Minnesota'));
        options.add(new SelectOption('MS','Mississippi'));
        options.add(new SelectOption('MO','Missouri'));
        options.add(new SelectOption('MT','Montana'));
        options.add(new SelectOption('NE','Nebraska'));
        options.add(new SelectOption('NV','Nevada'));
        options.add(new SelectOption('NH','New Hampshire'));
        options.add(new SelectOption('NJ','New Jersey'));
        options.add(new SelectOption('NM','New Mexico'));
        options.add(new SelectOption('NY','New York'));
        options.add(new SelectOption('NC','North Carolina'));
        options.add(new SelectOption('ND','North Dakota'));
        options.add(new SelectOption('OH','Ohio'));
        options.add(new SelectOption('OK','Oklahoma'));
        options.add(new SelectOption('OR','Oregon'));
        options.add(new SelectOption('PA','Pennsylvania'));
        options.add(new SelectOption('RI','Rhode Island'));
        options.add(new SelectOption('SC','South Carolina'));
        options.add(new SelectOption('SD','South Dakota'));
        options.add(new SelectOption('TN','Tennessee'));
        options.add(new SelectOption('TX','Texas'));
        options.add(new SelectOption('UT','Utah'));
        options.add(new SelectOption('VT','Vermont'));
        options.add(new SelectOption('VA','Virginia'));
        options.add(new SelectOption('WA','Washington'));
        options.add(new SelectOption('WV','West Virginia'));
        options.add(new SelectOption('WI','Wisconsin'));
        options.add(new SelectOption('WY','Wyoming'));
        return options;
        }     
    
    //------------------------------ Page Loader -------------------------------------
    
        public Pagereference checkUserId()
       {
       
           System.debug('RRRRRRRRRRRRRRRRRRRRRRRRRRRRRR'+UserInfo.getUserId());
          
        if(UserInfo.getUserId() == '00590000000zKNlAAM' || UserInfo.getUserId()==null)
        {
                                  
           Pagereference pg = new Pagereference('/apex/QRcode_EventAdmin_signin?id=QRCode_Eventadmin_Boothadmin');
                 Pg.setredirect(true);
                 return pg;
    
           
        }else {
                 return null;
            }
    
       }
    
    
    
    
    
    //------------------------------ CONSTRUCTOR -------------------------------------    
      
         Public QRcode_EXhibitors_Extjslogindetails (){ 
          
          try{ 
               
            option4 = new List<selectoption>();
            Option4.add(new Selectoption('Active','Active'));
            Option4.add(new Selectoption('Inactive','Inactive'));
     
                 displayerror='';
                
                
                DisplayBAdminInfoPopup = False;
                
                EditExhibitorPopUp = False;
                 
                userId =UserInfo.getUserId();
    
               //UserId = '005A0000002joxz';
                  
                MEventstotal= new QR_Event__c();
                   
                   
                MEventsTotal = [Select id,Name,Event_Title__c FROM QR_Event__c where EventAdmin_id__r.User_ID__c =: Userid LIMIT 1];
                   
                Sel = MEventsTotal.id;
                  
                  
                  
                Allevents = new List<selectoption>();
                
                System.debug('-----------------------------------------'+ Allevents );
                Allevents.add(new SelectOption('NONE','--NONE--'));
               for(QR_Event__c e:[select e.id,e.Event_title__c from QR_Event__c e where EventAdmin_ID__r.User_ID__c =:Userid])
                       {
                         
                        Allevents.add(new SelectOption(e.Id,e.Event_title__c));
            
                } 
                 System.debug('hello 222222222222222222222222222222222222222222222222222222222222'+ Allevents );
              
           Eventadm = [select id,EventAdmin_Id__r.EventHostingOrganization_Id__r.Event_HostingOrganizationName__c,EventAdmin_Id__r.EventHostingOrganization_Id__r.Event_HostingOrganization_Address1__c,EventAdmin_Id__r.EventHostingOrganization_Id__r.Event_HostingOrganization_Address2__c from QR_Event__c where EventAdmin_ID__r.User_ID__c =: UserId LIMIT 1 ];
       
        
        System.debug('hello 333333333333333333333333333333333333333333333333333333333333333333'+ Eventadm );
       
        getBoothAdmin();
        
    }
    catch(Exception e){}    
    }
    
    //---------------------------------------------- END ------------------------------------------------------
     
     
          Public void getBoothAdmin(){
       
          innercls = new  List<innerforboothdisplay>(); 
          
          BoothDetails =[Select id,BoothAdmin_Organization_Address1__c,BoothAdmin_Organization_WebsiteURL__c,BoothAdmin_Organization_NewState__c,
          BoothAdmin_Organization_PhoneNumber__c,BoothAdmin_FaxNumber__c,BoothAdmin_IsActive__c,BoothAdmin_Organization_POBox__c,BoothAdmin_FirstName__c,BoothAdmin_Organization_City__c,
          BoothAdmin_LastName__c,BoothAdmin_Organization_Name__c,BoothAdmin_EmailId__c,BoothAdmin_Organization_Address2__c,NewBoothAdmin_Organization_Description__c,
          BoothAdmin_Organization_ZipCode__c FROM QR_BoothAdmin__c WHERE Event_Id__c =: MEventsTotal.id ];
          
          BoothDetails1 =[Select id,BoothAdmin_Organization_Address1__c,BoothAdmin_Organization_WebsiteURL__c,BoothAdmin_Organization_NewState__c,
          BoothAdmin_Organization_PhoneNumber__c,BoothAdmin_FaxNumber__c,BoothAdmin_IsActive__c,BoothAdmin_Organization_POBox__c,BoothAdmin_FirstName__c,BoothAdmin_Organization_City__c,
          BoothAdmin_LastName__c,BoothAdmin_Organization_Name__c,BoothAdmin_EmailId__c,BoothAdmin_Organization_Address2__c,NewBoothAdmin_Organization_Description__c,
          BoothAdmin_Organization_ZipCode__c FROM QR_BoothAdmin__c WHERE Event_Id__c =: MEventsTotal.id ];
          
          for(QR_BoothAdmin__c kk:BoothDetails ){
          
          kk.BoothAdmin_FirstName__c = escapeSpecialCharacters(kk.BoothAdmin_FirstName__c);
          kk.BoothAdmin_LastName__c = escapeSpecialCharacters(kk.BoothAdmin_LastName__c);
          kk.BoothAdmin_Organization_Name__c = escapeSpecialCharacters(kk.BoothAdmin_Organization_Name__c);
          kk.BoothAdmin_Organization_City__c = escapeSpecialCharacters(kk.BoothAdmin_Organization_City__c);
     
          innercls.add(new innerforboothdisplay(kk));
         /** innerforboothdisplay kk = new innerforboothdisplay();
          kk.gy=j;
          innercls.add(kk);**/
          }  
              System.debug('===========++++++++========='+ BoothDetails );
    }    
    
    //-------- Method For Returning Inner Class--------------
         
        public List<innerforboothdisplay> getBoothadmins(){
        return innercls;       
        }
    //------------- END -------------------------------------
    
    //-------------- INNER CLASS ---------------
        
      public class innerforboothdisplay{
      public string s{get;set;}
      public QR_BoothAdmin__c gy{get;set;}
      public boolean selectval{get;set;}
      public innerforboothdisplay(QR_BoothAdmin__c gy)
      {
      this.gy=gy;
       //gy=new QR_BoothAdmin__c ();
     // this.selectval =s;
     if(gy.BoothAdmin_IsActive__c == true)
     {
        this.s='Active';
     }
     else
     {
       this.s='InActive';
     }
      }
      
      }
    
    //---------------- END ---------------------------------
    
    //------------------ EMAI VALIDATION --------------------   
      public boolean Emailvalidation(string s)
      {
        booltet =true;
        BoothUsers = [SELECT Email FROM user];   
       for(user u:BoothUsers){
         if(u.Email == user_Email)
         {
            displayerror ='Email already exist';
            booltet = false;
         }
       } 
      return booltet;
      }
        
    //------------------- *** END ***-------------------------
    
    //------------------------ SAVEING AN EXHIBITOR -------------------
      
    public PageReference saveaction() {
        
          Emailvalidation(user_email);
            
        if(booltet){
                  try{   
                        acc = new account();
                        acc.Name = 'EventBrite';
                        acc.Phone = User_Phone;
                        
                        //insert acc;
                        system.debug('inserting account'+ acc);
                               
                        String searchUser =user_Email;
                         
                        system.debug('####################acc.id,########'+ acc);
                        
                  
                        //Profile profile = [select Id from Profile where Name='Booth Admin'];
                        Profile profile = [select Id from Profile where Name='Booth Admin1'];
                        Contact contact = new Contact(AccountId ='0019000000CvGXx',
                        LastName = user_Last_Name,
                        FirstName = user_First_Name,
                        Phone =user_Phone,
                        WelcomeNote__c='Congratulations!!\nYour login for your Booth Admin Portal was successfully created.\n\nPlease visit http://www.boothleads.com to login to your Booth Admin Portal.\n\n If you have multiple attendees from your company, please login to web portal and create a \n " booth user "  for each additional person attending the event.\n This enables every one from your company  or  agency in attendance  to download and access the app. \n\n Please note that you will have 30 days of access to the leads at Boothleads.com portal after the event.\n\nPlease export your leads to a csv file prior to the expiration of your access.\n\nIf you have any questions, please contact your Event Administrator.\n\n\nThank you!\nBoothLeads Customer Support\nsupport@boothleads.com');
                        
                        insert contact;
                        
                        system.debug('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'+ contact);
                
                
                        string df = string.valueOf(user_Email);
                        integer i = df.indexOf('@');
                        string ght = df.substring(0,5);
                  
                        System.debug('UserName'+user_Email);
                        User user = new User(ContactId = contact.id,
                        Username = user_Email,
                        Email =user_Email,
                        firstname = User_First_name,
                        LastName = user_Last_name,
                        Alias ='BAdmin',
                        ProfileID =profile.Id,
                        //PortalRole = 'Manager',
                        LocaleSidKey ='en_US',
                        LanguageLocaleKey ='en_US',
                        TimeZoneSidKey ='America/Los_Angeles',
                        EmailEncodingKey='UTF-8',
                        city = user_city,
                        state = user_state,
                        phone=user_Phone);
                        Database.DMLOptions dmo = new Database.DMLOptions();
                        dmo.EmailHeader.triggerUserEmail = true;
                        user.setOptions(dmo);
                        //user.PortalRole ='Manager';
                        system.debug('$$$$$$$$$$$$$$$$$$$$$$,$$$$$$$$$$$$$$$$$$$$$$');
                      try{
                        insert user;
                        system.debug('----------------inserting User-----------'+user);
                        }catch(Exception e){
                        system.debug('----------------'+e);
                        ApexPages.addMessages(e);
                        //ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'License Limit Exceed'));
                        return null;
                        }  
                
                    
                    QR_BoothAdmin__c BoothAdmin = new QR_BoothAdmin__c();
                   
                    BoothAdmin.BoothAdmin_FirstName__c = User_First_name;
                    BoothAdmin.BoothAdmin_LastName__c  = user_Last_name;
                    BoothAdmin.BoothAdmin_EmailId__c = user_Email;
                    BoothAdmin.BoothAdmin_Organization_Address1__c = Add1;
                    BoothAdmin.BoothAdmin_Organization_Address2__c = Add2;
                    BoothAdmin.BoothAdmin_Organization_City__c = user_city;
                    BoothAdmin.NewBoothAdmin_Organization_Description__c = OrgDes; 
                    BoothAdmin.BoothAdmin_Organization_Name__c = OrgName;
                    BoothAdmin.BoothAdmin_Organization_PhoneNumber__c = user_Phone;
                    BoothAdmin.BoothAdmin_FaxNumber__c = FaxNum;
                    if(select1 != 'none')
                    BoothAdmin.BoothAdmin_Organization_NewState__c =select1;
                    BoothAdmin.BoothAdmin_Organization_WebsiteURL__c = OrgWebsiteURL;
                    BoothAdmin.BoothAdmin_Organization_ZipCode__c = user_zip;
                    BoothAdmin.BoothAdmin_Organization_POBox__c = OrgPOBox;
                    BoothAdmin.Event_Id__c = Sel;
                    //BoothAdmin_Organization_Name__c = EventAdm.EventAdmin_Id__r.EventHostingOrganization_Id__r.Event_HostingOrganizationName__c   
                  try{
                    Insert BoothAdmin;
                    }catch(Exception e){
                    Apexpages.addmessages(e);
                    
                    }
                    system.debug('-----BoothAdmin should be Inserted-----'+BoothAdmin);
                    
                    QR_BoothPersonnel__c BoothPersonnel = new QR_BoothPersonnel__c(
                    BoothAdmin_Id__c = BoothAdmin.id,
                    BoothPersonnel_EmailId__c = BoothAdmin.BoothAdmin_EmailId__c,
                    BoothPersonnel_FirstName__c = BoothAdmin.BoothAdmin_FirstName__c,
                    BoothPersonnel_LastName__c = BoothAdmin.BoothAdmin_LastName__c
                    
                    );
                  try{  
                  GenerateRandomNumber gn = new GenerateRandomNumber();
                  BoothPersonnel.Random_Number__c=gn.GenerateRandomNumber();
                    insert BoothPersonnel;
                    
                   }catch(exception e){
                   Apexpages.addmessages(e);
                   
                   } 
                    system.debug('-----BoothPersonnel should be Inserted-----'+BoothPersonnel);
                    
                  QR_BoothPersonnel__c BpId = [select Id,BoothPersonnel_FirstName__c,BoothPersonnel_LastName__c,BoothPersonnel_EmailId__c,Name from QR_BoothPersonnel__c where id =:BoothPersonnel.id]; 
                
                system.debug('---------@@@@@@@ After Inserting BoothPersonnel retriving the details ---------- @@@@@@@'+BpId);
                
                string Firstnametomail = BpId.BoothPersonnel_FirstName__c;
                string Lastnametomail = BpId.BoothPersonnel_LastName__c;
                string EmailIdtimail = BpId.BoothPersonnel_EmailId__c;
                string MobileIdtomail = BpId.name;
                
                string  tosendid = MobileIdtomail;
                //string totrimtheid = tosendid.substring(6,10);
                //string totrimtheid = tosendid.substring(6);
                //system.debug('---------to Find what will be the output$$$$$$$$$$$ -------'+totrimtheid);
                //string fromtrimtheid = tosendid.substring(10,17); 
                //system.debug('---------to Find what will be the output####### -------'+fromtrimtheid);
                string Personnelidtosend = BoothPersonnel.Random_Number__c;
                // system.debug('---------to Find what will be the output####### -------'+Personnelidtosend );
                
                String emailMessage =  'Dear '+Firstnametomail+' '+Lastnametomail+','+'<br/><br/>'+
               'Congratulations!!'+'<br />'+'Your Id for mobile app:'+Personnelidtosend+'<br />'+
                'Booth Leads supports iPhone and Android apps.'+'<br />'+'<br /><br />'+'Please visit http://www.boothleads.com to download your mobile app.'+'<br /><br />'+
                'Thank you!'+ 
                '<br />'+'BoothLeads Customer Support'+'<br/>'+'support@boothleads.com' ;
                
                
                 
                 Messaging.singleEmailMessage Mail = new Messaging.singleEmailMessage();
                 string [] toAddresses= new string[]
                 {
                     EmailIdtimail
                 };
                     mail.setToAddresses(toAddresses);
                     mail.setSubject('ID for Mobile App has been created successfully!');
                     mail.setPlainTextBody(emailMessage);
                     mail.setHtmlBody(emailMessage);
                  Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
                 
                    
                
                
                   system.debug('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
                    
                    Reports   = new  QR_Report__c(
                    QR_Report_Name__c = 'Report By Industry',
                    QR_BoothAdmin__c = BoothAdmin.id
                 );
                                        
                    Insert Reports;
                    system.debug('------+++++++++-------------'+Reports);
                            
                    Reports   = new  QR_Report__c(
                    QR_Report_Name__c = 'Report By Geography',
                    QR_BoothAdmin__c = BoothAdmin.id
                    );
                    Insert Reports;
                    system.debug('-------------------'+Reports);
                    
                            
                  }catch(Exception ex){}
                  system.debug('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^');
                  
                  pagereference pf= new pagereference('/apex/QRCode_Eventadmin_Boothadmin');
                    pf.setRedirect(true);
                    return pf;
                   
                   }else{
                   
                   return null;
                   
       } 
     }
     
    //------------------------------ END ----------------------------
    
    //---------------------------------- EXTJS Edit Method -----------------------------------
     public void EditExhibitor()
        {
            system.debug('eventName::::'+eventName);
            
            Admin = new QR_BoothAdmin__c ();
            
            for(QR_Boothadmin__c Admin1 :BoothDetails1 )
            {
                if(eventName!= null && eventName !='' && eventName.equals(Admin1.Id))
                {
                    
                    system.debug('-------+++++++++++-----------'+Admin1.Id);
                   EditExhibitorPopUp = True;
                    Admin = Admin1;
                    break;
                    
                }
              
            }
            
           EditBoothadmin();
        } 
    
         public PageReference EditBoothadmin() {
        
         //EditExhibitorPopUp = True;
         
          //BoothAdmin =[select BoothAdmin_EmailId__c,BoothAdmin_Organization_POBox__c,BoothAdmin_FirstName__c,BoothAdmin_LastName__c,BoothAdmin_Organization_Address1__c,BoothAdmin_Organization_Address2__c,BoothAdmin_Organization_City__c,BoothAdmin_Organization_Description__c,BoothAdmin_Organization_Name__c,BoothAdmin_Organization_PhoneNumber__c,BoothAdmin_Organization_NewState__c,BoothAdmin_Organization_WebsiteURL__c,BoothAdmin_Organization_ZipCode__c  from QR_BoothAdmin__c where id=: Apexpages.currentpage().getparameters().get('editcatid') ];
         
          system.debug('-----------------'+BoothAdmin);
       try{
          select1=Admin.BoothAdmin_Organization_NewState__c;      
          u =[select UserName,firstname,lastname,city,state,email,street,phone,isactive from user where UserName =: Admin.BoothAdmin_EmailId__c  ];
            system.debug('-----------------'+u.UserName );
            system.debug('-----------------'+u.isactive);
       }catch(Exception e){}   
          
        
            return null;
        }
    
    
    
    //---------------------------------- *** END *** -----------------------------------------        
    //------------------------------------- Updating Exhibitor Information ---------------------       
            
           
        
      public Pagereference Updateaction() {
     
      
      Admin.BoothAdmin_FirstName__c = Admin.BoothAdmin_FirstName__c;
      Admin.BoothAdmin_LastName__c = Admin.BoothAdmin_LastName__c;
      Admin.BoothAdmin_EmailId__c = Admin.BoothAdmin_EmailId__c;
      Admin.BoothAdmin_Organization_Address1__c = Admin.BoothAdmin_Organization_Address1__c;
      Admin.BoothAdmin_Organization_Address2__c = Admin.BoothAdmin_Organization_Address2__c; 
      Admin.BoothAdmin_Organization_City__c = Admin.BoothAdmin_Organization_City__c; 
      Admin.NewBoothAdmin_Organization_Description__c = Admin.NewBoothAdmin_Organization_Description__c; 
      Admin.BoothAdmin_Organization_Name__c = Admin.BoothAdmin_Organization_Name__c; 
      Admin.BoothAdmin_Organization_PhoneNumber__c = Admin.BoothAdmin_Organization_PhoneNumber__c; 
      Admin.BoothAdmin_FaxNumber__c = Admin.BoothAdmin_FaxNumber__c;
      Admin.BoothAdmin_Organization_NewState__c = select1;   
      admin.BoothAdmin_Organization_ZipCode__c = admin.BoothAdmin_Organization_ZipCode__c; 
      //Boothadmin.BoothAdmin_Organization_POBox__c = Boothadmin.BoothAdmin_Organization_POBox__c;
      
      Update Admin;
      
      //system.debug('----------Email ID-----------'+u.Email);
      //system.debug('----------Email ID-----------'+ u.UserName);
       
      u.firstname = Admin.BoothAdmin_FirstName__c;
      u.Lastname = Admin.BoothAdmin_LastName__c;
      //u.Email = BoothAdmin.BoothAdmin_EmailId__c;
      
      system.debug('----------Email ID-----------'+u.Email);
      
     // u.UserName = BoothAdmin.BoothAdmin_EmailId__c;
      
      system.debug('----------Email ID-----------'+ u.UserName);
      
      u.Phone = Admin.BoothAdmin_Organization_PhoneNumber__c; 
      u.city = Admin.BoothAdmin_Organization_City__c; 
      u.state = Admin.BoothAdmin_Organization_NewState__c; 
      u.Postalcode = admin.BoothAdmin_Organization_ZipCode__c;
      
       Update U; 
       
       pagereference pf= new pagereference('/apex/QRCode_Eventadmin_Boothadmin');
            pf.setRedirect(true);
            return pf;
           
           
        }
    //------------------------------------ END ------------------------------------ 
       
    //-------------------------- Display Exhibitor Details ------------------------
    Public void Exhibitordetails(){
            system.debug('eventName::::'+eventName);
            
            BoothAdminList = new List<QR_BoothAdmin__c>();
            
            system.debug('---------Hellllllllllllloooooooooooooo--------------');
            
            
            for(QR_BoothAdmin__c BoothAdminInfo :BoothDetails1)
            {
                if(eventName!= null && eventName !='' && eventName.equals(BoothAdminInfo.Id))
                {
                    DisplayBAdminInfoPopup = true;
                     //displaypopup=true;
                     system.debug('---------Heyyyyyyyyyyyyyyyyyyyyyyy--------------'+BoothAdminInfo);
                                    
                    BoothAdminList.add(BoothAdminInfo);
                    
                    system.debug('---------Hellllllllllllloooooooooooooo--------------');
                    
                    break;
                }
                
            }
            
            //return null;
        }
    
    //----------------------------------------- END ------------------------------------
    
    //------------------------------------- Action For Active/Inactive ----------------- 
           
           
            public void ActiveInactive()
            {
            system.debug('eventName::::--------------------------------'+eventName);
            
            statusValue = eventName.split('-');
            
            system.debug('-----------statusvalue0----------'+statusValue[0]);
            
            // system.debug('-----------statusvalue1----------'+statusValue[1]);
            if(statusValue[1] == 'Active'){
            PopUpDStatus = 'Active';
            }else{
            PopUpDStatus = 'Inactive';
            }
            Admin = new QR_BoothAdmin__c ();
            
            for(QR_Boothadmin__c Admin1 :BoothDetails )
            {
           // if(eventName!= null && eventName !='' && eventName.equals(Admin1.Id))
                if(statusValue[0]!= null && statusValue[0]!='' && statusValue[0].equals(Admin1.Id))
                {
                
                system.debug('-------+++++++++++-----------'+Admin1.Id);
                //EditExhibitorPopUp = True;
                Admin = Admin1;
                
                statusPopUp = True;
                
                break;
                
                }
           // DeleteBoothAdmin();
            }
            
        } 
    
        public pagereference SaveStatus() {
        
        system.debug('oooooooooooooooooooooooooooooooooooooooooo');
        system.debug('iiiiiiiiiiiiiiiiiiiiiiiiii'+Admin.BoothAdmin_IsActive__c);
         if(PopUpDStatus == 'Active')
        {
        Admin.BoothAdmin_IsActive__c = true;
        }else
        {
         Admin.BoothAdmin_IsActive__c = false;
        }
       // u.isactive = True;
        
        update Admin;
        
        string ss =Admin.BoothAdmin_EmailId__c; 
        UpdateUserStatus(ss,PopUpDStatus);
        
        pagereference pg = new pagereference('/apex/QRCode_Eventadmin_Boothadmin');
        pg.setredirect(true);
        return pg;
            
        }
       
        @ future
       Public static void UpdateUserStatus(string s,string f){
       // string ff = s.BoothAdmin_EmailId__c;
        //QR_BoothAdmin__c  boothadminForupdate =[select BoothAdmin_EmailId__c from QR_BoothAdmin__c where BoothAdmin_EmailId__c=:ff];
        
       user  u =[select UserName,firstname,lastname,city,state,email,street,phone,isactive from user where UserName =:s];
       system.debug('-------UserName for Activating/inactivating'+u);
       
       
        if(f== 'Active')
        {
       
        u.isactive = true;
        }else
        {
        u.isactive = false;
        }
      
        update u;
     } 
        
    //-------------------------------------- END ---------------------------------
    public String escapeSpecialCharacters(String input){
         if(input!= null && input != '' && (input.contains('<') )){
        input = input.replace('<','');
         system.debug('llllllllllllllllllllll'+input);
        }
       if(input!= null && input != '' && (input.contains('\\') )){
        input = input.replace('\\','\\\\');
 
      } 
      if(input!= null && input != '' && (input.contains('"') )){
           input = input.replace('"','\\\"');
      } 
     if(input!= null && input != '' && (input.contains(',') )){
        input = input.replace(',','//,');
      }
    
      return input;
     }
   
    
    //---------------Help-------------------
    Public Boolean HelpPopUp{get;set;}
    Public void Help(){
    HelpPopUp = True;
    }
    Public Void CloseHelppopup(){
    HelpPopUp = false;
    }
//------------------------------Test Class -------------------------------------
    
    static testmethod void test_QRcode_EXhibitors_Extjslogindetails(){
    
        Profile p = [select id FROM profile where name='Standard User'];
    
        User u = new User(alias = 'test123', email='test123@noemail.com',firstname = 'Test',
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
        EventHostingOrganization_Id__c = HostingOrg.id);
        
        insert eventAdmin;
        
         system.debug('---$$$$ Insering eventAdmin   $$$----'+eventAdmin );
        
        QR_Event__c event  = new QR_Event__c(Event_Title__c='testEvent',
        Event_HostingTimeZone__c='Eastern Time(USA)',
        End_Date__c=date.valueOf('2012-05-15 00:00:00'),
        Start_Date__c=date.valueOf('2012-05-11 00:00:00'),
        Eventadmin_Id__c=eventAdmin.id);
        insert event;
        
        system.debug('---$$$$ Insering event  $$$----'+event );
        
      
        
        account a = new account(name ='testName');
        insert a;
        
        system.debug('---$$$$ Insering Account $$$----'+a);
        
        contact c = new contact(
        Firstname = 'Confirstname',
        Lastname = 'Conlastname',
        AccountId = a.id
        );
        insert c;
        
        system.debug('---$$$$ Insering contact  $$$----'+c);
    
        
        QR_BoothAdmin__c B = new QR_BoothAdmin__c(
        BoothAdmin_FirstName__c='testboothadminfirstmname',
        BoothAdmin_Organization_Name__c='testboothadminorganiname',
        BoothAdmin_LastName__c='testboothadminlastmname',
        BoothAdmin_EmailId__c='test123@noemail.com',
        Event_Id__c=event.id);
        insert B;
        
        system.debug('---$$$$ Insering Booth Admin  $$$----'+B);
        
        
        QR_BoothPersonnel__c BoothPersonnel = new QR_BoothPersonnel__c(
                          BoothAdmin_Id__c = B.id,
                          BoothPersonnel_EmailId__c = B.BoothAdmin_EmailId__c,
                          BoothPersonnel_FirstName__c = B.BoothAdmin_FirstName__c,
                          BoothPersonnel_LastName__c = B.BoothAdmin_LastName__c
                          );
                          
         insert BoothPersonnel ;                 
        
        List<QR_BoothAdmin__c> BAList = new List<QR_BoothAdmin__c>();
        BAList.add(B);
        
        QR_Report__c R = new QR_Report__c (
        QR_BoothAdmin__c=B.id
        ); 
        insert R;
        system.debug('---$$$$ Insering Reports  $$$----'+R);
    
        
        QRcode_EXhibitors_Extjslogindetails BoothAdmin = new QRcode_EXhibitors_Extjslogindetails();
         
        BoothAdmin.user_email = 'shruthi@test.com';
        BoothAdmin.Userid = u.id;
        QR_event__c totalevents = new QR_event__c();
        BoothAdmin.sel =totalevents.id;
        system.debug('------Adding events----'+totalevents);
        BoothAdmin.eventname = B.id;
        BoothAdmin.Dashboardaction();
        BoothAdmin.ProfileSettings();
        BoothAdmin.Reportsaction();
        BoothAdmin.Customeraction();
        BoothAdmin.AttendeesAction();
        BoothAdmin.EventAction();
        BoothAdmin.ImportBoothAdmin();
        BoothAdmin.Add_Exhibitor();
        BoothAdmin.Canclepopup();
        BoothAdmin.cancel2();
        BoothAdmin.Cancle1();
        BoothAdmin.Cancelstatus();
        BoothAdmin.Cancle();
        BoothAdmin.onclickback();
        BoothAdmin.getStates();
        BoothAdmin.checkUserId();
        BoothAdmin.BoothDetails = BAList; 
        BoothAdmin.getBoothAdmin();
        BoothAdmin.getBoothadmins(); 
        BoothAdmin.Help();
        BoothAdmin.CloseHelppopup();  
        BoothAdmin.escapeSpecialCharacters(BoothAdmin.user_First_Name);
        Boothadmin.user_First_Name = 'sh%r"thi';
        BoothAdmin.saveaction();
        Boothadmin.BoothDetails1 = BAList;
        BoothAdmin.Exhibitordetails();
        BoothAdmin.eventname = B.id;
        BoothAdmin.BoothDetails1 = BAList; 
        BoothAdmin.EditExhibitor();   
        BoothAdmin.Updateaction(); 
        BoothAdmin.eventName = B.id;
       
        
       
       
       
        
       
        
        
        
        
         
        
    }
     }