@RestResource(urlMapping='/Booth_Login/*')
    global with sharing class Booth_Login{
    
    
    
    global static  String usrName1;
    
    global static QR_BoothPersonnel__c  bpersonal;
    
    
    global static Error__c  error;
    
    global static QR_BoothAdmin__c bAdmin;
    
    global static QR_BoothPersonnel__c  bpersonal1;
    
    global static String def;
    
    global static String usrName;
    
    
    @HttpGet
    
    global static Sobject  doGet() {
    RestRequest req = RestContext.request;
    RestResponse res = RestContext.response;
    System.debug('@@@@request'+req);
    //String deviceId= req.params.get('deviceId');
    
    //deviceId= req.params.get('deviceId');
    
    //String usrName1 = req.params.get('Id');
    
    usrName1 = req.params.get('Id');
    
   
    def='QR_BP_';
    
    usrName = usrName1;
    
   // pc usrName=def+usrName1; 
    system.debug('This is UserName'+usrName);
    
    
    if(usrName1==null || usrName1==''){
    

    
    error = new Error__c(Error__c='Incorrect Login Id. Please call your Booth Admin to reset the password. boothleads.com');
   
    return error;
    
    }
    
   
    try{
    QR_BoothPersonnel__c  boothId;
    
    //QR_BoothPersonnel__c  bpersonal =[select BoothPersonnel_FirstName__c,BoothPersonnel_LastName__c,BoothPersonnel_EmailId__c,BoohtPersonnel_Designation__c from QR_BoothPersonnel__c where Name=:usrName];
    //QR_BoothPersonnel__c  bpersonal =[select BoothPersonnel_FirstName__c,BoothPersonnel_LastName__c,BoothPersonnel_EmailId__c,BoohtPersonnel_Designation__c,BoothAdmin_Id__c from QR_BoothPersonnel__c where Name=:usrName];
    
    // pc bpersonal =[select BoothPersonnel_FirstName__c,BoothPersonnel_LastName__c,BoothPersonnel_EmailId__c,
       // pc  BoohtPersonnel_Designation__c,BoothAdmin_Id__c from QR_BoothPersonnel__c where Name=:usrName];
    
    
    bpersonal =[select BoothPersonnel_FirstName__c,BoothPersonnel_LastName__c,BoothPersonnel_EmailId__c,
        BoohtPersonnel_Designation__c,BoothAdmin_Id__c from QR_BoothPersonnel__c where Random_Number__c=:usrName];
    
    
    System.debug('bpersonal'+bpersonal.BoothAdmin_Id__c);
   
    
    bAdmin=[select id,Event_Id__r.Event_HostedByEventBrite__c,BoothAdmin_IsActive__c 
           from QR_BoothAdmin__c where id=:bpersonal.BoothAdmin_Id__c];
    
    System.debug('bpersonal'+bAdmin);
    if(bAdmin.BoothAdmin_IsActive__c==false){
    
   
    
    error = new Error__c(Error__c='Incorrect Login Id. Please call your Booth Admin to reset the password. boothleads.com');
   
    return error;
    
    }
    
    /**
    if(bAdmin.Event_Id__r.Event_HostedByEventBrite__c==true){
    bpersonal.Event_HostedByEventBrite__c = true;
    update bpersonal;
    
    System.debug('bpersonal1233'+bpersonal);
    }
    else{
    bpersonal.Event_HostedByEventBrite__c = false;
    update bpersonal;
    
    System.debug('bpersonal'+bpersonal);
    } 
    //QR_BoothPersonnel__c  
    
    **/
    
 //pc bpersonal1=[select id, BoothPersonnel_FirstName__c,BoothPersonnel_LastName__c,
           //pc  Event_HostedByEventBrite__c from QR_BoothPersonnel__c  where id=:bpersonal.id];
    
   
   
    bpersonal1=[select id, BoothPersonnel_FirstName__c,BoothPersonnel_LastName__c,
               Event_HostedByEventBrite__c from QR_BoothPersonnel__c  where Random_Number__c=:usrName];
    
   
   
    System.debug('bpersonal'+bpersonal);
    return bpersonal1;
    }
    
    
    catch(System.QueryException ex){
    
  
    
    error = new Error__c(Error__c='Incorrect Login Id. Please call your Booth Admin to reset the password. boothleads.com');
    
    return error;
    
    
    }
    }
    
    
    static testMethod void testRest() {
        
        
        
        
        
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
          
           QBPA.Random_Number__c='1234';
          
            insert QBPA;
         
          String QBPAId = QBPA.id;
          
          String BPID = QBPA.Random_Number__c; 
          
       // pc String BPID =   QBPAId.replace('QR_BP_','');
          
        
            System.RestContext.request = new RestRequest();
            
            RestContext.request.requestURI = '/GlobalnestEM/Booth_Login';
            
            RestContext.request.addParameter('Id', BPID);
            
            
            
            // Invoke the method directly
           
           
             Booth_Login.doGet();
          
    
        
        
         System.RestContext.request = new RestRequest();
            
            RestContext.request.requestURI = '/GlobalnestEM/Booth_Login';
            
            RestContext.request.addParameter('Id', '');
        
          
                
         Booth_Login.doGet();
         
        
            // set up the request object
            System.RestContext.request = new RestRequest();
            
            RestContext.request.requestURI = '/GlobalnestEM/Booth_Login';
            
            RestContext.request.addParameter('Id', 'BPID');
            
            
            
            // Invoke the method directly
           
           
             Booth_Login.doGet();
          
           //System.assertEquals(Booth_Login.usrName1,null);
           
            System.assertNOTEquals(Booth_Login.error,null);
    
    

    
    
           
        }
    
    
    
    
    
    }