@RestResource(urlMapping='/getLead/*')
    global with sharing class getLead{
    
    
    global static  QR_AttendeeSummary__c AttendeeId;
    
    global static  QR_BoothPersonnel__c BoothPersonal;

    global static  QR_Attendee_BoothVisitSummary__c  Lead;
    
    global static  list<Error__c> error;
    
    global static  String usrName1;
    
    global static String usrName;
    
    global static  Error__c error1;
    
    global static  List<QR_Attendee_BoothVisitSummary__c>  Leads;
    
    global static  String def; 
    
    @HttpGet
    
    global static List<Sobject>  doGet() {
    
    
    //Request Context
    
    RestRequest req = RestContext.request;
    RestResponse res = RestContext.response;
    System.debug('@@@@request'+req);
    error= new list<Error__c>();
   
    usrName1 = req.params.get('Id');
    
    def='QR_BP_';
   
    // pc usrName=def+usrName1; 
    usrName=usrName1; 
    
   
    try{
  
  /** pc
    Leads =[select Attendee_FirstName__c,Attendee_LastName__c,Attendee_Company__c,
            Attendee_Designation__c,Attendee_EmailId__c,Attendee_PhoneNumber__c,
            Attendee_GatheredComments__c,Attendee_BarCode1__c,Attendee_NumberOfVisits__c,
            Attendee_NextFollowUpDate__c,Attendee_LeadCategory__c 
            from QR_Attendee_BoothVisitSummary__c where Attendee_ScannedBy__r.Name=:usrName ORDER BY CreatedDate DESC];
  **/          
            
       Leads =[select Attendee_FirstName__c,Attendee_LastName__c,Attendee_Company__c,
            Attendee_Designation__c,Attendee_EmailId__c,Attendee_PhoneNumber__c,
            Attendee_GatheredComments__c,Attendee_BarCode1__c,Attendee_NumberOfVisits__c,
            Attendee_NextFollowUpDate__c,Attendee_LeadCategory__c 
            from QR_Attendee_BoothVisitSummary__c where Attendee_ScannedBy__r.Random_Number__c=:usrName ORDER BY CreatedDate DESC];
           
            
            
    
    if(Leads.size()>0){

    return Leads;
    }
    
    else{
  
    error1 = new Error__c(Error__c='There are no leads scaned till now');
  
    error.add(error1);
    return error;
    }
    }
    
    catch(Exception ex){
    
    }
    
    return null;
    
    }
    
    static testMethod void testRest() {
          
            
            usrName = 'QR_BP_25120000041';
         Error__c error3 = new Error__c(Error__c='Please Give BoothPersonal ID');
    insert error3;
            
           Error__c    error2 = new Error__c(Error__c='There are no leads scaned till now');
       insert error2;
            
            
           error   = new  list<Error__c> ();
           
           
                
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
          
          QBPA.Random_Number__c = '1234';
          
          
            insert QBPA;
         
          String QBPAId = QBPA.id;
           
           
           
           
           
            
            QR_Attendee_BoothVisitSummary__c Qlead = new   QR_Attendee_BoothVisitSummary__c();
            
           
            
            Qlead.Attendee_FirstName__c = 'venkatesh';
            
            Qlead.Attendee_LastName__c = 'Puppala';

            Qlead.Attendee_Company__c ='GL';
             
            Qlead.Attendee_Designation__c = 'Software Developer';
            
            Qlead.Attendee_EmailId__c = 'venkatesh@globalnest.com';
            
            Qlead.Attendee_PhoneNumber__c ='9989522656';
            
            Qlead.Attendee_BarCode1__c = 'QR_AT_1812_0007797';
           Qlead.Attendee_ScannedBy__c= QBPAId;
            insert Qlead;
            
            
             Leads = new List<QR_Attendee_BoothVisitSummary__c> ();
            Leads.add(Qlead);
            
            System.RestContext.request = new RestRequest();
            RestContext.request.requestURI = '/GlobalnestEM/getLead';
            RestContext.request.addHeader('Id',  QBPA.Random_Number__c);
            
            
            System.assertNotEquals(def,'QR_BP_');
           
           
           System.assertEquals(usrName,'QR_BP_25120000041');
    
            
           getLead.doGet();
           
           System.assertEquals(error1.Error__c,error2.Error__c);
           
            System.assertEquals(error1.Error__c,error2.Error__c);
           
           
           
           
       
           
          
        }
    
    
    
    
    
    }