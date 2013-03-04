public with sharing class QRCodeAttendeeDetailCon {
    public boolean shippingstate{get;set;}
    public boolean workstate{get;set;}
    public boolean homestate{get;set;}
    public Boolean ReqFields{get; set;}
    public Boolean  Prefix{get; set;}
    public Boolean  sufix{get; set;}
    public Boolean  Degi{get; set;}
    public Boolean  mobile{get; set;}
    public Boolean  age{get; set;}
    public Boolean  gen{get; set;}
    public Boolean  dob{get; set;}
    public Boolean  homeinfo{get; set;}
    public Boolean  Shippinginfo{get; set;}
    public Boolean  workinfo{get; set;}
    public Boolean  NAICSCode1{get; set;}
    public Boolean  NAICSCode2{get; set;}
    public Boolean  NAICSCode3{get; set;}
    public Boolean  PBC{get; set;}
    public Boolean  SBC{get; set;}
    public Boolean  NOEmp{get; set;}
    public Boolean  BEDate{get; set;}
    public Boolean  BRev{get; set;}
    public Boolean  BTaxID{get; set;}
    public Boolean  BDN{get; set;}
    public Boolean  webUrl{get; set;}
    public Boolean  blogURL{get; set;}
    public Boolean  DT{get; set;}
    public Boolean  BDesc{get; set;}
    public String sss {get; set;}
    public boolean Dolor{get;set;}
   
   
    public boolean Registrationtype{get;set;}
    
    
    
    public PageReference CustomerAdminAct() {
       Pagereference pg = new Pagereference('/apex/QRCode_Eventadmin_Boothadmin');
            pg.setRedirect(true);
            return pg;
           }


    public PageReference reportact() {
    
     Pagereference pg = new Pagereference('/apex/QRCode_EventReport');
            pg.setRedirect(true);
            return pg;
       
        
    }


    public PageReference Attendees() {
       Pagereference pg = new Pagereference('/apex/QR_booth_attendees');
            pg.setRedirect(true);
            return pg;
       
    }


    public PageReference Events() {
       Pagereference pg = new Pagereference('/apex/Qrcode_Eventadmin_homepage');
            pg.setRedirect(true);
            return pg;
       
    }

    Public PageReference ProfileSettings()
    {
        Pagereference pg = new Pagereference('/apex/Qrcode_EventAdmin_Profileupdate');
        Pg.setredirect(true);
        Return pg;
    }
    


    public Id AttendeeId{get; set;}
    public QR_AttendeeSummary__c attendee{get; set;}
    public ID userId{get; set;} 



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



    public QRCodeAttendeeDetailCon()
    {
    
        userId =UserInfo.getUserId();
        
       
    
      attendee= new QR_AttendeeSummary__c();
      
      
      sss = UserInfo.getUserName();
        //  String sss='mallikarjunan+user35@globalnest.com';
       ReqFields = TRUE;
        Prefix = TRUE;
        sufix = TRUE;
        Degi = TRUE;
        mobile = TRUE;
        age = TRUE;
        gen = TRUE;
        dob = TRUE;
        homeinfo = TRUE;
        Shippinginfo = TRUE;
        workinfo = TRUE;
        NAICSCode1 = TRUE;
        NAICSCode2 = TRUE;
        NAICSCode3 = TRUE;
        PBC = TRUE;
        SBC = TRUE;
        NOEmp = TRUE;
        BEDate = TRUE;
        BRev = TRUE;
        BTaxID = TRUE;
        BDN = TRUE;
        webUrl = TRUE;
        blogURL = TRUE;
        DT = TRUE;
        BDesc = TRUE;
        Registrationtype=true; 
        
    /*  system.debug('RRRRRRRRRRRRR'+sss );
      QRCode_Attendee_Settings__c    attset = [select id, QRCode_Selected_Fields__c  FROM QRCode_Attendee_Settings__c WHERE QR_Event__r.Eventadmin_Id__r.EventAdmin_EmailId__c =:sss ];
      
      system.debug('rrrrrrrrrrrrrrrrrrrrr'+ attset);
      
     String attsetting =attset.QRCode_Selected_Fields__c.replaceAll(' ','');
      SET<String> selectAttlist = new SET<String>();
        selectAttlist.addAll(new LIST<String>(attsetting.split(',')));
      
     if(selectAttlist.contains('Attendee_FirstName__c'))
           ReqFields = TRUE; 
     if(selectAttlist.contains('Attendee_NewPrefix__c'))
            Prefix = TRUE;
     if(selectAttlist.contains('Attendee_NewSuffix__c'))
            sufix = TRUE;
     if(selectAttlist.contains('Attendee_Designation__c'))
             Degi= TRUE; 
     if(selectAttlist.contains('Attendee_CellPhoneNumber__c'))
           mobile = TRUE; 
      if(selectAttlist.contains('Attendee_age__c'))
           age = TRUE; 
      if(selectAttlist.contains('Attendee_gender__c'))
            gen = TRUE; 
      if(selectAttlist.contains('Attendee_BirthDate__c'))
            dob = TRUE; 
      if(selectAttlist.contains('Attendee_HomeAddress__c'))
           homeInfo  = TRUE; 
      if(selectAttlist.contains('Attendee_ShippingAddress__c'))
           Shippinginfo  = TRUE; 
      if(selectAttlist.contains('Attendee_WorkAddress__c'))
            workInfo = TRUE; 
      if(selectAttlist.contains('Attendee_NAICS_Code1__c'))
            NAICSCode1 = TRUE; 
      if(selectAttlist.contains('Attendee_NAICS_Code2__c'))
            NAICSCode2 = TRUE; 
      if(selectAttlist.contains('Attendee_NAICS_Code3__c'))
           NAICSCode3  = TRUE; 
      if(selectAttlist.contains('Attendee_PrimaryBusinessCategory1__c'))
            PBC = TRUE; 
      if(selectAttlist.contains('Attendee_SecondaryBusinessCategory2__c'))
            SBC = TRUE; 
      if(selectAttlist.contains('Attendee_Business_NoOfEmployees__c'))
           NOEmp  = TRUE; 
      if(selectAttlist.contains('Attendee_BusineesEstablished_Date1__c'))
            BEDate = TRUE; 
      if(selectAttlist.contains('Attendee_BusinessRevenue__c'))
            BRev = TRUE; 
      if(selectAttlist.contains('Attendee_BusinessTaxId__c'))
           BTaxId  = TRUE; 
      if(selectAttlist.contains('Attendee_Business_DnB_Id__c'))
           BDN  = TRUE; 
      if(selectAttlist.contains('Attendee_WebsiteURL__c'))
           webUrl  = TRUE; 
      if(selectAttlist.contains('Attendee_BlogURL__c'))
           blogUrl  = TRUE; 
      if(selectAttlist.contains('Attendee_DiversityType1__c'))
            DT = TRUE; 
      if(selectAttlist.contains('Attendee_BusineesDescription__c'))
            BDesc = TRUE; 
      
      
      
      system.debug('TTTTTTTTTTTTTTTT'+ selectAttlist);
      
      */
      
      
      try{
      attendee = [Select Attendee_FirstName__c,Attendee_LastName__c, Attendee_Company__c, Attendee_EmailId__c, 
                         Attendee_newPrefix__c,Attendee_newSuffix__c,Attendee_Designation__c,Attendee_Barcode3__c,
                         Attendee_CellPhoneNumber__c,Attendee_Age__c,Attendee_NewBusinessRevenue__c,
                         Attendee_HomePhoneNumber__c,Attendee_Gender__c,Attendee_BirthDate__c,
                         Attendee_HomeAddress__c,Attendee_HomeAddress1__c,Attendee_HomeCity__c,Attendee_registration_type__C,
                         Attendee_NewHomeState__c,Attendee_HomePOBox__c,New_Business_Description__c,
                         Attendee_BusineesEstablished_Date1__c,Attendee_Business_DnB_Id__c,
                         Attendee_Business_NoOfEmployees__c,Attendee_BusinessRevenue__c,Attendee_BusinessTaxId__c,
                         Attendee_PrimaryBusinessCategory1__c,Attendee_SecondaryBusinessCategory2__c,
                         Attendee_WebsiteURL__c,Attendee_ShippingAddress__c,Attendee_ShippingAddress2__c,
                         Attendee_Shippingcity__c,Attendee_NewShippingState__c,Attendee_ShippingPOBox__c,
                         Attendee_BlogURL__c,Attendee_WorkAddress__c,Attendee_WorkAddress1__c,Attendee_WorkPhone__c,
                         Attendee_WorkCity__c,Attendee_NewWorkState__c,Attendee_WorkPOBox__c,
                         Attendee_ThroughEventBrite__c,Attendee_Survey_Answers__c,Attendee_DiversityType1__c,
                         Attendee_NAICS_Code1__c,Attendee_NAICS_Code2__c,Attendee_NAICS_Code3__c 
                         FROM QR_AttendeeSummary__c WHERE Id=:ApexPages.currentPage().getParameters().get('id') ];
   
   if(attendee.Attendee_NewBusinessRevenue__c != null)
   {
   
   Dolor=true;
   }
   
    if(attendee.Attendee_NewHomeState__c != 'None')
    {
    homestate=true;
    
    }
    
    if(attendee.Attendee_NewWorkState__c != 'None')
   {
   
   workstate=true;
   
   }
    if(attendee.Attendee_NewshippingState__c != 'None')
    {
    
    shippingstate=true;
    }
        System.debug('######################################################'+ attendee.Attendee_newPrefix__c + attendee.Attendee_newSuffix__c);
    }
    
    catch(exception e){}
    
    }
    Public Boolean HelpPopUp{get;set;}
    Public void Help(){
    HelpPopUp = True;
    }
    Public Void CloseHelppopup(){
    HelpPopUp = false;
    }

    static testmethod void attendeeDetail(){
    
        Profile p = [select id FROM profile where name='Standard User'];
        
        User u = new User(alias = 'test123', email='mallikarjunan+user7489@globalnest.com',
                 emailencodingkey='UTF-8',profileid = p.Id, lastname='Testing', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',
                  timezonesidkey='America/Los_Angeles', username='mallikarjunan+user7489@globalnest.com');
                  
                  insert u;
                  
         
      
                  
        QR_Eventadmin__c  eAdm = new QR_Eventadmin__c(
       EventAdmin_FirstName__c='testEvenfirstnametAdmin',EventAdmin_LastName__c='testEvenLastname',EventAdmin_EmailId__c=u.Email,User_ID__c=u.Id);    
        insert eAdm;
        
        
       QR_Event__c event = new QR_Event__c(Event_Title__c='testEvent',Event_HostingTimeZone__c='Eastern Time(USA)',End_Date__c=date.valueOf('2012-05-15 00:00:00'),Start_Date__c=date.valueOf('2012-05-11 00:00:00'),Eventadmin_Id__c=eAdm.id);
     insert event;
     
     string fieldsOf = 'Attendee_FirstName__c,Attendee_LastName__c,Attendee_Company__c,Attendee_EmailId__c,Attendee_NewPrefix__c,Attendee_NewSuffix__c,Attendee_Designation__c,Attendee_CellPhoneNumber__c,Attendee_Age__c,Attendee_Gender__c,Attendee_BirthDate__c,Attendee_HomePhoneNumber__c,Attendee_HomeAddress__c,Attendee_HomeAddress1__c,Attendee_HomeCity__c,Attendee_HomeState__c,Attendee_HomePOBox__c,Attendee_ShippingAddress__c,Attendee_ShippingAddress2__c,Attendee_shippingCity__c,Attendee_shippingState__c,Attendee_ShippingPOBox__c,Attendee_WorkPhone__c,Attendee_WorkAddress__c,Attendee_WorkAddress1__c,Attendee_Workcity__c,Attendee_WorkState__c,Attendee_WorkPOBox__c,Attendee_NAICS_Code1__c,Attendee_NAICS_Code2__c,Attendee_NAICS_Code3__c,Attendee_PrimaryBusinessCategory1__c,Attendee_SecondaryBusinessCategory2__c,Attendee_Business_NoOfEmployees__c,Attendee_BusineesEstablished_Date1__c,Attendee_BusinessRevenue__c,Attendee_BusinessTaxId__c,Attendee_Business_DnB_Id__c,Attendee_WebsiteURL__c,Attendee_BlogURL__c,Attendee_DiversityType1__c,Attendee_BusineesDescription__c,AttendeePic';
     
     QRCode_Attendee_Settings__c  attsett = new QRCode_Attendee_Settings__c(QR_Event__c = event.id, QRCode_Selected_Fields__c = fieldsOf);
     
     insert attsett;     
     
      system.runAs(u){
      
          QRCodeAttendeeDetailCon detail  = new QRCodeAttendeeDetailCon();
          
          detail.CustomerAdminAct();
          detail.reportact();
          detail.Attendees();
          detail.Events();
          detail.ProfileSettings();
          detail.checkUserId();
          detail.Help();
          detail.CloseHelppopup();
      
      
      }
    
    
    }


}