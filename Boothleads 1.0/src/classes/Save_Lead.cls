@RestResource(urlMapping='/Save_Lead/*')
        global with sharing class Save_Lead{
        
        
        global static QR_AttendeeSummary__c AttendeeId;
        global static QR_BoothPersonnel__c BoothPersonal;
        global static QR_Attendee_BoothVisitSummary__c  Lead;
        
        global static String  usrName1;
        
        
        global static  String usrName;
        
        global static  String  EventBrite;
       
        global static   String  Barcode;
        
        global static  String  Firstname;
        
        global  static String  Lastname;
        
        
        global static  String Email;
        
        global static  String  Company;
        
        global static String  Title;
        
        global static  String  Notes;
        
        
        global static String  Phone;
        
        global static String  Fupdate;
        
        global static String  LeadCategory;
        
        global static   Date FollowUpDate;
        
        global static   List<Error__c>  error;
        
        global static   Error__c error1;
        
        @HttpGet
        
        global static Sobject  doGet() {
        
        
        //Request Context
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        System.debug('@@@@request'+req);
        
        
        
        usrName1 =req.params.get('Id');
        String def='QR_BP_';
        
        usrName = usrName1;
        
       //pc usrName=def+usrName1;
       
        System.debug('The id'+usrName );
        
        EventBrite=req.params.get('EventBrite');
        
        Barcode=req.params.get('Barcode');
        
        Firstname=req.params.get('Firstname');
        
        Lastname=req.params.get('Lastname');
        
        Company=req.params.get('Company');
       
        Title=req.params.get('Title');
         
        Email=req.params.get('Email');
         
        
        Notes=req.params.get('Notes');
        
        Phone=req.params.get('Phone');
       
        Fupdate=req.params.get('Followdate');
        system.debug('Follow up date'+Fupdate);
       
        
        LeadCategory=req.params.get('Leadcategory');
      
        System.debug('The Value'+Fupdate);
        
        try{
        if(Fupdate!=''|| Fupdate!=null){
        FollowUpDate= Date.Parse(Fupdate);
        }
        }
        
        Catch(Exception e){
        
        
        }
        
        DateTime datet= system.today();
        
       
        if(Barcode==null || Barcode==''){
       
        error1 = new Error__c(Error__c='Please Verify the Barcode');
        
        return error1;
        }
        
        
      
        
      
        
        try{
        
        /** pc
        
        Lead=[select Attendee_NumberOfVisits__c,Attendee_LeadCategory__c,Attendee_ScannedBy__c,
               Attendee_FirstGatheredOn__c,Attendee_FirstName__c,Attendee_LastName__c,
               Attendee_Company__c,Attendee_Designation__c,Attendee_GatheredComments__c,
               Attendee_EmailId__c,Attendee_PhoneNumber__c,Attendee_NextFollowUpDate__c,
               Attendee_LastGatheredBy__c,Attendee_LastGatheredOn__c 
               from QR_Attendee_BoothVisitSummary__c where Attendee_ScannedBy__r.Name=:usrName and Attendee_BarCode1__c=:Barcode];
          **/  
          
         Lead=[select Attendee_NumberOfVisits__c,Attendee_LeadCategory__c,Attendee_ScannedBy__c,
               Attendee_FirstGatheredOn__c,Attendee_FirstName__c,Attendee_LastName__c,
               Attendee_Company__c,Attendee_Designation__c,Attendee_GatheredComments__c,
               Attendee_EmailId__c,Attendee_PhoneNumber__c,Attendee_NextFollowUpDate__c,
               Attendee_LastGatheredBy__c,Attendee_LastGatheredOn__c 
               from QR_Attendee_BoothVisitSummary__c where Attendee_ScannedBy__r.Random_Number__c=:usrName and Attendee_BarCode1__c=:Barcode];  
             
        
        Lead.Attendee_FirstName__c=Firstname;
        Lead.Attendee_LastName__c=Lastname;
        Lead.Attendee_Company__c=Company;
        Lead.Attendee_GatheredComments__c=Notes;
        Lead.Attendee_Designation__c=Title;
        //Lead.Attendee_ScannedBy__c=usrName;
        Lead.Attendee_EmailId__c=Email;
        Lead.Attendee_PhoneNumber__c=Phone;
        Lead.Attendee_NextFollowUpDate__c =FollowUpDate;
        Lead.Attendee_LastGatheredOn__c=datet;
        Lead.Attendee_LastGatheredBy__c=usrName; 
        Lead.Attendee_LeadCategory__c =LeadCategory;
        update Lead;
      
        error1 = new Error__c(Message__c='Save Successful');
        insert error1;
       
        return error1;
        
        }
        
        catch(Exception ex){
      
        error1 = new Error__c(Message__c='Save Unsuccessful');
       
        return error1;
        }
        
        return null;
        
        }
        
        static testMethod void testRest() {
                // set up the request object
                
                
                
                
                System.RestContext.request = new RestRequest();
                RestContext.request.requestURI = '/GlobalnestEM/Save_Lead';
                RestContext.request.addParameter('Id', '');
                 RestContext.request.addParameter('Barcode', '');
                RestContext.request.addParameter('EventBrite', 'True');
           
                  RestContext.request.addParameter('Firstname', 'venkatesh');
                  
                   RestContext.request.addParameter('Lastname', 'Puppala');
                   
                    RestContext.request.addParameter('Company', 'GlobalnestLLC');
                    
                     RestContext.request.addParameter('Title', 'GN');
                     
                      RestContext.request.addParameter('Email', 'venkatesh@globalnest.com');
                      
                       RestContext.request.addParameter('Notes', 'this is the notes');
                       
                        RestContext.request.addParameter('Phone', '9989522656'); 
                        
                         RestContext.request.addParameter('Followdate', '03/03/2012');
                        
                 Save_Lead.doGet();
                
                
                
                System.RestContext.request = new RestRequest();
                RestContext.request.requestURI = '/GlobalnestEM/Save_Lead';
                RestContext.request.addParameter('Barcode', '');
                
                 Save_Lead.doGet();
                 
                 
                 
   QR_Eventadmin__c Qad = new QR_Eventadmin__c();
    
    Qad.EventAdmin_EmailId__c = 'venkatesh@gobalnest.com';      
    
    Qad.EventAdmin_FirstName__c = 'Venkatesh';
    
    Qad.EventAdmin_LastName__c = 'Puppala';
    
    Qad.EventAdmin_PhoneNumber__c = '9989522656';
    
    insert Qad;
    
            
        QR_Event__c Qeve = new QR_Event__c();
            
        Qeve.Event_Title__c ='Event test';
        
        Qeve.Event_HostingTimeZone__c = 'Eastern Time(USA)';
        
        
        date startDate = date.newInstance(2008, 1, 1);
        
        date endDate = date.newInstance(2008, 2, 2);
        
        Qeve.Start_Date__c  = startDate;
        
        Qeve.End_Date__c  = endDate;
    
        Qeve.Eventadmin_Id__c = Qad.id;
        
        insert Qeve;
        
        
    QR_AttendeeSummary__c Qat1 = new QR_AttendeeSummary__c();
    
    Qat1.Attendee_FirstName__c  = 'Venkatesh';
    
    Qat1.Attendee_LastName__c  = 'Puppala';

    Qat1.Attendee_EmailId__c  = 'Venkatesh@globalnest.com';    
    
    Qat1.Attendee_Company__c ='GlobalnestLLC';
    
    QAt1.Event_Id__c = Qeve.id;  
        
        insert QAt1;
        
    Qat1.Attendee_Barcode3__c = Qat1.id;
    
    upsert QAt1;
        
        
        
            QR_BoothAdmin__c QBA = new  QR_BoothAdmin__c();
            
            QBA.BoothAdmin_FirstName__c = 'venkateshad';
            
            QBA.BoothAdmin_LastName__c = 'Puppala';
          
            QBA.BoothAdmin_EmailId__c ='venkatesh@globalnest.com';
            
            QBA.BoothAdmin_Organization_Name__c = 'globalnest';
        
            QBA.BoothAdmin_IsActive__c = true;
            
            QBA.Event_Id__c =Qeve.id;
    
         insert QBA;
         
         
         
    
        QR_BoothPersonnel__c QBPA = new QR_BoothPersonnel__c();
        
        
          QBPA.BoothAdmin_Id__c = QBA.id;
          
          QBPA.BoothPersonnel_FirstName__c ='Venkatesh';
          
          QBPA.BoothPersonnel_LastName__c ='Puppala';
          
          QBPA.BoothPersonnel_EmailId__c ='venkatesh@globalnest.com';
          
          QBPA.Random_Number__c ='1234567';
          
            insert QBPA;
         
          String QBPAId = QBPA.id;
          
          QR_BoothPersonnel__c QBPA1=[select id,name from QR_BoothPersonnel__c where id=:QBPA.id];
         
          String QBPAId2 = QBPA1.name;
           
          String QBPAId1 = QBPAId2.replace('QR_BP_','');
           
           
           
           
           
            
            QR_Attendee_BoothVisitSummary__c Qlead = new   QR_Attendee_BoothVisitSummary__c();
          
            
            Qlead.Attendee_FirstName__c = 'venkatesh';
            
            Qlead.Attendee_LastName__c = 'Puppala';

            Qlead.Attendee_Company__c ='GL';
             
            Qlead.Attendee_Designation__c = 'Software Developer';
            
            Qlead.Attendee_EmailId__c = 'venkatesh@globalnest.com';
            
            Qlead.Attendee_PhoneNumber__c ='9989522656';
            
            Qlead.Attendee_BarCode1__c = Qat1.Attendee_Barcode3__c;
           Qlead.Attendee_ScannedBy__c= QBPA1.id;
            insert Qlead;
            
                 
                 
                 
                 
                
                System.RestContext.request = new RestRequest();
                RestContext.request.requestURI = '/GlobalnestEM/Save_Lead';
                RestContext.request.addParameter('Id',QBPA.Random_Number__c);
                RestContext.request.addParameter('Barcode',Qat1.Attendee_Barcode3__c);
                RestContext.request.addParameter('EventBrite', 'True');
           
                  RestContext.request.addParameter('Firstname', 'venkatesh');
                  
                   RestContext.request.addParameter('Lastname', 'Puppala');
                   
                    RestContext.request.addParameter('Company', 'GlobalnestLLC');
                    
                     RestContext.request.addParameter('Title', 'GN');
                     
                      RestContext.request.addParameter('Email', 'venkatesh@globalnest.com');
                      
                       RestContext.request.addParameter('Notes', 'this is the notes');
                       
                        RestContext.request.addParameter('Phone', '9989522656'); 
                        
                         RestContext.request.addParameter('Followdate', '03/03/2012');
                        
                           
        
                // Invoke the method directly
               Save_Lead.doGet();
              
               
               
               
               
            }
        
        
        
        
        }