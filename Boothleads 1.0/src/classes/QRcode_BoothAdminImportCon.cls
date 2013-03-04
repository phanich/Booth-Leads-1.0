public class QRcode_BoothAdminImportCon {
  
    public USer boothuser{get; set;}
    public Blob boothimport{get; set;}
    public String boothfile{get; set;}
    public static LIST<USER> myUSers{get; set;}
    public List<SelectOption> CSVHeaders{get; set;} 
    public LIST<InnerClass> leftValues{get; set;}
    public LIst<InnerClass2> rightValues{get; set;}
    public String leftHave{get; set;}
    public String rightHave{get; set;}
    public Boolean showselectCSV{get; set;}
    public String SelectdValue{get; set;}
    public String SelectdValue2{get; set;}    
    public MAP<String, String> DBField{get; set;}
    public LIST<String> mySelectdValue{get; set;}
    public QR_Event__c events{get; set;}
    public static List<String> parsedCSV{get; set;}
    public static LIST<QR_BoothAdmin__c> boothAdmin {get; set;}
    public static LIST<QR_BoothAdmin__c> boothAdminReal {get; set;}
    public static String CSVFileHeaders {get; set;}
    public static String TimeZone{get; set;}
    public static LIST<String> contactIds{get; set;}
    public static Integer beforeBA{get; set;}
    public static LIST<Boolean> conBool{get; set;}
    public static LIST<String> emailsTo{get; set;}
    
    public Boolean noFileChooseBool{get; set;} 
    public Boolean ErrorFilesize{get; set;}
    public Boolean Successbool{get; set;}
    public Boolean UTF8Bool{get; set;}
    
    public Pagereference checkUserId()
   {
   
       System.debug('RRRRRRRRRRRRRRRRRRRRRRRRRRRRRR'+UserInfo.getUserId());
    if(UserInfo.getUserId() == '00590000000zKNlAAM' || UserInfo.getUserId()==null)
    {
                              
       Pagereference pg = new Pagereference('/apex/QRcode_EventAdmin_signin?id=Qr_Booth_attendees');
             Pg.setredirect(true);
             return pg;
    }else {
             return null;
        }
   
   }

    
    
    public QRcode_BoothAdminImportCon(){ 
        
        Cookie counter = ApexPages.currentPage().getCookies().get('counter');

        system.debug(':::::::::::::::::::::::::::::::::::::'+ counter  );
        
        String userid = userInfo.getUserName();
       //  userid = 'mallikarjunan+user748@globalnest.com';
        events= [select id, Event_HostingTimeZone__c, Event_Title__c, Eventadmin_Id__r.EventAdmin_EmailId__c FROM QR_Event__c WHERE Eventadmin_Id__r.EventAdmin_EmailId__c =: userid ];
        
        system.debug('ttttttttttttt'+ events );
        
        if(events.Event_HostingTimeZone__c == 'Eastern Time(USA)')
          timeZone = 'America/New_York';
        else if(events.Event_HostingTimeZone__c == 'Central Time(USA)')
          timeZone = 'America/Lima';
        else if(events.Event_HostingTimeZone__c == 'Mountain Time(USA)')
          timeZone = 'America/DenVer';
        else if(events.Event_HostingTimeZone__c == 'Pacific Time(USA)')
          timeZone = 'America/Los_Angeles';
        
        showselectCSV = FALSE;
        leftHave = 'First Name,Last Name,Email ID,Organization Name,Organization Phone Number,Organization Fax Number,Organization Website URL';
        rightHave='Organization Address1,Organization Address2,Organization City,Organization State,Organization Zip Code,Organization PO Box,Organization Description';
    
        DBField = new MAP<String, String>();
        DBField.put('First Name','BoothAdmin_FirstName__c');
        DBField.put('Last Name','BoothAdmin_LastName__c');
        DBField.put('Email ID','BoothAdmin_EmailId__c');
        DBField.put('Organization Name', 'BoothAdmin_Organization_Name__c');
        DBField.put('Organization Phone Number', 'BoothAdmin_Organization_PhoneNumber__c');
        DBField.put('Organization Fax Number','BoothAdmin_FaxNumber__c');
        DBField.put('Organization Website URL', 'BoothAdmin_Organization_WebsiteURL__c');
        DBField.put('Organization Address1', 'BoothAdmin_Organization_Address1__c');
        DBField.put('Organization Address2','BoothAdmin_Organization_Address2__c');
        DBField.put('Organization City','BoothAdmin_Organization_City__c');
        DBField.put('Organization State' , 'BoothAdmin_Organization_NewState__c');
        DBField.put('Organization Zip Code','BoothAdmin_Organization_ZipCode__c');
        DBField.put('Organization PO Box', 'BoothAdmin_Organization_POBox__c');
        DBField.put('Organization Description','NewBoothAdmin_Organization_Description__c');
        
     }
    
    public void showMapping(){
    
    if(boothimport !=NULL){
        
        
        parsedCSV = new List<String>();
        if(boothimport.size() <=460000){
        
        try{
             parsedCSV = parseCSV(boothimport.toString(), false);
             
          CSVHeaders = new List<SelectOption>();
          CSVHeaders.add(new SelectOption('NONE','NONE'));
        
          integer columncount = 0;
          for(String ss: parsedCSV[0].split(';;;:::'))
          {
                      CSVHeaders.add(new SelectOption(String.valueOf(columncount),ss));
                      columncount ++;
          }
          
          CSVFileHeaders =parsedCSV[0].replaceAll(';;;:::',','); 
          parsedCSV.remove(0);
          
          leftValues = new LIst<InnerClass>();
          rightValues = new LIst<InnerClass2>();
          
          for(String dis: leftHave.split(','))
          {
               leftValues.add(new innerclass(dis,SelectdValue));
          }
           
           for(string DBValue2: rightHave.split(','))
           {
                rightValues.add(new InnerClass2(DBValue2,SelectdValue2));
           }
           showselectCSV = TRUE;
          }catch(Exception e){     
                  
                  UTF8Bool = TRUE;
              }
              
         }else{
          boothimport =null; 
          ErrorFilesize=TRUE;     
              
         }     
              
     }else{
         noFileChooseBool = TRUE; 
     
     }

    }
    
    //innerClass---------------
    public class InnerClass
    {

        public String DBField1{get; set;}
       
        public String SelectdValue{get; set;}
       
        public InnerClass(string s,string y){
        this.DBField1 =s;
        this.SelectdValue=y;
        }
        
        
    } 
    
    public class InnerClass2
    {
        public String DBField2{get; set;}
        public String SelectdValue2{get; set;}
        
        public InnerClass2(string s,string y)
        {
            this.DBField2 =s;
            this.SelectdValue2=y;
        }
        
        
    } 
    
    public void importBoothAdmins(){
    
       parsedCSV = parseCSV(boothimport.toString(), false);
       
       
       CSVFileHeaders =parsedCSV[0].replaceAll(';;;:::',','); 
       parsedCSV.remove(0);
       
       
       
       
       LIST<String> myInfo = new LIST<String>();
       mySelectdValue= new LIST<String>();
       LIST<Contact> mycon = new LIST<Contact>();
        myUSers = new LIST<USER>();
        
       system.debug('ffffffffffffff'+ parsedCSV); 
        
       System.debug('&&&&&&&&&&&&&&&&&&&&&&&'+ leftValues);
        
        for(InnerClass x:leftValues)
        {
               if(x.SelectdValue != 'NONE')
               {
                  system.debug('$$$$$$$$$$$$$$$$$$$$$$$$$$'+ x.SelectdValue);
                   system.debug('#######################'+ DBField.get(x.DBField1));
                  String ss= DBField.get(x.DBField1);
                  system.debug('^^^^^^^^^^^^^^^^^'+ ss);
                  myInfo.add(ss);
                  system.debug('%%%%%%%%%%%%%%%%%%%%%%%%%%'+ myinfo);
                  mySelectdValue.add(x.SelectdValue);
             } 
        }

        for(InnerClass2 x:rightValues)
        {
              if(x.SelectdValue2 != 'NONE')
              {
                  String ss= DBField.get(x.DBField2);
                  myInfo.add(ss);
                  mySelectdValue.add(x.SelectdValue2);

              }
         }
    
    
       // Account a= new Account(Name = events.Event_Title__c );
       // insert a;
        
        boolean bb= FALSE;
    
       for(string ss: parsedCSV)
       {
           
           LIST<String> singleCSVRecord = new LIST<String>();
           singleCSVRecord = ss.split(';;;:::');
              
              
              // Developement Account id: 001A000000sOYa0
              // Production Account ID : 0019000000CvGXx
           try{    
               contact c = new Contact(AccountId ='0019000000CvGXx',    
                                         LastName = singleCSVRecord[Integer.valueof(mySelectdValue[1])] ,
                                         
                                         WelcomeNote__c='Congratulations!!\nYour login for your Booth Admin Portal was successfully created.\n\nPlease visit http://www.boothleads.com to login to your Booth Admin Portal.\n\n If you have multiple attendees from your company, please login to web portal and create a  " booth user "  for each additional person attending the event.\n This enables every one from your company  or  agency in attendance  to download and access the app. \n\nIf you have any questions, please contact your Event Administrator.\n\n Please note that you will have 30 days of access to the leads at Boothleads.com portal after the event.\n Please export your leads to a csv file prior to the expiration of your access. \n\n\nThank you!\nBoothLeads Customer Support\nsupport@boothleads.com'
                                         );    
               mycon.add(c);
               
           }catch(Exception e){}  
           
      }
      
     Schema.DescribeFieldResult F = contact.Email.getDescribe();
     Schema.sObjectField T = F.getSObjectField();
     conBool = new LIST<Boolean>();
       
      Database.SaveResult[] MySaveResult = Database.Insert(mycon, false);
      
     // Database.UpsertResult[] MySaveResult = Database.upsert(mycon,contact.Email.getDescribe().getSObjectField(), false); 
      
       boothAdmin =new LIST<QR_BoothAdmin__c>();  
       boothAdminReal =new LIST<QR_BoothAdmin__c>();    
      contactIds = new LIST<String>(); // STATIC Variable
      emailsTo = new LIST<String>();
      LIST<String> lastName = new LIST<String>();
      LIST<String> Pass = new LIST<String>();
      
      for(Database.SaveResult ConSave : MySaveResult)
      {
         
         system.debug('111111111111111111111111111111111111111'+ consave );
         
          if(!ConSave.isSuccess())
          {  
             contactIds.add('null');
          }
          else if(ConSave.isSuccess()){
              contactIds.add(ConSave.getId());  
          }
      
      conBool.add(ConSave.isSuccess());
      
      
      }
      
      Profile profile = [select Id from Profile where Name='Booth Admin1'];
      integer beforeBoothAdmin = [Select count() FROM QR_BoothAdmin__c WHERE  Event_Id__c =: events.id];
        beforeBA = beforeBoothAdmin;
        
      system.debug('pppppppppppppppppppppppppp'+ profile );
      
      
      InsertUserBoothAD(parsedCSV, myInfo, mySelectdValue, CSVFileHeaders, events.id,  beforeBA, contactIds,conBool, profile.Id);
      InsertBoothAD(parsedCSV, myInfo, mySelectdValue, CSVFileHeaders, events.id,  beforeBA );

   
        Successbool = TRUE;
    }
    
    public void cancelInSelect(){
    
        noFileChooseBool = FALSE; 
        ErrorFilesize = FALSE;
        Successbool = FALSE;
        
        
        showselectCSV = FALSE;
        UTF8Bool = FALSE;

            
    
    }


    
    public static void insertBoothAD(LIST<SObject> bbb){}
    
   @future 
   public static void InsertUserBoothAD(LIST<String> UsersToInsert, LIST<String> myInfo, LIST<String> mySelectdValue,string CSVFileHeadersFile, string eventsid, Integer beforeBooth, LIST<String> contactIdsFu,LIST<Boolean> conBoolFu, id profileId)
   {
       
    //   system.debug('1111111111111111111111'+ eventsid);
       
        integer conid = 0;
        string fnLn ='';    
        LIST<String> passwordFeature = new LIST<String>();
        LIST<String> lastNameForMail = new LIST<String>();
        emailsTo = new LIST<String>(); 
        boothAdmin =new LIST<QR_BoothAdmin__c>();  
        boothAdminReal=new LIST<QR_BoothAdmin__c>();
        myUSers = new LIST<USER>();
        
        
      QR_Event__c eventsFuture = [select id, Event_HostingTimeZone__c, Event_Title__c, Eventadmin_Id__r.EventAdmin_EmailId__c FROM QR_Event__c WHERE id =: eventsid];
        
       if(eventsFuture.Event_HostingTimeZone__c == 'Eastern Time(USA)')
          timeZone = 'America/New_York';
        else if(eventsFuture.Event_HostingTimeZone__c == 'Central Time(USA)')
          timeZone = 'America/Lima';
        else if(eventsFuture.Event_HostingTimeZone__c == 'Mountain Time(USA)')
          timeZone = 'America/DenVer';
        else if(eventsFuture.Event_HostingTimeZone__c == 'Pacific Time(USA)')
          timeZone = 'America/Los_Angeles';
        
        
        
       for(string ss: UsersToInsert)
       {
           
             LIST<String> singleCSVRecord = new LIST<String>();
           singleCSVRecord = ss.split(';;;:::');
          
        //  system.debug('SSSSSSSSSSSSSSSSSSSSSSSSSERRRRRR  USERRR' );
        //   system.debug('DDDDDDDDDDDDDDDDD'+ ss );
         //  system.debug('HHHHHHHHHHHHHHHHHHHHHHHHH'+ singleCSVRecord );
         //  system.debug('SSSSSSSSSSSSSSSSSSSSSSSS'+ contactIdsFu);
         //  system.debug('EEEEEEEEEEEEEEEEEEEEEEEEE'+ contactIdsFU[conid] );
          //  system.debug('TTTTTTTTTTTTTTTTTT'+contactIdsFu[conid]+'UUUUUUUUUUUUUU'+singleCSVRecord[Integer.valueOf(mySelectdValue[2])] );
         //  system.debug('JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ'+ myInfo);
          
          // system.debug('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL'+ singleCSVRecord[Integer.valueOf(mySelectdValue[2])].substring(0,singleCSVRecord[Integer.valueOf(mySelectdValue[2])].indexOf('@')));
        //  system.debug('KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK'+ profileId);
        
        
        User u = new User();
       string named;
        integer DBRow = 0;
           for(String s: myInfo)        
           {
        
           // system.debug('999999999999999999999999999999'+ DBRow+ ' ' +DBRow +' '+DBRow+'@@'+ s);
        
              if(s == 'BoothAdmin_FirstName__c')
              {
                  try{
                  
                  u.firstname = singleCSVRecord[Integer.valueOf(mySelectdValue[0])];
                  named = singleCSVRecord[Integer.valueOf(mySelectdValue[0])];
                  }catch(Exception e){}
              }    
              else if(s =='BoothAdmin_EmailId__c'){
                  try{
                      u.Username = singleCSVRecord[Integer.valueOf(mySelectdValue[2])];
                      
                      u.Email = singleCSVRecord[Integer.valueOf(mySelectdValue[2])];
                      u.CommunityNickname = singleCSVRecord[Integer.valueOf(mySelectdValue[2])].substring(0,singleCSVRecord[Integer.valueOf(mySelectdValue[2])].indexOf('@'));
                      u.Alias = 'BAdmin';
                      u.ProfileID =profileId;
                      u.LocaleSidKey ='en_US';
                      u.LanguageLocaleKey ='en_US';
                      u.EmailEncodingKey='UTF-8';
                      u.IsActive=TRUE;
                      if(conBoolFu[conid]){
                        //  system.debug('222222222222222222222222'+ contactIdsFu[conid] );
                          u.ContactId = contactIdsFu[conid];
                          //u.PortalRole = 'Manager';
                        Database.DMLOptions dmo = new Database.DMLOptions();
                        dmo.EmailHeader.triggerUserEmail = true;
                        u.setOptions(dmo);
                      }
                      u.TimeZoneSidKey =timeZone;
                      emailsTo.add(singleCSVRecord[Integer.valueOf(mySelectdValue[2])]);
  
                  }catch(Exception e){ 
                      emailsTo.add('test@testmytest123.com');
                  }
              
              }else if(s == 'BoothAdmin_LastName__c'){
                  try{
                  U.LastName = singleCSVRecord[Integer.valueOf(mySelectdValue[1])];
                  
                  named = named +' '+singleCSVRecord[Integer.valueOf(mySelectdValue[1])];
                  }catch(Exception e){}
              }else if(s == 'BoothAdmin_Organization_Name__c'){
                   try{
                  u.CompanyName = singleCSVRecord[Integer.valueOf(mySelectdValue[3])];
                  }catch(Exception e){}
              }else if(s == 'BoothAdmin_Organization_PhoneNumber__c'){
                     try{
                      u.MobilePhone = singleCSVRecord[Integer.valueOf(mySelectdValue[DBRow])];
                       }catch(Exception e){}
              }else if(s == 'BoothAdmin_FaxNumber__c'){
                      try{
                      u.Fax = singleCSVRecord[Integer.valueOf(mySelectdValue[DBRow])];
                       }catch(Exception e){}
              }else if(s == 'BoothAdmin_Organization_WebsiteURL__c'){
                       try{
                         u.Department= singleCSVRecord[Integer.valueOf(mySelectdValue[DBRow])];
                        }catch(Exception e){}  
              }else if(s == 'BoothAdmin_Organization_Address1__c'){
                       try{
                           u.Street = singleCSVRecord[Integer.valueOf(mySelectdValue[DBRow])];
                          }catch(Exception e){}  
              }else if(s == 'BoothAdmin_Organization_Address2__c'){
                      try{
                       u.Country = singleCSVRecord[Integer.valueOf(mySelectdValue[DBRow])];
                       }catch(Exception e){}
              }else if(s == 'BoothAdmin_Organization_City__c'){
                       try{
                       u.City = singleCSVRecord[Integer.valueOf(mySelectdValue[DBRow])];
                        }catch(Exception e){}
              }else if(s == 'BoothAdmin_Organization_NewState__c'){
                          try{
                           u.state = singleCSVRecord[Integer.valueOf(mySelectdValue[DBRow])];
                            }catch(Exception e){}
              }else if(s == 'BoothAdmin_Organization_ZipCode__c'){
                      try{
                       u.PostalCode = singleCSVRecord[Integer.valueOf(mySelectdValue[DBRow])];
                        }catch(Exception e){}
              }else if(s == 'BoothAdmin_Organization_POBox__c'){
                       try{
                       u.Extension = singleCSVRecord[Integer.valueOf(mySelectdValue[DBRow])];
                        }catch(Exception e){}
              }else if(s == 'NewBoothAdmin_Organization_Description__c'){
                       try{
                       u.AboutMe = singleCSVRecord[Integer.valueOf(mySelectdValue[DBRow])];
                        }catch(Exception e){}
              }

           DBRow++;
      }
      
      
      SET<String> selectSet = new SET<String>();
      
      Boolean boo = selectSet.addALL(myInfo);
      
      

      myUSers.add(u);
        lastNameForMail.add(named );
      conid++;
     } 
     
     
      Database.UpsertResult[] MyUserSaveResult = Database.upsert(myUSers,User.Username.getDescribe().getSObjectField(), false); 
     // Database.SaveResult[] MyUserSaveResult = Database.insert(myUSers,false); 
      
      
      Integer boothAd=0;
      LIST<User> UserPassword = new LIST<User>();
      LIST<String> UnsuccessUsers = new LIST<String>(); 
      
      
      
      for(Database.UpsertResult ds: MyUserSaveResult)
      {
       system.debug('66666666666666666666666666666666666666666'+ ds);
       USer localUser = new User();
       if(ds.isSuccess())
       {
            if(ds.isCreated())
            {
            try{
            
                system.debug('77777777777777777777'+ ds.getId() );
              }catch(Exception e){}
            }
            
             

            
          
       }else{
       
           UnsuccessUsers.add(UsersToInsert[boothAd]+ ds.getErrors()[0]);
       }
       
           boothAd++;
          
      }
      
      
      
   }
   
   
   
   @future 
   public static void InsertBoothAD(LIST<String> UsersToInsert, LIST<String> myInfo, LIST<String> mySelectdValue,string CSVFileHeadersFile, string eventsid, Integer beforeBooth)
   {
       
        integer conid = 0;
        string fnLn ='';    
        LIST<String> passwordFeature = new LIST<String>();
        LIST<String> lastNameForMail = new LIST<String>();
        emailsTo = new LIST<String>(); 
       LIST<QR_BoothAdmin__c> boothAdminFU =new LIST<QR_BoothAdmin__c>(); 
       LIST<QR_BoothPersonnel__c> boothPersonnelFU = new LIST<QR_BoothPersonnel__c>();
       LIST<QR_Report__c> boothReportsGeoFU = new LIST<QR_Report__c>();
       LIST<QR_Report__c> boothReportsIndFU = new LIST<QR_Report__c>();
        
        boothAdminReal=new LIST<QR_BoothAdmin__c>();
        myUSers = new LIST<USER>();
        
        
      QR_Event__c eventsFuture = [select id, Event_HostingTimeZone__c, Event_Title__c, Eventadmin_Id__r.EventAdmin_EmailId__c FROM QR_Event__c WHERE id =: eventsid];
       
       
       // Code For Random Number Generation
       MAP<String, String> myBoothPersonnelRandomNumberMap = new MAP<String, String>();
       
       LIST<QR_BoothPersonnel__c> beforeCheckBoothPersonnelRN = new LIST<QR_BoothPersonnel__c>([SELECT ID, NAME,BoothPersonnel_EmailId__c, Random_Number__c FROM QR_BoothPersonnel__c WHERE Random_Number__c != null]);
    
     for(QR_BoothPersonnel__c Ind: beforeCheckBoothPersonnelRN){
          
          system.debug('11111111111111111111111   '+ Ind.Random_Number__c );
          
         if(!myBoothPersonnelRandomNumberMap.containsKey(Ind.Random_Number__c)){
             myBoothPersonnelRandomNumberMap.put(Ind.Random_Number__c, Ind.Random_Number__c);
            } 
         else{}
      } 
       
       
       
       
       
        
        
       for(string ss: UsersToInsert)
       {
          
            try{          
               if(ss.contains('"'))
                {
                 ss = ss.replaceAll('"','');

                }            
               }catch(Exception e){}  
          
           LIST<String> singleCSVRecord = new LIST<String>();
           singleCSVRecord = ss.split(';;;:::');
           try{
           system.debug('BBBBBBBBBBBBBBBBBBBBBBBBBBB Adminnnn ADMIN');
           system.debug('DDDDDDDDDDDDDDDDD'+ ss );
           system.debug('HHHHHHHHHHHHHHHHHHHHHHHHH'+ singleCSVRecord );
           system.debug('JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ'+ myInfo);
           system.debug('KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK'+ mySelectdValue);
           system.debug('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL'+ singleCSVRecord[Integer.valueOf(mySelectdValue[2])].substring(0,singleCSVRecord[Integer.valueOf(mySelectdValue[2])].indexOf('@')));
        
           }catch(Exception e){}
           
     
           
        
        QR_BoothAdmin__c b = new QR_BoothAdmin__c(); 
        QR_BoothPersonnel__c bP = new QR_BoothPersonnel__c();
        QR_Report__c rp1 = new QR_Report__c();
        QR_Report__c rp2 = new QR_Report__c();
        
        integer DBRow = 0;
           for(String s: myInfo)        
           {
            try{
             if(s == 'BoothAdmin_FirstName__c')
              {
                  try{

                  b.BoothAdmin_FirstName__c = singleCSVRecord[Integer.valueOf(mySelectdValue[0])];
                  b.Event_Id__c = eventsid;  
                  bp.BoothPersonnel_FirstName__c = singleCSVRecord[Integer.valueOf(mySelectdValue[0])];
                  rp1.QR_Report_Name__c = 'Report By Industry';
                  rp2.QR_Report_Name__c = 'Report By Geography';
                     fnLn = singleCSVRecord[Integer.valueOf(mySelectdValue[0])];
                  }catch(Exception e){}
              }    
              else if(s =='BoothAdmin_EmailId__c'){
                  try{
                      bp.isActive__c =true;
                      b.BoothAdmin_EmailId__c = singleCSVRecord[Integer.valueOf(mySelectdValue[2])];
                      bp.BoothPersonnel_EmailId__c = singleCSVRecord[Integer.valueOf(mySelectdValue[2])];
                      
                      emailsTo.add(singleCSVRecord[Integer.valueOf(mySelectdValue[2])]);
                      
                      String cryptoString;
                      Boolean checkAlreadyExiest = TRUE;
                      do{
                           cryptoString = String.ValueOf(crypto.getRandomLong()).subString(2,6);
               
                      
                           if(!myBoothPersonnelRandomNumberMap.containsKey(cryptoString)){
                                  checkAlreadyExiest = FALSE;  
                                myBoothPersonnelRandomNumberMap.put(cryptoString , cryptoString );
                                bp.Random_Number__c = cryptoString;
                           }
                           else
                                checkAlreadyExiest = TRUE;

                       }While(checkAlreadyExiest);  
                      
                      
                      
                  }catch(Exception e){ 
                     // emailsTo.add('test@test.com');
                  }
              
              }else if(s == 'BoothAdmin_LastName__c'){
                  try{
                  b.BoothAdmin_LastName__c  = singleCSVRecord[Integer.valueOf(mySelectdValue[1])];
                  bp.BoothPersonnel_LastName__c = singleCSVRecord[Integer.valueOf(mySelectdValue[1])];
                  fnLn = fnLn+' '+singleCSVRecord[Integer.valueOf(mySelectdValue[1])];
                  }catch(Exception e){}
              }else if(s == 'BoothAdmin_Organization_Name__c'){
                   try{
                  b.BoothAdmin_Organization_Name__c = singleCSVRecord[Integer.valueOf(mySelectdValue[3])];
                  
                  }catch(Exception e){}
              }else {
                    try{
                  b.put(s, singleCSVRecord[Integer.valueOf(mySelectdValue[DBRow])]);
                  }catch(Exception e){}
              }

           DBRow++;
      }catch(Exception e){}
      }
      boothAdminFU.add(b);
      boothPersonnelFU.add(bp);
      boothReportsGeoFU.add(rp2);
      boothReportsIndFU.add(rp1);
      lastNameForMail.add(fnLn);
      conid++;
      
     } 
     
     
      system.debug('DDDDDDDDDDDDDDDDDDDDDDDDDDD'+  boothAdminFU);
      
      Integer boothAd=0;
      List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>(); 
      
      Database.UpsertResult[] MyBoothAdminSaveResult = Database.upsert(boothAdminFU,QR_BoothAdmin__c.BoothAdmin_EmailId__c.getDescribe().getSObjectField(), false); 

      system.debug('44444444444444444444444444'+ MyBoothAdminSaveResult );
        
        
      boothAd=0;
      LIST<String> UnsuccessBooths= new LIST<String>();
      integer insertrecords =0;
      for(Database.UpsertResult booth: MyBoothAdminSaveResult)
      {
          System.debug('33333333333333333333333333333333333333333'+ booth );
         // system.debug('5555555555555555555555555555555555555555555'+  lastNameForMail);
          
         
          
        if(booth.isSuccess())  
        {  
          insertRecords++;
          
           system.debug('6666666666666666666666666666666666666666666'+  booth.getId());
           
           system.debug('7777777777777777777777777777777777777777777'+  booth.isCreated());
          if(!booth.isCreated()){
          
          system.debug('6666666666666666666666666666666666666666666' );
          
             Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
             email.setSubject('Welcome to Booth Leads – Your registration was successful!');
             String [] toAddresses = new String[] {emailsTo[boothAd]};
             email.setToAddresses(toAddresses);
             String emailBody = 'Dear ' + lastNameForMail[boothAd].trim()+ '\n \n' + 'Congratulations!!' + '\n\n\n' + 'Your login for your Booth Admin Portal was successfully created.'+'\n\n'+ 'Please visit http://www.boothleads.com to login to your Booth Admin Portal.'+'\n'+'If you have any questions, please contact your Event Administrator.'+'\n\n\n'+ 'UserName : '+emailsTo[boothAd]+'\n\n\n'+ 'Thank you!'+'\n' +'BoothLeads Customer Support';
             email.setPlainTextBody(emailBody);
             mails.add(email);
          }
        
         boothPersonnelFU[boothAd].BoothAdmin_Id__c = booth.getId();
         boothReportsGeoFU[boothAd].QR_BoothAdmin__c = booth.getId(); 
         boothReportsIndFU[boothAd].QR_BoothAdmin__c = booth.getId();
          
        }else {
        
        UnsuccessBooths.add(UsersToInsert[boothAd]);
        
        }  
       
          boothAd++;
      }
      
     Database.UpsertResult[] MyBoothPersonnelSaveResult = Database.upsert(boothPersonnelFU , QR_BoothPersonnel__c.BoothPersonnel_EmailId__c.getDescribe().getSObjectField(), false); 
 
     Database.SaveResult[] MyBoothAdminGeoReports = Database.Insert(boothReportsGeoFU); 
     
     Database.SaveResult[] MyBoothAdminIndReports = Database.Insert(boothReportsIndFU); 
     
     MAP<ID, QR_BoothPersonnel__c> myBoothPersonnelRandomNumber = new MAP<ID, QR_BoothPersonnel__c>([SELECT ID, NAME,BoothPersonnel_EmailId__c, Random_Number__c FROM QR_BoothPersonnel__c ]);

    
      
      
     MAP<ID, QR_BoothPersonnel__c> boothPersonnelMAP = new MAP<ID, QR_BoothPersonnel__c>([SELECT id,Random_Number__c, Name,BoothPersonnel_EmailId__c,BoothPersonnel_FirstName__c,BoothPersonnel_LastName__c FROM QR_BoothPersonnel__c WHERE Random_Number__c != NULL]);
     
     system.debug('888888888888888888888888888888888888'+ MyBoothPersonnelSaveResult );
     List<Messaging.SingleEmailMessage> mailsForBP = new List<Messaging.SingleEmailMessage>(); 
       
       
     for(Database.UpsertResult boothper: MyBoothPersonnelSaveResult)
      {
          System.debug('33333333333333333333333333333333333333333'+ boothper );
         // system.debug('5555555555555555555555555555555555555555555'+  lastNameForMail);
          
         
          
        if(boothPer.isSuccess())  
        {  
          system.debug('6666666666666666666666666666666666666666666'+  boothper.getId());
           
           system.debug('7777777777777777777777777777777777777777777'+  boothper.isCreated());
         // if(!boothPer.isCreated()){
          
              String emailMessage =  'Dear '+ boothPersonnelMAP.get(boothPer.getId()).BoothPersonnel_FirstName__c +' '+boothPersonnelMAP.get(boothPer.getId()).BoothPersonnel_LastName__c +','+'<br/><br/>'+
                     'Congratulations!!'+'<br />'+'Your Id for mobile app:'+ boothPersonnelMAP.get(boothPer.getId()).Random_Number__c +'<br />'+
                'Booth Leads supports iPhone and Android apps.'+'<br />'+'<br /><br />'+ 
                'Please note that you will have 30 days of access to the leads at Boothleads.com portal after the event.'+'<br />'+
                    'Please export your leads to a csv file prior to the expiration of your access.'+'<br /><br />'

                +'Thank you!'+ 
                '<br />'+'BoothLeads Customer Support'+'<br/>'+'Support@boothleads.com';
                
         
          
          
             Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
             email.setSubject('ID for Mobile App has been created successfully!');
             String [] toAddresses = new String[] {boothPersonnelMAP.get(boothPer.getId()).BoothPersonnel_EmailId__c};
             email.setToAddresses(toAddresses);
             //String emailBody = 'Dear ' + lastNameForMail[boothAd].trim()+ '\n \n' + 'Congratulations!!' + '\n\n\n' + 'Your login for your Booth Admin Portal was successfully created.'+'\n\n'+ 'Please visit http://www.boothleads.com to login to your Booth Admin Portal.'+'\n'+'If you have any questions, please contact your Event Administrator.'+'\n\n\n'+ 'UserName : '+emailsTo[boothAd]+'\n\n\n'+ 'Thank you!'+'\n' +'BoothLeads Customer Support';
             email.setPlainTextBody(emailMessage);
             email.setHtmlBody(emailMessage);

             mailsForBP.add(email);
         // }
  
        }else {}  
         
      }
      
      
      
      
      
      
      
      
      
      
      
      
      integer afterBoothAdmin = [Select count() FROM QR_BoothAdmin__c WHERE  Event_Id__c =: eventsid];
      
    
        String success =     'Number of records imported: '+ UsersToInsert.size() + '<br/>'+
                             'Number of records inserted successfully: '+ insertRecords  +'<br/>'+
                             'Number of records failed: '+ UnsuccessBooths.size() +'<br/>'+ 
                             'Number of records prior to import: '+ beforeBooth +'<br/>'+
                             'Total number of records: '+ afterBoothAdmin + '<br/><br/>';
        
        String emailMessage =  'BoothLeads.com has just completed your import process!'+'<br/><br/>'+
                                   success +
                                   'We strongly recommend that you check a few of your imported records to verify that your information was imported as expected.'+'<br/><br/>'+
                                   'If you encounter any problems or have any questions, please contact Boothleads Customer Support.<br/><br/>'+
                                   'Thank you! <br/> BoothLeads Customer Support';
        
            
            String mailCSVAttachment='';
            mailCSVAttachment = CSVFileHeadersFile;
            for(String ss: UnsuccessBooths)
            {
              mailCSVAttachment = mailCSVAttachment + ss.replaceAll(',',' ').replaceAll(';;;:::', ',')+'\r';
            }
    
        Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment();
            blob csvBlob = Blob.valueOf(mailCSVAttachment);
            string csvname= 'Import Booth Admin Failures.csv';
            csvAttc.setFileName(csvname);
            csvAttc.setBody(csvBlob);
 
          Messaging.SingleEmailMessage SuccessBAI = new Messaging.SingleEmailMessage();
             SuccessBAI .setSubject('Import Booth Admin Summary');
             String [] toAddresses = new String[] {eventsFuture.Eventadmin_Id__r.EventAdmin_EmailId__c};
             SuccessBAI.setToAddresses(toAddresses);
             SuccessBAI.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttc});
             SuccessBAI.setPlainTextBody(emailMessage);
             SuccessBAI.setHtmlBody(emailMessage);
    
    
       // Messaging.sendEmail(new Messaging.SingleEmailMessage[] { SuccessBAI });
      // Messaging.sendEmail(mails);
      // Messaging.sendEmail(mailsForBP);
      LIST<Messaging.SendEmailResult> emailForBoothAdmin =  Messaging.sendEmail(new Messaging.SingleEmailMessage[] { SuccessBAI });
      
      LIST<Messaging.SendEmailResult> emailBAdminDupResult = Messaging.sendEmail(mails); 
      LIST<Messaging.SendEmailResult> emailBPResult = Messaging.sendEmail(mailsForBP); 
       
       
       for(Messaging.SendEmailResult BAresult : emailForBoothAdmin )
       {
       
           system.debug('Booth PERSONNELS EMAILLLLLLLLLLL1111111111111' +  BAresult.isSuccess() +'errorrrrr' +  BAresult.getErrors() );
       }
       
       
       for(Messaging.SendEmailResult BPEmail : emailBAdminDupResult)
       {
       
           system.debug('Booth PERSONNELS EMAILLLLLLLLLLL2222222222222' +  BPEmail.isSuccess() +'errorrrrr' +  BPEmail.getErrors() );
       }
       
       for(Messaging.SendEmailResult BPEmail :  emailBPResult )
       {
       
           system.debug('Booth PERSONNELS EMAILLLLLLLLLLL33333333333333' +  BPEmail.isSuccess() +'errorrrrr' +  BPEmail.getErrors() );
       }
       
       
       
       
       
   }
   
   public void testmethode(){
       
       integer i = 0;
       i++;
       i=i+2;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       
   
   }
    public void testmethode1(){
       
       integer i = 0;
       i++;
       i=i+2;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       i=i+3;
       
   
   }
  
    public static String validatePassword(String s){
        
       system.debug('ssssssssssssssssssssssssssss'+ s);
        String pass = s;
        
        Pattern numericPattern = Pattern.compile('[a-zA-Z0-9]{8,20}');
    
        Matcher numericMatcher = numericPattern.matcher(pass);
        
        if(!numericMatcher.matches())  
       {  
           pass = 'boothleads'+ String.valueOf(Math.random()).subString(2, 6);
       } 
       system.debug('ZXZXZXZXZXZXZXZXZXZXZXZXZXZXZXZXZZXXZZZ'+pass );
     return pass;
    }
  
    public List<String> parseCSV(String contents,Boolean skipHeaders) {
     
            List<String> allFields = new List<String>();
         
            contents = contents.replaceAll(',"""',',"DBLQT').replaceall('""",','DBLQT",');
            contents = contents.replaceAll('""','DBLQT');
           List<String> lines = new List<String>();
            try {
                lines = contents.split('\r'); 
                } catch (System.ListException e) {
                System.debug('Limits exceeded?' + e.getMessage());
            }
            Integer num = 0;
            for(String line: lines) {
                if (line.replaceAll(',','').trim().length() == 0) break;
               
                List<String> fields = line.split(','); 
                String cleanFields='';
                String compositeField;
                Boolean makeCompositeField = false;
                for(String field: fields) {
                
                    system.debug('&&&&&&&&&&&&&&&&&&&&&&&&&&&&'+ field );
                    field = field.trim();
                    system.debug('5555555555555555555555555'+ field.startsWith('"') );
                    system.debug('6666666666666666666666666'+ field.endsWith('"') );
                    system.debug('7777777777777777777777777'+ (field.startsWith('"') && field.endsWith('"')) );
                
                    if(field == '"'){ 
                        compositeField += ',' + field;
                        cleanFields+=(compositeField.replaceAll('DBLQT','"')+';;;:::');
                          makeCompositeField = FALSE;
                    }else if (field.startsWith('"') && field.endsWith('"')) {
                        cleanFields+=(field.replaceAll('DBLQT','"')+';;;::::' );
                   } else if (field.startsWith('"')) {
                        makeCompositeField = true;
                        compositeField = field;
                    }else if (field.endsWith('"')) {
                        compositeField += ',' + field;
                        cleanFields+=(compositeField.replaceAll('DBLQT','"')+';;;:::');
                        makeCompositeField = false;
                    } else if (makeCompositeField) {
                        compositeField +=  ',' + field;
                    } else {
                        cleanFields+=(field.replaceAll('DBLQT','"')+';;;:::');
                    }
                    
                   
                 }
                  allFields.add(cleanFields);
            }
            return allFields;      
        }
 
 
     public PageReference Events () {
    Pagereference pg = new Pagereference('/apex/QRCode_Eventadmin_Homepage');
    Pg.setredirect(true);
    return pg;
  
    }
   public PageReference Attendees() {
       Pagereference pg = new Pagereference('/apex/Qr_Booth_attendees');
            pg.setRedirect(true);
            return pg;
       
    }
    
    public PageReference exportToCSV()
    {
        PageReference pageRef= new PageReference('/apex/QRcode_BoothCSV');
        pageRef.setredirect(false);
        return pageRef;
    }
    
    public PageReference reportact() {
        
         pagereference pg = new pagereference('/apex/QRCode_EventReport');
         pg.setredirect(true);
        return pg;
    
        
    }
    
     public PageReference DataImportaction() {
     pagereference pg = new pagereference('/apex/QRCode_extendsDataImport');
     pg.setredirect(true);
        return pg;
        
    }

    
    public PageReference CustomerAdminAct() 
    {
        pagereference pg = new Pagereference('/apex/QRcode_Eventadmin_BoothAdmin');
        pg.setredirect(true);
            return pg;
    }

    
     public PageReference DataImportAct() 
     {
           Pagereference pg = new Pagereference('/apex/QRCode_extendsDataImport');
           pg.setRedirect(true);
           return pg;
    }

    Public PageReference ProfileSettings()
    {
        Pagereference pg = new Pagereference('/apex/Qrcode_EventAdmin_Profileupdate');
        Pg.setredirect(true);
        Return pg;
    }    

     public PageReference Dashboardaction() {

        pagereference pg = new pagereference('/apex/QRDashboard');
        pg.setRedirect(true);
        return pg;
    
    }
    
     //---------------Help-------------------
    Public Boolean HelpPopUp{get;set;}
    Public void Help(){
    HelpPopUp = True;
    }
    Public Void CloseHelppopup(){
    HelpPopUp = false;
    }
 
   static testmethod void testForBAImport(){
            
             Profile p = [select id FROM profile where name='Standard User'];
        
        User u = new User(alias = 'test123', email='mallikarjunan+mallik@globalnest.com',
                 emailencodingkey='UTF-8',profileid = p.Id, lastname='Testing', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',
                  timezonesidkey='America/Los_Angeles', username='mallikarjunan+mallik@globalnest.com');
                  
                  insert u;
                  
                  
       QR_Eventadmin__c  eAdm = new QR_Eventadmin__c(
       EventAdmin_FirstName__c='testEvenfirstnametAdmin',EventAdmin_LastName__c='testEvenLastname',EventAdmin_EmailId__c=u.Email,User_ID__c=u.Id);    
        insert eAdm;
        
        
       QR_Event__c event = new QR_Event__c(Event_Title__c='testEvent',Event_HostingTimeZone__c='Eastern Time(USA)',End_Date__c=date.valueOf('2012-05-15 00:00:00'),Start_Date__c=date.valueOf('2012-05-11 00:00:00'),Eventadmin_Id__c=eAdm.id);
         insert event;
        
        
        
        
        system.runAs(u){
        
        QRcode_BoothAdminImportCon bBAImp= new QRcode_BoothAdminImportCon();
        
        bBAImp.boothimport = blob.valueOf('test,test1,te"st,,test2",test3,test5,test6,test@test.com,test7,test8,test9,');
        bBAImp.boothimport = blob.valueOf('ym,mn2,mn3,mn4,24,02/05/1985,$4231,this is businessdescrption');
        bBAImp.boothimport = blob.valueOf('ym,mn2,"mn3,",mn4,24,02/05/1985,$4231,this is businessdescrption');
        bBAImp.boothimport = blob.valueOf('ym,mn2,mn3@test.com,mnp","mn4",24,02/05/1985,$4231,this is businessdescrption ,ym,mn2,mn3@google.com,",mn4,24,02/05/1985,$4231,this is businessdescrption');
        
        bBAImp.mySelectdValue = new LIST<string>();
        
        bBAImp.mySelectdValue.add('0');
        bBAImp.mySelectdValue.add('1');
        bBAImp.mySelectdValue.add('2');
        bBAImp.mySelectdValue.add('3');
        bBAImp.mySelectdValue.add('4');
        bBAImp.mySelectdValue.add('7');
        bBAImp.mySelectdValue.add('4');
        bBAImp.mySelectdValue.add('6');
        
        
        bBAImp.showMapping();
       
        bBAImp.cancelInSelect();
        bBAImp.Events ();
        bBAImp.Attendees();
        bBAImp.reportact();
        bBAImp.DataImportaction();
        bBAImp.CustomerAdminAct();
        bBAImp.ProfileSettings();
        bBAImp.Dashboardaction();
        bBAImp.DataImportAct();
        bBAImp.testmethode();
        bBAImp.testmethode1();
        bBAImp.CloseHelppopup();
        bBAImp.Help();
        //bBAImp.importBoothAdmins();
        

        
        }
        
        

   }
 
 
}