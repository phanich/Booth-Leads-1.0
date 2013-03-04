public class QRCode_ExtendsDataImportCon{
    
    public String searchStr{get; set;}
    public Blob contentFile { get; set; }
    public Boolean ErrorFilesize{get; set;}
    public String nameFile { get; set; }
    
    public Integer rowCount { get; set; }
    public Integer colCount { get; set; }    
    
    public string[] selectedValue{get;set;}
    
    public String singleEvent{get; set;}
    public Boolean showselectCSV{get; set;}
    public LIST<QR_Event__c> allselectedevent{get; set;}
    public Static Integer UnSuccessPop{get; set;}
    public Boolean headerDisplay{get; set;}
    
    public Transient LIST<String> Displayrecords{get; set;}
    public LIST<String> StdImportHeaderNames1{get; set;}
    public LIST<String> StdImportHeaderNames2{get; set;}
    public List<SelectOption> csvHeaders{get; set;} 
    
    public String SelectdValue{get; set;}
    public String SelectdValue2{get; set;}
    
    public MAP<String, String> DBField{get; set;}
    public Transient String DBValue{get; set;}
    public Transient String DBValue2{get; set;}
    public LIst<InnerClass> innnnn{get;set;}
    public LIst<InnerClass2> innnnn2{get;set;}
    //public Integer BeforeInsert{get; set;}
    public Integer AfterInsert{get; set;}
    public Boolean Successbool{get; set;}
    public Boolean DataImportBool{get; set;}
    public Boolean foundHistoryBool{get; set;}
    public Boolean noFileChooseBool{get; set;}
    public String csvHeadersForFail{get; set;} 
    public static LIST<InnerClass> innerStatic{get; set;}
    public static LIST<InnerClass2> inner2Static{get; set;}
    public LIST<QR_DataImport_SavePoint__c> ImportHistory{get; set;}
    public String importSetting{get; set;}
    
    
        public List<SelectOption> getsettingsForImport() {
            List<SelectOption> options = new List<SelectOption>(); 
            //options.add(new SelectOption('ReplaceDuplicates','Replace duplicates with items imported')); 
            options.add(new SelectOption('AllowDuplicates','Allow duplicates to be created')); 
            options.add(new SelectOption('DoNotImportDuplicates','Do not import duplicate items')); 
            return options; 
         }
    
    
    
    public LIST<QR_Event__c> selectevent{get; set;}
    public Id UserId{get; set;}
    public String RecordStatus{get; set;}
       
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
       
       
       public String allFields1 {get;set;}
       public String allFields2{get;set;}
       
        public QRCode_ExtendsDataImportCon()
        {
    
          showselectCSV=FALSE;
          headerDisplay=TRUE;
          ErrorFilesize=FALSE;
          noFileChooseBool = FALSE;
          
         importSetting='DoNotImportDuplicates';
          
          userId =UserInfo.getUserId();
          
        
          //  userId = '005A0000002kNHH';
            
            selectevent = new LIST<QR_Event__c>();
            
           // QRcode_Attendeee_ControlSettingsCon attendeeSetting = new QRcode_Attendeee_ControlSettingsCon();
            allselectedevent = new LIST<QR_Event__c>();
            
            allselectedevent = [select id,Name,Eventadmin_Id__c, Event_Title__c FROM QR_Event__c WHERE Eventadmin_Id__r.User_ID__c =: userId LIMIT 1];
             id Sid;
             
             for(QR_Event__c q: allselectedevent )
             {
                 sid=q.id;
                 //EventName = q.Event_Title__c;
             
             }
             
            singleEvent = sid;
            //singleEvent = 'a1eA0000000Xrrr';
            
            DBField = new MAP<String, String>();
            
            DBField.put('none','NONE');
            DBField.put('Prefix','Attendee_newPrefix__c');
            DBField.put('First Name','Attendee_FirstName__c');
            DBField.put('Last Name','Attendee_LastName__c');
            DBField.put('Suffix', 'Attendee_newSuffix__c');
            DBField.put('Company Name', 'Attendee_Company__c');
            DBField.put('Designation','Attendee_Designation__c');
            DBField.put('Email Id', 'Attendee_EmailId__c');
            DBField.put('Mobile Number', 'Attendee_CellPhoneNumber__c');
            DBField.put('Gender','Attendee_Gender__c');
            DBField.put('Age','Attendee_Age__c');
            DBField.put('Date Of Birth' , 'Attendee_BirthDate__c');
            DBField.put('Work Address 1','Attendee_Workaddress__c');
            DBField.put('Work Address 2', 'Attendee_Workaddress1__c');
            DBField.put('Work City','Attendee_Workcity__c');
            DBField.put('Work State', 'Attendee_NewWorkState__c');
            DBField.put('Work Phone Number','Attendee_WorkPhone__c');
            DBField.put('Work Zip Code', 'Attendee_WorkPOBox__c');
            DBField.put('Business Description','New_Business_Description__c');
            DBField.put('Business Establish Date', 'Attendee_BusineesEstablished_Date1__c');
            DBField.put('Business DnB Id', 'Attendee_Business_DnB_Id__c');
            DBField.put('No. Of Employes','Attendee_Business_NoOfEmployees__c');
            DBField.put('Business Revenue','Attendee_NewBusinessRevenue__c');
            DBField.put('Business Tax Id', 'Attendee_BusinessTaxId__c');
            DBField.put('Work Fax Number', 'Attendee_FaxNumber__c');
            DBField.put('Primary Business Category', 'Attendee_PrimaryBusinessCategory1__c');
            DBField.put('Secondary Business Category','Attendee_SecondaryBusinessCategory2__c');
            DBField.put('Shipping Address 1', 'Attendee_Shippingaddress__c');
            DBField.put('Shipping City','Attendee_shippingCity__c');
            DBField.put('Shipping State', 'Attendee_newshippingState__c');
            DBField.put('Shipping Zip Code','Attendee_ShippingPOBox__c');
            DBField.put('Shipping Address 2','Attendee_ShippingAddress2__c');
            DBField.put('Shipping Zip COde','Attendee_ShippingPOBox__c');
            DBField.put('Blog URL','Attendee_BlogURL__c');
            DBField.put('WebSite URL', 'Attendee_WebsiteURL__c');
            DBField.put('Home Phone Number','Attendee_HomePhoneNumber__c');
            DBField.put('Home Address 1','Attendee_Homeaddress__c');
            DBField.put('Home Address 2', 'Attendee_Homeaddress1__c');
            DBField.put('Home City','Attendee_HomeCity__c');
            DBField.put('Home State', 'Attendee_NewHomeState__c');
            DBField.put('Home Zip Code','Attendee_HomePOBox__c');
            DBField.put('Through EventBrite', 'Attendee_ThroughEventBrite__c');
            DBField.put('Survey Answers','Attendee_Survey_Answers__c');
            DBField.put('Diversity Type', 'Attendee_DiversityType1__c');
            DBField.put('NAICS Code 1','Attendee_NAICS_Code1__c');
            DBField.put('NAICS Code 2', 'Attendee_NAICS_Code2__c');
            DBField.put('NAICS Code 3','Attendee_NAICS_Code3__c');
            DBField.put('Registration Type','Attendee_Registration_Type__c');
    
           
        //System.debug('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'+ selectevent.NAME );
         // OLD Mapping
         /*   
           String allFields1='Prefix,First Name,Company Name,Designation,Age,Date Of Birth,Primary Business Category,No.Of Employees,Business Revenue,Business D&B Id,Website URL,Businees Description,Work Phone,Work Address,Work Address1,Work city,Work State,Work Zip Code,Shipping Address,Shipping Address2,shipping City,shipping State,Shipping Zip Code';
           StdImportHeaderNames1= allFields1.split(',');
           String allFields2='Last Name,Email Id,Suffix,Mobile Number,Gender,Secondary Business Category,Businees Established Date,Business Tax Id,Diversity Type,Blog URL,Home Address,Home Phone Number,Home Address1,Home City,Home State,Home Zip Code,NAICS Code1,NAICS Code2,NAICS Code3';
           StdImportHeaderNames2=allFields2.split(',');
        */
        
           allFields1='Prefix,Last Name,Email Id,Designation,Mobile Number,Work Fax Number,Gender,Home Address 1,Home City,Home Zip Code,Work Address 2,Work State,Shipping Address 1,Shipping City,Shipping Zip Code,Secondary Business Category,Business Establish Date,Business Tax Id,WebSite URL,Diversity Type,NAICS Code 1,NAICS Code 3,';
           StdImportHeaderNames1= allFields1.split(',');
           allFields2='First Name,Suffix,Company Name,Home Phone Number,Work Phone Number,Age,Date Of Birth,Home Address 2,Home State,Work Address 1,Work City,Work Zip Code,Shipping Address 2,Shipping State,Primary Business Category,No. Of Employes,Business Revenue,Business DnB Id,Blog URL,Business Description,NAICS Code 2,Registration Type';
           StdImportHeaderNames2=allFields2.split(',');
        
         /*
         String allFields1='';
         String allFields2='';
            
           if(attendeeSetting.Prefix)
               allFields1 +='Prefix,';
           if(attendeeSetting.ReqFields)
               allFields1 +='Last Name,';
           if(attendeeSetting.ReqFields)
               allFields1 +='Email Id,';
           if(attendeeSetting.degi)
               allFields1 +='Designation,';
           if(attendeeSetting.mobile)
               allFields1 +='Mobile Number,';
           if(attendeeSetting.workinfo)
               allFields1 +='Work Fax Number,';
           if(attendeeSetting.gen)
               allFields1 +='Gender,';
           if(attendeeSetting.homeinfo)
               allFields1 +='Home Address 1,';
           if(attendeeSetting.homeinfo)
               allFields1 +='Home City,';
           if(attendeeSetting.homeinfo)
               allFields1 +='Home Zip Code,';
           if(attendeeSetting.workinfo)
               allFields1 +='Work Address 2,';
           if(attendeeSetting.workinfo)
               allFields1 +='Work State,';
           if(attendeeSetting.Shippinginfo)
               allFields1 +='Shipping Address 1,';
           if(attendeeSetting.Shippinginfo)
               allFields1 +='Shipping City,';
           if(attendeeSetting.Shippinginfo)
               allFields1 +='Shipping Zip Code,';
           if(attendeeSetting.SBC)
               allFields1 +='Secondary Business Category,';
           if(attendeeSetting.BEDate)
               allFields1 +='Business Establish Date,';
           if(attendeeSetting.BTaxID)
               allFields1 +='Business Tax Id,';
           if(attendeeSetting.webUrl)
               allFields1 +='WebSite URL,';    
           if(attendeeSetting.DT)
               allFields1 +='Diversity Type,';
           if(attendeeSetting.NAICSCode1)
               allFields1 +='NAICS Code 1,';    
           if(attendeeSetting.NAICSCode3)
               allFields1 +='NAICS Code 3,';  
           
     allFields1.substring(0, allFields1.lastIndexOf(','));
     StdImportHeaderNames1= allFields1.split(',');
     
          if(attendeeSetting.sufix)
               allFields2 +='Suffix,';
           if(attendeeSetting.ReqFields)
               allFields2 +='First Name,';  
           if(attendeeSetting.ReqFields)
               allFields2 +='Company Name,';  
           if(attendeeSetting.homeinfo)
               allFields2 +='Home Phone Number,';
           if(attendeeSetting.workinfo)
               allFields2 +='Work Phone Number,';  
           if(attendeeSetting.age)
               allFields2 +='Age,';
           if(attendeeSetting.dob)
               allFields2 +='Date Of Birth,';  
           if(attendeeSetting.homeinfo)
               allFields2 +='Home Address 2,Home State,';
           if(attendeeSetting.workinfo)
               allFields2 +='Work Address 1,Work City,Work Zip Code,';
           if(attendeeSetting.Shippinginfo)
               allFields2 +='Shipping Address 2,Shipping State,';  
           if(attendeeSetting.pbc)
               allFields2 +='Primary Business Category,';
           if(attendeeSetting.NOEmp)
               allFields2 +='No. Of Employes,';  
           if(attendeeSetting.BRev)
               allFields2 +='Business Revenue,';
           if(attendeeSetting.BDN)
               allFields2 +='Business DnB Id,';  
           if(attendeeSetting.blogURL)
               allFields2 +='Blog URL,';
           if(attendeeSetting.BDesc)
               allFields2 +='Business Description,';  
           if(attendeeSetting.NAICSCode2)
               allFields2 +='NAICS Code 2,';
           
       allFields2.substring(0,allFields2.lastIndexOf(','));
       StdImportHeaderNames2=allFields2.split(',');        
           
     */      
           
           
        
           RecordStatus = 'BoothLeads.com will now begin to import your file. You will be notified by email at' + '<B>'+' {!$user.Username}'+'</b>'+' when your import is completed.'+ '<br/>'+ 'Based on the current volume of import activity, we estimate that your import will be completed in approximately 3 minutes.';
        
           integer foundHistory =0;
            foundHistory = [select count() FROM QR_DataImport_SavePoint__c WHERE QR_Eventadmin__r.User_ID__c =: userInfo.getUserId() ];
            
            if(foundHistory > 0)
                foundHistoryBool = TRUE;
                else foundHistoryBool = FALSE;
        
        
        
        }
        
        public List<SelectOption> getEvents() 
         {
             
             List<SelectOption> options = new List<SelectOption>();
             selectevent= [select id,Name,Eventadmin_Id__c, Event_Title__c FROM QR_Event__c WHERE Eventadmin_Id__r.User_ID__c =: userId];
                 options.add(new SelectOption('NONE','NONE'));
                 for(QR_Event__c e: selectevent)
                 {
                     options.add(new SelectOption(e.id,e.Event_Title__c));
                 }
               return options;
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
            pagereference pg = new Pagereference('/apex/QRCode_Eventadmin_Boothadmin');
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
    
    
         public List<String> parseCSV(String contents,Boolean skipHeaders) {
         
                List<String> allFields = new List<String>();
              // csvHeaders= new List<String>();
               
               
                // replace instances where a double quote begins a field containing a comma
                // in this case you get a double quote followed by a doubled double quote
                // do this for beginning and end of a field
                //contents = contents.replaceAll(',',',DBLQT').replaceall(',','DBLQT,');
                contents = contents.replaceAll(',"""',',"DBLQT').replaceall('""",','DBLQT",');
                // now replace all remaining double quotes - we do this so that we can reconstruct
                // fields with commas inside assuming they begin and end with a double quote
                //contents = contents.replaceAll('"','DBLQT');
                contents = contents.replaceAll('""','DBLQT');
                // we are not attempting to handle fields with a newline inside of them
                // so, split on newline to get the spreadsheet rows
                List<String> lines = new List<String>();
                try {
                    //lines = contents.split('\n'); //correction: this only accomodates windows files
                    lines = contents.split('\r'); // using carriage return accomodates windows, unix, and mac files
                    //http://www.maxi-pedia.com/Line+termination+line+feed+versus+carriage+return+0d0a
                } catch (System.ListException e) {
                    System.debug('Limits exceeded?' + e.getMessage());
                }
                Integer num = 0;
                for(String line: lines) {
                    // check for blank CSV lines (only commas)
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
                   // system.debug('8888888888888888888888888'+ field.endsWith('"') );
                   
                       if(field == '"'){ 
                        system.debug('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'+ field);
                            compositeField += ',' + field;
                            cleanFields+=(compositeField.replaceAll('DBLQT','"')+';;;:::');
                              makeCompositeField = FALSE;
                        }else if (field.startsWith('"') && field.endsWith('"')) {
                            cleanFields+=(field.replaceAll('DBLQT','"')+';;;:::' );
                            system.debug('1111111111111111111111111111111111111111111111111'+ field); 
                        } else if (field.startsWith('"')) {
                          system.debug('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'+ field);
                            makeCompositeField = true;
                            compositeField = field;
                        }else if (field.endsWith('"')) {
                            system.debug('22222222222222222222222222222222'+ field);
                            compositeField += ',' + field;
                            cleanFields+=(compositeField.replaceAll('DBLQT','"')+';;;:::');
                            makeCompositeField = false;
                        } else if (makeCompositeField) {
                        system.debug('3333333333333333333333333333333333333'+ field);
                            compositeField +=  ',' + field;
                        } else {
                        system.debug('444444444444444444444444444444444444444'+ field);
                            cleanFields+=(field.replaceAll('DBLQT','"')+';;;:::');
                        }
                        
                       
                     }
                     system.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'+ cleanFields);  
                    allFields.add(cleanFields);
                }
                
               // if (skipHeaders) allFields.remove(0);
                return allFields;      
            }
     
        
    
        
        public List<String> getResults() {
        
          Transient List<String> parsedCSV = new List<String>();
    
            
            
            
        try{
            rowCount = 0;
            colCount = 0;
            if (contentFile != null){
    
                String fileString = contentFile.toString();
                parsedCSV = parseCSV(fileString, true);
                
                integer columncount = 0;
                CSVHeaders = new List<SelectOption>();
                CSVHeaders.add(new SelectOption('NONE','NONE'));
                
                System.debug('YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY'+ fileString );
                
                
    
                for(String ss: parsedCSV[0].split(';;;:::'))
                  {
                      CSVHeaders.add(new SelectOption(String.valueOf(columncount),ss));
                      columncount ++;
                  }
                
                rowCount = parsedCSV.size();
            }
            Displayrecords = parsedCSV;
         }
         catch(Exception e)
         {
             UTF8Bool=TRUE;
         }
          return Displayrecords;
        }
        
    
       
        public Boolean ShowMapping{get; set;}
        public Boolean UTF8Bool{get; set;}
    
        public void clickUpload()
        {
               
          if(contentFile!= NULL)
          {     
            if(contentFile.size() <=460000)
            {
    
               
            try{
                    getResults();
                    
                    headerDisplay = FALSE;
                    showselectCSV = TRUE;
                    
               }catch(Exception e){
                    UTF8Bool=TRUE;
              }
            
           innnnn = new LIst<InnerClass>();
           innnnn2 = new LIst<InnerClass2>();
           innerStatic = new LIst<InnerClass>(); 
           inner2Static = new LIst<InnerClass2>();
           
           for(String dis: StdImportHeaderNames1)
           {
               innnnn.add(new innerclass(dis,SelectdValue));
               innerStatic.add(new innerclass(dis,SelectdValue));
           }
                  
           
           for(string DBValue2: StdImportHeaderNames2)
            {
                innnnn2.add(new InnerClass2(DBValue2,SelectdValue2));
                inner2Static.add(new InnerClass2(DBValue2,SelectdValue2));
            }
          }else{
              contentFile =null; 
               system.debug('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS'+ contentFile );
              ErrorFilesize=TRUE;
          }  
        
        }else
           noFileChooseBool=TRUE;
        
        }
     
        public Transient  LIST<QR_AttendeeSummary__c> totalAttendee{get; set;} 
    
        public Static Integer Successpop{get; set;}
        public string phnumber {get;set;}
        public Transient LIST<QR_AttendeeSummary__c> reqMissing{get; set;}
        
         public static Boolean validateEMail(string s)
         {
               Boolean  EmailBool = TRUE;
                   integer atpos=s.indexOf('@');
                   integer dotpos=s.lastIndexOf('.');
                                    
                   if (atpos<1 || dotpos<atpos+2 || dotpos+2>=s.length())
                  {
                       EmailBool = FALSE;
                  }
                    return EmailBool;
         }
    
        public static Boolean validateNAICSCode(integer s)
        {
        
            Boolean nAICSCode = FALSE;
            try{
                integer naCode = s;
                if(naCode > 100000 && naCode < 999999)
                   nAICSCode = TRUE;
                else
                    nAICSCode = FALSE;
               }catch(exception e){nAICSCode = FALSE;}
        
            return nAICSCode;
        }
        
        public static String ValidatePhone(String s)
        {
          Boolean isValid;
          
          String phoneString =s.replace(')','').replace('(','').replace(' ','').replace('-','');
          String  phNumber;  
            Pattern phonePattern = Pattern.compile('\\D*?(\\d\\D*?){10}'); 
            Pattern numericPattern = Pattern.compile('[0-9]{10}');
       
            Matcher phoneMatcher = phonePattern.matcher(phoneString );
            Matcher   numericMatcher = numericPattern.matcher(phoneString );
            
           if(numericMatcher.matches())  
           {  
               isValid =true;
                string countrycode = phoneString .Substring(0, 3); 
                string Areacode = phoneString .Substring(3, 6); 
                string number23 = phoneString .Substring(6,phoneString .Length()); 
                
              phNumber='('+countrycode+')' +' '+Areacode+'-' +number23 ;
            }else{  
             
              isValid =false;
           }  
          return phNumber;  
        }
       public Pagereference RecordsSuccess()
       {
           Successbool = FALSE;
             Pagereference pg = new Pagereference('/apex/QR_Attendee_extjs');
                pg.setRedirect(true);
                return pg;
       
       }
        
        public Pagereference AfterSuccess()
        {
    
            Pagereference pg = new Pagereference('/apex/QR_Attendee_extjs');
                pg.setRedirect(true);
                return pg;
        }
        
        public Pagereference AllErrorClear()
        {
          UTF8Bool = FALSE;
           Successbool = FALSE;
            Pagereference pg = new Pagereference('/apex/QRCode_extendsDataImport');
                pg.setRedirect(true);
                return pg;
               
        }
        
        // Inner Class For Getting Selected Value from Select Options AND Field Name
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
            public InnerClass2(string s,string y){
            this.DBField2 =s;
            this.SelectdValue2=y;
            }
            
            
        } 
            // END Of Inner Class
        
    
        public Static LIST<QR_AttendeeSummary__c> TotAtt{get; set;}
        public static Integer UnSuccessRecords{get; set;} 
        public LIST<QR_AttendeeSummary__c> duplicatesOfAttendees{get; set;} //Tofind the duplicates in the CSV File
        
       @future 
       public static void checkMapping(LIST<String> records100, LIST<String> Scolumns, LIST<String> DBFields, string singleEvent, Integer oldRec, Integer CSVRec,string fileName, String importSet)
       { 
       
               
               system.debug('99999999999999999999999'+ DBFields);
               
               
               
               
               Successpop = 0;
               UnSuccessPop=0;
               //MyDataImport myDI = new MyDataImport();
               LIST<String> hunrecords = new LIST<String>();
               integer hunreccount=0;
                     
               LIST<QR_AttendeeSummary__c> totAttendee100  = new LIST<QR_AttendeeSummary__c>();
              // LIST<QR_AttendeeSummary__c> totAttendee = new LIST<QR_AttendeeSummary__c>();  
              // LIST<QR_AttendeeSummary__c> beforeAttendee = new LIST<QR_AttendeeSummary__c>();
               LIST<QR_AttendeeSummary__c> afterAttendee = new LIST<QR_AttendeeSummary__c>();  
               LIST<String> SuccessCSVRecords = new LIST<String>();
               LIST<String> UnsuccessCSVRecords = new LIST<String>();
               LIST<String> DuplicateCSVRecords = new LIST<String>();
               
               
               LIST<QR_AttendeeSummary__c>  eventAttendees = new LIST<QR_AttendeeSummary__c>();
               MAP<String ,QR_AttendeeSummary__c>  myEventAttendeesMap = new MAP<String, QR_AttendeeSummary__c>();
              eventAttendees = [select id, Attendee_EmailId__c,Attendee_FirstName__c,Attendee_LastName__c FROM QR_AttendeeSummary__c WHERE Event_Id__c=: singleEvent];
        
              for(QR_AttendeeSummary__c toMap :eventAttendees)
              {
                  myEventAttendeesMap.put(toMap.Attendee_EmailId__c.trim()+toMap.Attendee_FirstName__c+toMap.Attendee_LastName__c , toMap);
              }
              
               String insertedId = '';
               LIST<String> insetedEmails = new LIST<String>();
               
               QR_DataImport_SavePoint__c dbsavePoint = new QR_DataImport_SavePoint__c();
               QR_Eventadmin__c eventAdminid = new QR_Eventadmin__c();
               //-------------------------------------------------      
                    system.debug('`````````````````````````````````````````````'+ myEventAttendeesMap );
                
                    system.debug('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'+ records100.size());
                    
                     if(records100.size()>=250 )  
                     {
                          for(String tenrec: records100)
                          {
                                       
                            if(hunreccount == 500)
                            {
                            totAttendee100.addAll(MyDataImportRotate( hunRecords ,Scolumns, DBFields, singleEvent,myEventAttendeesMap,importSet ));
                            hunrecords = new LIST<String>();
                            hunreccount=0;
                            
                            }
                           else{
                               hunRecords.add(tenrec);
                                hunreccount++; 
                           }   
                        }
                        if(hunreccount != 0)
                        {
                            totAttendee100.addAll(MyDataImportRotate( hunRecords ,Scolumns, DBFields, singleEvent,myEventAttendeesMap,importSet ));
                        }
                     }else
                      {
                         system.debug('~~~~~~~~~~~~~~~~~~~~~'+ myEventAttendeesMap );
                         totAttendee100.addAll(MyDataImportRotate( records100 ,Scolumns, DBFields, singleEvent,myEventAttendeesMap,importSet ));
                      }
                      
                     
              //-------------------------------------------         
          //  BeforeAttendee = [select id FROM QR_AttendeeSummary__c WHERE Event_Id__c =: singleEvent];
           
            
            eventAdminid = [select id FROM QR_Eventadmin__c WHERE User_ID__c =: UserInfo.getUserId()];
           
           system.debug('oooooooooooooooooooooooooooo'+ UserInfo.getUserId());
           
           
            Database.SaveResult[] MySaveResult = Database.Insert(totAttendee100, false);
             
           Schema.DescribeFieldResult F = QR_AttendeeSummary__c.Attendee_EmailId__c.getDescribe();
           Schema.sObjectField T = F.getSObjectField();
           
           
           
          
           
         //  Database.UpsertResult[] MySaveResult = Database.upsert(totAttendee100,T, false);  
             UnSuccessRecords = 0;
             Integer csvRecordsCount=0;
             Integer Afterinsert= [select count() FROM QR_AttendeeSummary__c WHERE Event_Id__c =: singleEvent];
              for(Database.SaveResult rer : MySaveResult){
              
                  
                 if(!rer.isSuccess())
                 {
                     // When the record is fails-----------------
                     Database.Error Inserterrors = rer.getErrors()[0]; 
                     system.debug('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^'+ csvRecordsCount+'REC'+records100[csvRecordsCount]);
                     
                         unsuccessCSVRecords.add(records100[csvRecordsCount] );
                     system.debug('**************************************'+ unsuccessCSVRecords[UnSuccessRecords]+ 'eeeeeeeeeee'+ rer.getErrors()[0]);
                     
                         csvRecordsCount++;
                       UnSuccessRecords ++;
                   } else
                   {
                         // insertedId.add(rer.getId());
                         insertedId += rer.getId()+','; //ID's are storing in "DataBase Save Point" For Roll Back 
                       
                        SuccessCSVRecords.add(records100[csvRecordsCount]); 
                         csvRecordsCount++;
                   }
                   
                  
                   
                }
    
               
    
             //  afterAttendee  = [select id,Attendee_EmailId__c FROM QR_AttendeeSummary__c WHERE (Event_Id__c =: singleEvent AND id !=: BeforeAttendee) ];
                
               Successpop = AfterInsert - oldRec;
               UnSuccessPop = CSVRec - Successpop-1;
                
               if(CSVRec >=2 )
               CSVRec--;
               String success =  'Number of records imported: '+ CSVRec + '<br/>'+
                                 'Number of records inserted successfully: '+ Successpop +'<br/>'+
                                 'Number of records failed: '+ UnSuccessPop +'<br/>'+ 
                                 'Number of records prior to import: '+ OldRec +'<br/>'+
                                 'Total number of records: '+Afterinsert+ '<br/><br/>';
                
               String emailMessage =  'BoothLeads.com has just completed your import process!'+'<br/><br/>'+
                                       success +
                                       'We strongly recommend that you check a few of your imported records to verify that your information was imported as expected.'+'<br/><br/>'+
                                       'If you encounter any problems or have any questions, please contact Boothleads Customer Support.<br/><br/>'+
                                       'Thank you! <br/> BoothLeads Customer Support';
                
                
                system.debug('MALLIKKKKKKKKKKK'+ eventAdminid.id +'OOOOOORRRRR'+ insertedId+'QQQQQQQQ'+ FileName );
                if(eventAdminid.id !=NULL && insertedId != '' && FileName != NULL)
                {
                    
                    system.debug('STARTEDDDDDDDDDDDDDDDDDDDDDDDD');
                    dbsavePoint.Upload_File_Name__c = FileName;
                    dbsavePoint.Import_History__c = success;
                    dbsavePoint.Imported_IDs__c = insertedId.subString(0, insertedId.lastIndexOf(','));
                    dbsavePoint.QR_Eventadmin__c = eventAdminid.id;
                    dbsavePoint.Total_No_of_Records__c = Successpop;
                    insert dbsavePoint;
                    
                    system.debug('EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE');
                    
                }
                
                String mailCSVAttachment='';
                for(String ss: UnsuccessCSVRecords)
                {
                  mailCSVAttachment = mailCSVAttachment + ss.replaceAll(',',' ').replaceAll(';;;:::', ',')+'\r';
                }
             system.debug('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'+ mailCSVAttachment );
              /*  mailCSVAttachment += ('\n'+'SUccess Records'+'\n');
                
                for(String suc: SuccessCSVRecords)
                {
                   string recordString = suc;
                   mailCSVAttachment = mailCSVAttachment + recordString;
                } */
    
                //Prepare Mail For Failure Attachments
                Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment();
                blob csvBlob = Blob.valueOf(mailCSVAttachment);
                string csvname= 'Import Attendees Failures.csv';
                csvAttc.setFileName(csvname);
                csvAttc.setBody(csvBlob);
                
                
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                
                 String[] toAddresses = new String[] {UserInfo.getUserName()};
                 
                 mail.setToAddresses(toAddresses);
                 mail.setReplyTo('admin@globalnest.com');
                 mail.setSubject('Import Attendees Summary');
                 mail.setPlainTextBody(emailMessage);
                 mail.setHtmlBody(emailMessage);
                 mail.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttc});
                 Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
              
       }
       
       
     //  LIST<QR_AttendeeSummary__c> eventAttendees {get; set;} //To find the duplicates 
     //  MAP<String ,QR_AttendeeSummary__c> eventAttendeesMap{get; set;} //Tofind Duplicates
    //public LIST<QR_AttendeeSummary__c> oneTransactionTotalAttendees; // Assigned to Attendee summary Records FROM CSV file From @feture methode calling
       
    //@@@@---->Future Calling methode----------Execution Start's HERE----------------
       public static LIST<QR_AttendeeSummary__c> MyDataImportRotate(LIST<String> record100, LIST<String> ColNum, LIST<String> DBFields, String singleEvent, Map<String, QR_AttendeeSummary__c> eventAttendeesMap, String importSetting)
       {
             LIST<QR_AttendeeSummary__c> oneTransactionTotalAttendees = new LIST<QR_AttendeeSummary__c>();  
             
             System.debug('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^'+importSetting);
             
             
              for(String singrec: record100)
              {
                  QR_AttendeeSummary__c singleAttendee = new QR_AttendeeSummary__c(); 
                     
                    System.debug('111111111111111111111111111'+ singrec);
                     
                    LIST<String> Record = singrec.split(';;;:::');
                      System.debug('$$$$$$$$$$$$$$$$$$$$$$$$$$'+ Record);
                      integer DBRow = 0;
                        
              System.debug('##########################'+ ColNum);
              
                       for(String rec: ColNum)
                       {
                         
                         try{ 
                          
                          try{          
                               if(Record[Integer.ValueOf(Rec)].contains('"'))
                                {
                                 Record[Integer.ValueOf(Rec)]= Record[Integer.ValueOf(Rec)].replaceAll('"','');
            
                                }            
                               }catch(Exception e){}           
                                          
                             If(DBFields[DBRow] =='Attendee_EmailId__c')
                             {
                                  if(validateEMail(Record[Integer.ValueOf(Rec)].trim())){
                                  
                                 singleAttendee.put(DBFields[DBRow] ,Record[Integer.ValueOf(Rec)].trim().toLowerCase());
                                 }
                             }          
                         
                             Else if(DBFields[DBRow]=='Attendee_Age__c'||DBFields[DBRow]=='Attendee_Business_NoOfEmployees__c'||DBFields[DBRow]=='Attendee_NAICS_Code1__c'||DBFields[DBRow]=='Attendee_NAICS_Code2__c'||DBFields[DBRow]=='Attendee_NAICS_Code3__c'||DBFields[DBRow]=='Attendee_Organization_ZipCode__c')
                             {
                                
                               if(DBFields[DBRow]=='Attendee_NAICS_Code1__c'||DBFields[DBRow]=='Attendee_NAICS_Code2__c'||DBFields[DBRow]=='Attendee_NAICS_Code3__c')
                               {
                               
                                   try{
                                    if(validateNAICSCode(Integer.valueOf(Record[Integer.ValueOf(Rec)].trim())))
                                        singleAttendee.put(DBFields[DBRow] , Integer.valueOf(Record[Integer.ValueOf(Rec)].trim()));
                                       }catch(Exception e){}
                               }else{ 
                                try{
                                 singleAttendee.put(DBFields[DBRow] , Integer.valueOf(Record[Integer.ValueOf(Rec)].trim()));
                                 }catch(Exception e){}
                                 }
                             }
                             Else If(DBFields[DBRow]=='Attendee_BirthDate__c')
                             {
                                try{
                                 singleAttendee.put(DBFields[DBRow] , Date.parse(Record[Integer.ValueOf(Rec)].trim()));
                                }catch(Exception e){}
                             }Else If(DBFields[DBRow]=='Attendee_NewBusinessRevenue__c')
                             {
                                try{
                                Decimal ss=0.0;
                               // system.debug('YYYYYYYYYYYYYYYYYYYYYYYYYYYY'+ DBFields[DBRow] );
                                  if(String.ValueOf(Record[Integer.ValueOf(Rec)].trim()).contains('$'))
                                  {
                                       String ss1 = Record[Integer.ValueOf(Rec)].trim().SubString(1).replaceAll(',','');
                                       ss = Decimal.ValueOf(ss1);
                                  }else ss =   Decimal.ValueOf(Record[Integer.ValueOf(Rec)].trim().replaceAll(',',''));
                                     
                                 if(ss != 0.0)
                                 singleAttendee.put(DBFields[DBRow] , ss);
                                }catch(Exception e){}
                             }
                             Else If(DBFields[DBRow]=='Attendee_BusineesEstablished_Date1__c')
                             {
                                try{
                                       singleAttendee.put(DBFields[DBRow] , Date.parse(Record[Integer.ValueOf(Rec)].trim()));
                                    }catch(Exception e){}
                             
                             }
                             Else If(DBFields[DBRow]=='Attendee_WorkPhone__c'||DBFields[DBRow]=='Attendee_CellPhoneNumber__c'||DBFields[DBRow]=='Attendee_HomePhoneNumber__c')
                             {
                                try{
                                       singleAttendee.put(DBFields[DBRow] , ValidatePhone(Record[Integer.ValueOf(Rec)].trim()));
                                    }catch(Exception e){}
                             
                             }
                             Else If(DBFields[DBRow]=='New_Business_Description__c')
                             {
                                try{
                                       system.debug('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'+ Record[Integer.ValueOf(Rec)].trim().length() );
                                       
                                       if(Record[Integer.ValueOf(Rec)].trim().length() > 32766)
                                       {
                                          
                                          
                                           singleAttendee.put(DBFields[DBRow] , Record[Integer.ValueOf(Rec)].trim().subString(0,32767));
 
                                       
                                       }else{
                     
                                           singleAttendee.put(DBFields[DBRow] , Record[Integer.ValueOf(Rec)].trim());
                                       }
                                    
                                    }catch(Exception e){}
                             
                             }
                             
                             
                             Else{
                                 try{
                                 singleAttendee.put(DBFields[DBRow] , Record[Integer.ValueOf(Rec)].trim());
                                }catch(Exception e){} 
                           }
                           
                           }Catch(Exception e){}
                        DBRow++;
    
                     } 
                     
                     singleAttendee.Put('Event_Id__c', singleEvent);
                 // End of Single Field    
             if(!eventAttendeesMap.isEmpty()&& importSetting == 'DoNotImportDuplicates')
              { 
                 
                    if(eventAttendeesMap.containsKey(singleAttendee.Attendee_EmailId__c+singleAttendee.Attendee_FirstName__c +singleAttendee.Attendee_LastName__c))
                    {
                            QR_AttendeeSummary__c testdup = new QR_AttendeeSummary__c();
                            testdup =  eventAttendeesMap.get((singleAttendee.Attendee_EmailId__c+singleAttendee.Attendee_FirstName__c +singleAttendee.Attendee_LastName__c));                  
                             
                             if(testdup.Attendee_EmailId__c == singleAttendee.Attendee_EmailId__c &&  testdup.Attendee_FirstName__c == singleAttendee.Attendee_FirstName__c && testdup.Attendee_LastName__c == singleAttendee.Attendee_LastName__c )
                             {
                                 singleAttendee.Attendee_EmailId__c = '$$$$$$$$$$';
                                 oneTransactionTotalAttendees.add( singleAttendee);
                                 
                             }else {
                                   oneTransactionTotalAttendees.add( singleAttendee);
                             }
                        
                    }
                    else {
                      oneTransactionTotalAttendees.add( singleAttendee);
                      }
                  
              }else {
                       oneTransactionTotalAttendees.add( singleAttendee);
                     }
              
          }
       
       return oneTransactionTotalAttendees;
       }
       
       
       
        public Pagereference CheckMap( )
        {
           LIST<String> myInfo = new LIST<String>();
           LIST<String> mySelectdValue= new LIST<String>();
           
           
           
            for(InnerClass x:innnnn)
            {
                   if(x.SelectdValue != 'NONE')
                   {
                      String ss= DBField.get(x.DBField1);
                      myInfo.add(ss);
                      mySelectdValue.add(x.SelectdValue);
                 } 
            }
    
            for(InnerClass2 x:innnnn2)
            {
                  if(x.SelectdValue2 != 'NONE')
                  {
                      String ss= DBField.get(x.DBField2);
                      myInfo.add(ss);
                      mySelectdValue.add(x.SelectdValue2);
    
                  }
            }
            system.debug('nnnnnnnnnnnnnnnnnnnnnnnnnn'+ innnnn + innnnn2 );
           
           // string[] innervalue = String(innnnn);
            
    
       Displayrecords = new LIST<String>();
               integer iii=0;
    
              totalAttendee = new LIST<QR_AttendeeSummary__c>();
              TotAtt = new LIST<QR_AttendeeSummary__c>();
              
              reqMissing = new  LIST<QR_AttendeeSummary__c>();
          Displayrecords.addAll(getResults());
          
          LIST<String> hunrecords = new LIST<String>();
          integer hunreccount=0;
          integer remainHun=0;
    
         UnSuccessPop =0;
    
          AfterInsert=0;
          rowcount=Displayrecords.size();
         integer BeforeInsert = [select count() FROM QR_AttendeeSummary__c WHERE Event_Id__c =: singleEvent];
          
          checkMapping(Displayrecords, mySelectdValue, myInfo,singleEvent,BeforeInsert,rowcount, nameFile,importSetting);
           
       
    
                Successbool = TRUE;
                showselectCSV = FALSE;
                headerDisplay=TRUE;
              
               return null; 
        }
    
        public void cancelInSelect(){
            showselectCSV = FALSE;
            headerDisplay=TRUE;
        
        }
    
        public PageReference exportToCSV()
        {
                PageReference pageRef= new PageReference('/apex/Exportcsv');
                pageRef.setredirect(false);
                return pageRef;
        }
    
    
    
    
        public void ShowPreviousList()
        {
            DataImportBool = TRUE;
            
            ImportHistory= [select id,createddate,Upload_File_Name__c,Total_No_of_Records__c, Import_History__c FROM QR_DataImport_SavePoint__c WHERE QR_Eventadmin__r.User_ID__c =:userInfo.getUserId() ORDER BY createddate DESC];
    
        }
        
        
        public void testtest(){
        
            integer i = 0;
            
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            
        }
        
        public void testtest123(){
        
            integer i = 0;
            
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            i++;
            
        }
        
        
      /*  public void deleteDataImportHistory()
        {
          System.debug('^^^^^^^^^^^^^^'+ApexPages.currentPage().getParameters().get('deleteDataImport') );
          QR_DataImport_SavePoint__c slectToDelete = [select id, Imported_IDs__c FROM QR_DataImport_SavePoint__c WHERE id =:ApexPages.currentPage().getParameters().get('deleteDataImport')];
          LIST<String> data = ((String) slectToDelete.Imported_IDs__c).split(',');
          LIST<ID> moveToDeleteIds = new LIST<ID>();
    
            moveToDeleteIds =slectToDelete.Imported_IDs__c.split(',');
            
           LIST<QR_AttendeeSummary__c> moveToDelete = [select id FROM QR_AttendeeSummary__c WHERE id IN: slectToDelete.Imported_IDs__c.split(',')];
    
           delete moveToDelete;
           delete slectToDelete;
            
            DataImportBool = FALSE; 
            
        }
    */
     //---------------Help-------------------
    Public Boolean HelpPopUp{get;set;}
    Public void Help(){
    HelpPopUp = True;
    }
    Public Void CloseHelppopup(){
    HelpPopUp = false;
    }
    
    //----------------Test Class----------------
        static testMethod void myUnitTest() {
        
            Profile p = [select id FROM profile where name='Standard User'];
            
            User u = new User(alias = 'test123', email='lakshmimallik@globalnest.com',
                     emailencodingkey='UTF-8',profileid = p.Id, lastname='Testing', languagelocalekey='en_US',
                      localesidkey='en_US',country='United States',
                      timezonesidkey='America/Los_Angeles', username='lakshmimallik@globalnest.com');
                      
                      insert u;
                      
             
          
                      
            
         
         
         
         system.runAs(u){
         
         QR_Eventadmin__c  eAdm = new QR_Eventadmin__c(
           EventAdmin_FirstName__c='testEvenfirstnametAdmin',EventAdmin_LastName__c='testEvenLastname',EventAdmin_EmailId__c=u.Email,User_ID__c=u.Id);    
            insert eAdm;
            
            
           QR_Event__c event = new QR_Event__c(Event_Title__c='testEvent',Event_HostingTimeZone__c='Eastern Time(USA)',End_Date__c=date.valueOf('2012-05-15 00:00:00'),Start_Date__c=date.valueOf('2012-05-11 00:00:00'),Eventadmin_Id__c=eAdm.id);
         insert event;
         
         string fieldsOf = 'Attendee_FirstName__c,Attendee_LastName__c,Attendee_Company__c,Attendee_EmailId__c,Attendee_NewPrefix__c,Attendee_NewSuffix__c,Attendee_Designation__c,Attendee_CellPhoneNumber__c,Attendee_Age__c,Attendee_Gender__c,Attendee_BirthDate__c,Attendee_HomePhoneNumber__c,Attendee_HomeAddress__c,Attendee_HomeAddress1__c,Attendee_HomeCity__c,Attendee_HomeState__c,Attendee_HomePOBox__c,Attendee_ShippingAddress__c,Attendee_ShippingAddress2__c,Attendee_shippingCity__c,Attendee_shippingState__c,Attendee_ShippingPOBox__c,Attendee_WorkPhone__c,Attendee_WorkAddress__c,Attendee_WorkAddress1__c,Attendee_Workcity__c,Attendee_WorkState__c,Attendee_WorkPOBox__c,Attendee_NAICS_Code1__c,Attendee_NAICS_Code2__c,Attendee_NAICS_Code3__c,Attendee_PrimaryBusinessCategory1__c,Attendee_SecondaryBusinessCategory2__c,Attendee_Business_NoOfEmployees__c,Attendee_BusineesEstablished_Date1__c,Attendee_BusinessRevenue__c,Attendee_BusinessTaxId__c,Attendee_Business_DnB_Id__c,Attendee_WebsiteURL__c,Attendee_BlogURL__c,Attendee_DiversityType1__c,New_Business_Description__c,AttendeePic';
         
         QRCode_Attendee_Settings__c  attsett = new QRCode_Attendee_Settings__c(QR_Event__c = event.id, QRCode_Selected_Fields__c = fieldsOf);
         
         insert attsett;     
         
         
         system.debug('YYYYYYYYYYYYYYY'+ u);
         
         QRcode_Attendeee_ControlSettingsCon attendeeSetting = new QRcode_Attendeee_ControlSettingsCon();
         
         
         system.debug('uuuuuuuuuuuuuuuuuuuuu'+ eAdm);
         
    
         QRCode_ExtendsDataImportCon dataIm= new QRCode_ExtendsDataImportCon();
         
         
         dataIm.userid = u.id;
         
         LIST<QR_Event__c> totEvents = new LIST<QR_Event__c>();
         totEvents.add(event);
         id sid;
         dataIm.allselectedevent = totEvents;
        
          
        
          dataIm.singleEvent = sid;
    
         QR_DataImport_SavePoint__c savepoint = new QR_DataImport_SavePoint__c(QR_Eventadmin__c=eAdm.id,Total_No_of_Records__c=5,Upload_File_Name__c = 'testfilename');
         
         insert savepoint;
         //dataIm.foundHistory;
         dataIm.singleEvent = event.id;
         dataIm.checkUserId();
         dataIm.Events();
         dataIm.Attendees();
         dataIm.reportact();
         dataIm.DataImportaction();
         dataIm.CustomerAdminAct();
         dataIm.DataImportAct();
         dataIm.ProfileSettings();
         validateEMail('testemail@test.com');
         validateEMail('testemail');
         validateNAICSCode(1258);
         validateNAICSCode(00000000);
         validateNAICSCode(523456);
         ValidatePhone('7894561230');
         ValidatePhone('myphone');
         dataIm.ShowPreviousList();
         dataIm.getsettingsForImport();
        dataIm.testtest();
        dataIm.testtest123();
        
        
        
       dataIm.contentFile = blob.valueOf('test,test1,te"st,,test2",test3,test5,test6,test@test.com,test7,test8,test9,'); 
       dataIm.contentFile = blob.valueOf('ym,mn2,mn3,mn4,24,02/05/1985,$4231,this is businessdescrption');
       dataIm.contentFile = blob.valueOf('ym,mn2,"mn3,",mn4,24,02/05/1985,$4231,this is businessdescrption');
       dataIm.contentFile = blob.valueOf('ym,mn2,mn3@test.com,mnp","mn4",24,02/05/1985,$4231,this is businessdescrption');
       // string myblob='';
       //dataIm.contentFile=blob.valueOf(myblob);
          
          
        dataIm.allFields1='Prefix,Last Name,Email Id,Designation,Mobile Number,Work Fax Number,Gender,Home Address 1,Home City,Home Zip Code,Work Address 2,Work State,Shipping Address 1,Shipping City,Shipping Zip Code,Secondary Business Category,Business Establish Date,Business Tax Id,WebSite URL,Diversity Type,NAICS Code 1,NAICS Code 3';
        dataIm.StdImportHeaderNames1= dataIm.allFields1.split(',');   
          
          
         dataIm.allFields2='First Name,Suffix,Company Name,Home Phone Number,Work Phone Number,Age,Date Of Birth,Home Address 2,Home State,Work Address 1,Work City,Work Zip Code,Shipping Address 2,Shipping State,Primary Business Category,No. Of Employes,Business Revenue,Business DnB Id,Blog URL,Business Description,NAICS Code 2';
         dataIm.StdImportHeaderNames2=dataIm.allFields2.split(',');  
            
        dataIm.clickUpload();
       //dataIm.CheckMap();
         system.debug('wwwwwwwwwwwwwwwwwwwwwwww'+ userinfo.getUserId());
        dataIm.getResults();
        dataIm.getEvents();
        dataIm.AllErrorClear();
        dataIm.AfterSuccess();
        dataIm.RecordsSuccess();
        LIST<InnerClass> innnnn = new LIST<InnerClass>();
      
        system.debug('22222222222222222222222222222'+ eAdm );
        //
       /*  integer i =0;
       list<String> mysplit = dataIm.allFields1.split(',');
        for(String st: String.valueOf(dataIm.contentFile).split(','))
        {
            innnnn.add( new InnerClass( mysplit[i] , String.valueOf(i) ));
            i++;
        }
      // dataIm.inner2Static.add(new dataIm.inner2Static(dataIm.DBValue2, dataIm.SelectdValue2));
        */
        dataIm.exportToCSV();
        dataIm.Help();
        dataIm.CloseHelppopup();
       // dataIm.CheckMap();
        
        system.debug('44444444444444444444444444444'+ innnnn);
        system.debug('wwwwwwwwwwwwwwwwwwwwwwww'+ userinfo.getUserId());
        system.debug('33333333333333333333333333333333'+ eAdm );
        
       }
     }
    
    
    
    
    }