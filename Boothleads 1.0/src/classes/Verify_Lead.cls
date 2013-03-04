@RestResource(urlMapping='/Verify_Lead/*')
global with sharing class Verify_Lead{

global static String barcode1;

global static String  usrName1;

global static String usrName;

global static String EventBrite;

global static QR_AttendeeSummary__c AttendeeId;
global static QR_BoothPersonnel__c BoothPersonal;
global static QR_Attendee_BoothVisitSummary__c  Lead;
global static QR_Attendee_BoothVisitSummary__c  Lead1;
global static Error__c  error;
global static DateTime datet= system.today();


@HttpGet

global static Sobject  doGet() {
RestRequest req = RestContext.request;
RestResponse res = RestContext.response;
System.debug('@@@@request'+req);



barcode1=req.params.get('Barcode');

usrName1 =req.params.get('Id');
String def='QR_BP_';


// pc usrName=def+usrName1; 

usrName= usrName1; 


System.debug('@@@@request'+usrName);



EventBrite=req.params.get('EventBrite');
System.debug('@@@@request'+EventBrite);


//Bar code Validations
if(barcode1==null || barcode1==''){

error = new Error__c(Error__c='Please Verify the Barcode');
//insert error;
return error;
}


else if(EventBrite=='False' ||EventBrite=='True'){
System.debug('barr'+barcode1.length());
try{
AttendeeId = [select Id,Attendee_FirstName__c,Attendee_LastName__c, Attendee_Company__c,Attendee_EmailId__c,
            Attendee_ThroughEventBrite__c,Attendee_Designation__c,Event_Id__c from QR_AttendeeSummary__c where Attendee_Barcode3__c=:barcode1];

System.debug('this is the id'+AttendeeId.Event_Id__c);
System.debug('brrr'+AttendeeId);
}
catch(System.QueryException ex){
error = new Error__c(Error__c='Please Verify the Barcode');
return error;
}
}

//Booth Personal validatons from the DataBase 

if(usrName !=''||usrName !=null){
//Getting the values from the Boothpersonl
try{

// pc BoothPersonal =[select Id,BoothAdmin_Id__r.Event_Id__c from QR_BoothPersonnel__c where Name=:usrName];

BoothPersonal =[select Id,BoothAdmin_Id__r.Event_Id__c from QR_BoothPersonnel__c where Random_Number__c=:usrName];

System.debug('This is id'+BoothPersonal.BoothAdmin_Id__r.Event_Id__c);

System.debug('brrr'+BoothPersonal);
}
catch(System.QueryException ex){
error = new Error__c(Error__c='Please Provide a Valid Booth Personnel ID');
return error;

}
}

try{


//Lead=[select Id,Attendee_FirstName__c,Attendee_LastName__c,Attendee_FirstGatheredBy__c,Attendee_FirstGatheredOn__c,Attendee_LastGatheredBy__c,Attendee_LastGatheredOn__c,Attendee_NumberOfVisits__c from QR_Attendee_BoothVisitSummary__c  where  Attendee_BarCode1__c=:barcode1  AND Attendee_ScannedBy__r.Name=:usrName];

/** PC
Lead1=[select Attendee_FirstName__c,Attendee_LastName__c,Attendee_Company__c,Attendee_Designation__c,
              Attendee_BarCode1__c,Attendee_NumberOfVisits__c,Attendee_FirstGatheredBy__c,Attendee_FirstGatheredOn__c,
              Attendee_LastVisitedOn__c,Attendee_LastGatheredBy__c,Attendee_LastGatheredOn__c, Attendee_NextFollowUpDate__c,
              Attendee_LeadCategory__c from QR_Attendee_BoothVisitSummary__c where  Attendee_BarCode1__c=:barcode1  AND Attendee_ScannedBy__r.Name=:usrName];
**/

Lead1=[select Attendee_FirstName__c,Attendee_LastName__c,Attendee_Company__c,Attendee_Designation__c,
              Attendee_BarCode1__c,Attendee_NumberOfVisits__c,Attendee_FirstGatheredBy__c,Attendee_FirstGatheredOn__c,
              Attendee_LastVisitedOn__c,Attendee_LastGatheredBy__c,Attendee_LastGatheredOn__c, Attendee_NextFollowUpDate__c,
              Attendee_LeadCategory__c from QR_Attendee_BoothVisitSummary__c where  Attendee_BarCode1__c=:barcode1  AND Attendee_ScannedBy__r.Random_Number__c=:usrName];



Lead1.Attendee_NumberOfVisits__c=Lead1.Attendee_NumberOfVisits__c+1;
Lead1.Attendee_LastGatheredOn__c=datet;
update Lead1;

/** PC
Lead=[select Attendee_FirstName__c,
Attendee_LastName__c,
Attendee_Company__c,
Attendee_Designation__c,
Attendee_BarCode1__c,
Attendee_NumberOfVisits__c,
Attendee_NextFollowUpDate__c,
Attendee_LeadCategory__c,
Attendee_EmailId__c,
Attendee_PhoneNumber__c,
Attendee_GatheredComments__c from QR_Attendee_BoothVisitSummary__c where  Attendee_BarCode1__c=:barcode1  AND Attendee_ScannedBy__r.Name=:usrName AND id=:lead1.id];

**/

Lead=[select Attendee_FirstName__c,
Attendee_LastName__c,
Attendee_Company__c,
Attendee_Designation__c,
Attendee_BarCode1__c,
Attendee_NumberOfVisits__c,
Attendee_NextFollowUpDate__c,
Attendee_LeadCategory__c,
Attendee_EmailId__c,
Attendee_PhoneNumber__c,
Attendee_GatheredComments__c from QR_Attendee_BoothVisitSummary__c where  Attendee_BarCode1__c=:barcode1  AND Attendee_ScannedBy__r.Random_Number__c=:usrName AND id=:lead1.id];



System.debug('This is lead info'+lead);
return lead;

}


catch(System.QueryException ex){


if(String.ValueOf(AttendeeId.Event_Id__c) != String.ValueOF(BoothPersonal.BoothAdmin_Id__r.Event_Id__c))
{

error = new Error__c(Error__c='Provided Invalid Event Attendee Details');

return error;
}


if(EventBrite=='False'|| EventBrite=='True' ){


AttendeeId = [select Id,Attendee_FirstName__c,Attendee_LastName__c, Attendee_EmailId__c,
               Attendee_Company__c,Attendee_Designation__c,Attendee_Organization_City__c,
         Attendee_CellPhoneNumber__c,Attendee_WorkPhone__c,Attendee_PrimaryBusinessCategory1__c 
         from QR_AttendeeSummary__c where Attendee_Barcode3__c=:barcode1];
System.debug('@@@@'+AttendeeId);
}

System.debug('@@@@'+usrName);

// PC BoothPersonal =[select Id from QR_BoothPersonnel__c where Name=:usrName];

BoothPersonal =[select Id from QR_BoothPersonnel__c where Random_Number__c=:usrName];

System.debug('@@@@'+BoothPersonal.Id);
if(EventBrite=='True'){

lead1 = new  QR_Attendee_BoothVisitSummary__c(Attendee_BarCode1__c=Barcode1,
Attendee_ScannedBy__c=BoothPersonal.id,
Attendee_FirstGatheredBy__c=BoothPersonal.id,
Attendee_LastGatheredBy__c=BoothPersonal.id,
Attendee_FirstGatheredOn__c=datet,
Attendee_LastVisitedOn__c=datet,
Attendee_LastGatheredOn__c=datet,
Attendee_NumberOfVisits__c=1,
GlobalNestEM_Event_HostedByEventBrite__c=true,
Attendee_LeadCategory__c='Cold Lead',
Attendee_FirstName__c=AttendeeId.Attendee_FirstName__c,
Attendee_LastName__c=AttendeeId.Attendee_LastName__c,
Attendee_Company__c=AttendeeId.Attendee_Company__c,
Attendee_Designation__c=AttendeeId.Attendee_Designation__c,
Attendee_EmailId__c=AttendeeId.Attendee_EmailId__c,
Attendee_Organization_City__c=AttendeeId.Attendee_Organization_City__c,
Attendee_PhoneNumber__c=AttendeeId.Attendee_WorkPhone__c,
Attendee_PrimaryBusinessCategory1__c=AttendeeId.Attendee_PrimaryBusinessCategory1__c);
 
insert lead1;

lead =[select Attendee_FirstName__c,Attendee_LastName__c,Attendee_Company__c,
Attendee_Designation__c,Attendee_BarCode1__c,Attendee_NumberOfVisits__c,Attendee_EmailId__c,
Attendee_PhoneNumber__c,Attendee_LeadCategory__c from QR_Attendee_BoothVisitSummary__c where id=:lead1.id];
}
else{
lead1 = new  QR_Attendee_BoothVisitSummary__c(Attendee_BarCode1__c=Barcode1,Attendee_ScannedBy__c=BoothPersonal.id,Attendee_FirstGatheredBy__c=BoothPersonal.id,
Attendee_LastGatheredBy__c=BoothPersonal.id,Attendee_FirstGatheredOn__c=datet,Attendee_LastGatheredOn__c=datet,
Attendee_LastVisitedOn__c=datet,Attendee_NumberOfVisits__c=1, Attendee_FirstName__c=AttendeeId.Attendee_FirstName__c,
Attendee_LastName__c=AttendeeId.Attendee_LastName__c,Attendee_Company__c=AttendeeId.Attendee_Company__c,
Attendee_Designation__c=AttendeeId.Attendee_Designation__c,Attendee_EmailId__c=AttendeeId.Attendee_EmailId__c,
Attendee_Organization_City__c=AttendeeId.Attendee_Organization_City__c,
Attendee_PhoneNumber__c=AttendeeId.Attendee_WorkPhone__c,Attendee_PrimaryBusinessCategory1__c=AttendeeId.Attendee_PrimaryBusinessCategory1__c,
GlobalNestEM_Event_HostedByEventBrite__c=false,Attendee_LeadCategory__c='Cold Lead'); 

insert lead1;

lead =[select Attendee_FirstName__c,Attendee_LastName__c,Attendee_Company__c,Attendee_Designation__c,Attendee_BarCode1__c,
Attendee_NumberOfVisits__c,Attendee_EmailId__c,
Attendee_PhoneNumber__c,Attendee_LeadCategory__c from QR_Attendee_BoothVisitSummary__c where id=:lead1.id];
}


System.debug('This is lead value'+lead);
return lead;


}
}

static testMethod void testRest() {
    
    
 
    
    
    
    
    QR_Eventadmin__c Qad = new QR_Eventadmin__c();
    
    Qad.EventAdmin_EmailId__c = 'venkatesh106@gobalnest.com';       
    
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
        
        
        
    QR_AttendeeSummary__c Qat = new QR_AttendeeSummary__c();
    
    Qat.Attendee_FirstName__c  = 'Venkatesh';
    
    Qat.Attendee_LastName__c  = 'Puppala';

    Qat.Attendee_EmailId__c  = 'Venkatesh101@globalnest.com';    
    
    Qat.Attendee_Company__c ='GlobalnestLLC';
    
    QAt.Event_Id__c = Qeve.id;  
        
        insert QAt;
        
    QAt.Attendee_Barcode3__c = Qat.id;
    
    upsert QAt;
    
         QR_AttendeeSummary__c Qat1 = new QR_AttendeeSummary__c();
    
    Qat1.Attendee_FirstName__c  = 'Venkatesh';
    
    Qat1.Attendee_LastName__c  = 'Puppala';

    Qat1.Attendee_EmailId__c  = 'Venkatesh100@globalnest.com';    
    
    Qat1.Attendee_Company__c ='GlobalnestLLC';
    
    QAt1.Event_Id__c = Qeve.id;  
        
        insert Qat1;
        
    Qat1.Attendee_Barcode3__c = Qat1.id;
    
    upsert Qat1;
    

        
        
            QR_BoothAdmin__c QBA = new  QR_BoothAdmin__c();
            
            QBA.BoothAdmin_FirstName__c = 'venkateshad';
            
            QBA.BoothAdmin_LastName__c = 'Puppala';
          
            QBA.BoothAdmin_EmailId__c ='venkatesh101@globalnest.com';
            
            QBA.BoothAdmin_Organization_Name__c = 'globalnest';
        
            QBA.BoothAdmin_IsActive__c = true;
            
            QBA.Event_Id__c =Qeve.id;
    
         insert QBA;
    
        QR_BoothPersonnel__c QBPA = new QR_BoothPersonnel__c();
        
        
          QBPA.BoothAdmin_Id__c = QBA.id;
          
          QBPA.BoothPersonnel_FirstName__c ='Venkatesh';
          
          QBPA.BoothPersonnel_LastName__c ='Puppala';
          
          QBPA.BoothPersonnel_EmailId__c ='venkatesh@globalnest.com';
          
          QBPA.Random_Number__c ='1234';
          
            insert QBPA;
         
         QR_BoothPersonnel__c QBPA1=[select id,name from QR_BoothPersonnel__c where id=:QBPA.id];
         
          String QBPAId = QBPA1.name;
           
           String QBPAId1 = QBPAId.replace('QR_BP_','');
           
           
           
            
            QR_Attendee_BoothVisitSummary__c Qlead = new   QR_Attendee_BoothVisitSummary__c();
          
            
            Qlead.Attendee_FirstName__c = 'venkatesh';
            
            Qlead.Attendee_LastName__c = 'Puppala';

            Qlead.Attendee_Company__c ='GL';
             
            Qlead.Attendee_Designation__c = 'Software Developer';
            
            Qlead.Attendee_EmailId__c = 'venkatesh105@globalnest.com';
            
            Qlead.Attendee_PhoneNumber__c ='9989522656';
            
            Qlead.Attendee_BarCode1__c = Qat.Attendee_Barcode3__c;
            
            
            Qlead.Attendee_ScannedBy__c= QBPA1.id;
           
            insert Qlead;
            
            
            
            
            
      System.RestContext.request = new RestRequest();
        RestContext.request.requestURI = '/GlobalnestEM/Verify_Lead';
        RestContext.request.addParameter('Id',QBPA.Random_Number__c);
        RestContext.request.addParameter('Barcode',Qat1.Attendee_Barcode3__c);
        RestContext.request.addParameter('EventBrite', 'false');
      
        // Invoke the method directly
        Verify_Lead.doGet();
          
           
    
      System.RestContext.request = new RestRequest();
        RestContext.request.requestURI = '/GlobalnestEM/Verify_Lead';
        RestContext.request.addParameter('Id',Qlead.Attendee_ScannedBy__c);
        RestContext.request.addParameter('Barcode',Qlead.Attendee_BarCode1__c);
        RestContext.request.addParameter('EventBrite', 'false');
      
        // Invoke the method directly
        Verify_Lead.doGet();
    
    
    
    
    
    
        // set up the request object
        System.RestContext.request = new RestRequest();
        RestContext.request.requestURI = '/GlobalnestEM/Verify_Lead';
        RestContext.request.addParameter('Id', '');
        RestContext.request.addParameter('Barcode', 'QR_AT_0112_0060877');
        RestContext.request.addParameter('EventBrite', 'True');
      
        // Invoke the method directly
        Verify_Lead.doGet();
        
           System.RestContext.request = new RestRequest();
        RestContext.request.requestURI = '/GlobalnestEM/Verify_Lead';
        RestContext.request.addParameter('Id', '2412_0000001');
        RestContext.request.addParameter('Barcode', '');
        RestContext.request.addParameter('EventBrite', 'false');
      
        // Invoke the method directly
        Verify_Lead.doGet();
        
    }



}