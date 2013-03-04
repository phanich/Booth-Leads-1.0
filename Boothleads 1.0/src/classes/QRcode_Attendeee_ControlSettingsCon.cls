public class QRcode_Attendeee_ControlSettingsCon {

    public Boolean ReqFields{get; set;}
    public Boolean Prefix{get; set;}
    public Boolean FirstName{get; set;}
    public Boolean LastName{get; set;}
    public Boolean sufix{get; set;}
    public Boolean emailID{get; set;}
    public Boolean CompanyName{get; set;}
    public Boolean Degi{get; set;}
    public Boolean mobile{get; set;}
    public Boolean age{get; set;}
    public Boolean gen{get; set;}
    public Boolean dob{get; set;}
    public Boolean homeinfo{get; set;}
    public Boolean Shippinginfo{get; set;}
    public Boolean workinfo{get; set;}
    public Boolean NAICSCode1{get; set;}
    public Boolean NAICSCode2{get; set;}
    public Boolean NAICSCode3{get; set;}
    public Boolean PBC{get; set;}
    public Boolean SBC{get; set;}
    public Boolean NOEmp{get; set;}
    public Boolean BEDate{get; set;}
    public Boolean BRev{get; set;}
    public Boolean BTaxID{get; set;}
    public Boolean BDN{get; set;}
    public Boolean webUrl{get; set;}
    public Boolean blogURL{get; set;}
    public Boolean DT{get; set;}
    public Boolean BDesc{get; set;}
    
    public String selectedAttendeeFields{get; set;}
    public QR_Event__c eventid{get; set;}
    public  QRCode_Attendee_Settings__c  AttendeeSetting{get; set;}
    public SET<String> selectAttlist{get; set;}
    
    public QRcode_Attendeee_ControlSettingsCon(){
    try{
        eventid = new QR_Event__c();
   //  String sss = UserInfo.getUserName();
         String sss='mallikarjunan+gn@globalnest.com';
        eventid = [select id FROM QR_Event__c WHERE Eventadmin_Id__r.EventAdmin_EmailId__c =: sss];
    
        system.debug('GGGGGGGGGGGGGGG'+ eventid);
        
      AttendeeSetting = new QRCode_Attendee_Settings__c();
       
       AttendeeSetting = [select id,QRCode_Selected_Fields__c FROM QRCode_Attendee_Settings__c WHERE QR_Event__c =: eventid.id ];
   
       system.debug('SSSSSSSSSSSSSSSSS'+ AttendeeSetting);
   
       selectAttlist = new SET<String>();
        selectAttlist.addAll(new LIST<String>(AttendeeSetting.QRCode_Selected_Fields__c.split(',')));
      
     if(selectAttlist.contains('Attendee_FirstName__c'))
           ReqFields = TRUE;
      else  ReqFields = FALSE;     
     if(selectAttlist.contains('Attendee_NewPrefix__c'))
            Prefix = TRUE;
      else Prefix = FALSE;      
     if(selectAttlist.contains('Attendee_NewSuffix__c'))
            sufix = TRUE;
      else sufix = FALSE;      
     if(selectAttlist.contains('Attendee_Designation__c'))
             Degi= TRUE;
      else Degi= FALSE;        
     if(selectAttlist.contains('Attendee_CellPhoneNumber__c'))
           mobile = TRUE; 
      else mobile = FALSE;     
      if(selectAttlist.contains('Attendee_age__c'))
           age = TRUE; 
       else age = FALSE;    
      if(selectAttlist.contains('Attendee_gender__c'))
            gen = TRUE;
        else gen = FALSE;     
      if(selectAttlist.contains('Attendee_BirthDate__c'))
            dob = TRUE; 
       else  dob = FALSE;
      if(selectAttlist.contains('Attendee_HomeAddress__c'))
           homeInfo  = TRUE; 
       else homeInfo  = FALSE;    
      if(selectAttlist.contains('Attendee_ShippingAddress__c'))
           Shippinginfo  = TRUE; 
       else Shippinginfo  = FALSE;    
      if(selectAttlist.contains('Attendee_WorkAddress__c'))
            workInfo = TRUE; 
       else workInfo = FALSE;      
      if(selectAttlist.contains('Attendee_NAICS_Code1__c'))
            NAICSCode1 = TRUE; 
       else NAICSCode1 = FALSE;     
      if(selectAttlist.contains('Attendee_NAICS_Code2__c'))
            NAICSCode2 = TRUE; 
        else NAICSCode2 = FALSE;    
      if(selectAttlist.contains('Attendee_NAICS_Code3__c'))
           NAICSCode3  = TRUE; 
        else NAICSCode3  = FALSE;   
      if(selectAttlist.contains('Attendee_PrimaryBusinessCategory1__c'))
            PBC = TRUE; 
        else PBC = FALSE;     
      if(selectAttlist.contains('Attendee_SecondaryBusinessCategory2__c'))
            SBC = TRUE; 
        else SBC = FALSE;    
      if(selectAttlist.contains('Attendee_Business_NoOfEmployees__c'))
           NOEmp  = TRUE; 
        else NOEmp  = FALSE;   
      if(selectAttlist.contains('Attendee_BusineesEstablished_Date1__c'))
            BEDate = TRUE; 
        else BEDate = FALSE;    
      if(selectAttlist.contains('Attendee_BusinessRevenue__c'))
            BRev = TRUE; 
        else BRev = FALSE;    
      if(selectAttlist.contains('Attendee_BusinessTaxId__c'))
           BTaxId  = TRUE; 
        else BTaxId  = FALSE;   
      if(selectAttlist.contains('Attendee_Business_DnB_Id__c'))
           BDN  = TRUE; 
        else BDN  = FALSE;   
      if(selectAttlist.contains('Attendee_WebsiteURL__c'))
           webUrl  = TRUE;
        else webUrl  = FALSE;    
      if(selectAttlist.contains('Attendee_BlogURL__c'))
           blogUrl  = TRUE; 
       else blogUrl  = False;    
      if(selectAttlist.contains('Attendee_DiversityType1__c'))
            DT = TRUE; 
       else DT = FALSE;     
      if(selectAttlist.contains('Attendee_BusineesDescription__c'))
            BDesc = TRUE; 
       else BDesc = FALSE; 
       }catch(Exception e){}
    }
    
    
    
    
    
    public void AttendeeSetting(){
    
        selectedAttendeeFields = 'Attendee_FirstName__c,Attendee_LastName__c,Attendee_Company__c,Attendee_EmailId__c,';
        if(Prefix)
        selectedAttendeeFields += 'Attendee_NewPrefix__c,';
        if(sufix)
        selectedAttendeeFields += 'Attendee_NewSuffix__c,';
        if(Degi)
        selectedAttendeeFields += 'Attendee_Designation__c,';
        if(mobile)
        selectedAttendeeFields += 'Attendee_CellPhoneNumber__c,';
        if(age)
        selectedAttendeeFields += 'Attendee_age__c,';
        if(gen)
        selectedAttendeeFields += 'Attendee_gender__c,';
        if(dob)
        selectedAttendeeFields += 'Attendee_BirthDate__c,';
        if(homeinfo)
        selectedAttendeeFields += 'Attendee_HomePhoneNumber__c,Attendee_HomeAddress__c,Attendee_HomeAddress1__c,Attendee_HomeCity__c,Attendee_HomeState__c,Attendee_HomePOBox__c,';
        if(Shippinginfo)
        selectedAttendeeFields += 'Attendee_ShippingAddress__c,Attendee_ShippingAddress2__c,Attendee_shippingCity__c,Attendee_shippingState__c,Attendee_ShippingPOBox__c,';
        if(workinfo)
        selectedAttendeeFields += 'Attendee_WorkPhone__c,Attendee_WorkAddress__c,Attendee_WorkAddress1__c,Attendee_Workcity__c,Attendee_WorkState__c,Attendee_WorkPOBox__c,';
        if(NAICSCode1)
        selectedAttendeeFields += 'Attendee_NAICS_Code1__c,';
        if(NAICSCode2)
        selectedAttendeeFields += 'Attendee_NAICS_Code2__c,';
        if(NAICSCode3)
        selectedAttendeeFields += 'Attendee_NAICS_Code3__c,';
        if(PBC)
        selectedAttendeeFields += 'Attendee_PrimaryBusinessCategory1__c,';
        if(SBC)
        selectedAttendeeFields += 'Attendee_SecondaryBusinessCategory2__c,';
        if(NOEmp)
        selectedAttendeeFields += 'Attendee_Business_NoOfEmployees__c,';
        if(BEDate)
        selectedAttendeeFields += 'Attendee_BusineesEstablished_Date1__c,';
        if(BRev)
        selectedAttendeeFields += 'Attendee_BusinessRevenue__c,';
        if(BTaxID)
        selectedAttendeeFields += 'Attendee_BusinessTaxId__c,';
        if(BDN)
        selectedAttendeeFields += 'Attendee_Business_DnB_Id__c,';
        if(webUrl)
        selectedAttendeeFields += 'Attendee_WebsiteURL__c,';
        if(blogURL)
        selectedAttendeeFields += 'Attendee_BlogURL__c,';
        if(DT)
        selectedAttendeeFields += 'Attendee_DiversityType1__c,';
        if(BDesc)
        selectedAttendeeFields += 'Attendee_BusineesDescription__c,';

        
        system.debug('111111111111'+selectedAttendeeFields.length());
        
        system.debug('222222222222'+selectedAttendeeFields.substring(0, selectedAttendeeFields.lastIndexOf(',')).length());
        
        
        QRCode_Attendee_Settings__c attSet = new QRCode_Attendee_Settings__c();
        
        attSet.QRCode_Selected_Fields__c = selectedAttendeeFields.substring(0, selectedAttendeeFields.lastIndexOf(','));
        attset.QR_Event__c = eventid.id;
        
         insert attset;
        
        
        system.debug('SSSSSSSSSSSSSSSSS'+ attset);
        
        
    }    
    
    
 // ------------------  TEST Class
 
 static testmethod void testAttendeeSetting(){
     
     Profile p = [select id FROM profile where name='Standard User'];
        
        User u = new User(alias = 'test123', email='mallikarjunan+gn@globalnest.com',
                 emailencodingkey='UTF-8',profileid = p.Id, lastname='Testing', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',
                  timezonesidkey='America/Los_Angeles', username='test123@noemail.com');
                  
                  insert u;
                  
         
      
                  
        QR_Eventadmin__c  eAdm = new QR_Eventadmin__c(
       EventAdmin_FirstName__c='testEvenfirstnametAdmin',EventAdmin_LastName__c='testEvenLastname',EventAdmin_EmailId__c=u.Email,User_ID__c=u.Id);    
        insert eAdm;
        
        
       QR_Event__c event = new QR_Event__c(Event_Title__c='testEvent',Event_HostingTimeZone__c='Eastern Time(USA)',End_Date__c=date.valueOf('2012-05-15 00:00:00'),Start_Date__c=date.valueOf('2012-05-11 00:00:00'),Eventadmin_Id__c=eAdm.id);
     insert event;
     
     string fieldsOf = 'Attendee_FirstName__c,Attendee_LastName__c,Attendee_Company__c,Attendee_EmailId__c,Attendee_NewPrefix__c,Attendee_NewSuffix__c,Attendee_Designation__c,Attendee_CellPhoneNumber__c,Attendee_Age__c,Attendee_Gender__c,Attendee_BirthDate__c,Attendee_HomePhoneNumber__c,Attendee_HomeAddress__c,Attendee_HomeAddress1__c,Attendee_HomeCity__c,Attendee_HomeState__c,Attendee_HomePOBox__c,Attendee_ShippingAddress__c,Attendee_ShippingAddress2__c,Attendee_shippingCity__c,Attendee_shippingState__c,Attendee_ShippingPOBox__c,Attendee_WorkPhone__c,Attendee_WorkAddress__c,Attendee_WorkAddress1__c,Attendee_Workcity__c,Attendee_WorkState__c,Attendee_WorkPOBox__c,Attendee_NAICS_Code1__c,Attendee_NAICS_Code2__c,Attendee_NAICS_Code3__c,Attendee_PrimaryBusinessCategory1__c,Attendee_SecondaryBusinessCategory2__c,Attendee_Business_NoOfEmployees__c,Attendee_BusineesEstablished_Date1__c,Attendee_BusinessRevenue__c,Attendee_BusinessTaxId__c,Attendee_Business_DnB_Id__c,Attendee_WebsiteURL__c,Attendee_BlogURL__c,Attendee_DiversityType1__c,Attendee_BusineesDescription__c,AttendeePic';
     
     QRCode_Attendee_Settings__c  attsett = new QRCode_Attendee_Settings__c(QR_Event__c = event.id, QRCode_Selected_Fields__c = fieldsOf);
     
     insert attsett;    
 
     QRcode_Attendeee_ControlSettingsCon mytestForSett = new QRcode_Attendeee_ControlSettingsCon();

     mytestForSett.AttendeeSetting = attsett;
     
     system.debug('ggggggggggggggggggggggggg'+ mytestForSett.AttendeeSetting );
     
     mytestForSett.AttendeeSetting = [select id,QRCode_Selected_Fields__c FROM QRCode_Attendee_Settings__c WHERE QR_Event__c =: event.id ];        
     
    mytestForSett.selectedAttendeeFields ='';
    mytestForSett.AttendeeSetting();
    system.debug('ffffffffffffffffffffffffff'+ mytestForSett.AttendeeSetting );
     
     
 
 }   
    
    
    
    
    
    
    
    
    
    
    
}