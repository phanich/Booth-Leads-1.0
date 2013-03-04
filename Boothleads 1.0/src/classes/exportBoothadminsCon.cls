public with sharing class exportBoothadminsCon {

    public boolean eportBool { get; set; }

    public PageReference exportBoothadmins() {
    
     PageReference pageRef= new PageReference('/apex/exportBoothadminsExcel');
            pageRef.setredirect(false);
            return pageRef;
 
    }


    public String selectedEvent { get; set; }
 
  public  List<QR_BoothAdmin__c> boothAdmin{get;set;}
  public List<QR_Event__c> allEvents{get;set;}
  public List<selectOption> options{get;set;}
  
  public PageReference getAllEvents(){
  allEvents = new List<QR_Event__c>();
  options = new List<selectOption>();
  allEvents =[select id,Event_Title__c from QR_Event__c];
   options.add(new selectOption('Select','Select'));
  for(QR_Event__c e:allEvents){
  options.add(new selectOption(e.id,e.Event_Title__c ));
  
  }
  return null;
  
  
  } 
   
   public exportBoothadminsCon(){
   
   getAllEvents();
   }
   
    public PageReference Export() {
    eportBool  = true;
    boothAdmin = new List<QR_BoothAdmin__c>(); 
    boothAdmin =[select BoothAdmin_FirstName__c,BoothAdmin_LastName__c,BoothAdmin_EmailId__c,BoothAdmin_Organization_Name__c from QR_BoothAdmin__c where Event_Id__c=:selectedEvent];
    for(QR_BoothAdmin__c b:boothAdmin){
    b.BoothAdmin_FirstName__c =escape(b.BoothAdmin_FirstName__c);
    b.BoothAdmin_LastName__c =escape(b.BoothAdmin_LastName__c );
    b.BoothAdmin_EmailId__c =escape(b.BoothAdmin_EmailId__c );
    b.BoothAdmin_Organization_Name__c = escape(b.BoothAdmin_Organization_Name__c);
    }
    
    return null;
    }
     public string escape(string s){
     if(s != null && s.contains(',')){
      s=s.replaceAll('"','');
       s='"'+s+'"';
       } 
            
       return s;
      }
    
    
    static testMethod void myUnitTest() {
   contact m = new contact(firstname='testcontactname',lastname='testcontactlastname');
           insert m;
       Profile w = [select id from profile where name='Standard User'];
 
        User u = new User(alias = 'test123', email='test123@noemail.com',
                 emailencodingkey='UTF-8',profileid = w.Id,lastname='Testing', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',
                  timezonesidkey='America/Los_Angeles', username='test123@noemail.com');
                  insert u;
   
    
     QR_Event__c x = new QR_Event__c(Event_Title__c='testEvent',Event_HostingTimeZone__c='Eastern Time(USA)',Start_Date__c =date.parse('05/22/2012'),End_Date__c=date.parse('05/29/2012'));
     insert x;
    
    QR_Event__c hg = [select id from QR_Event__c where Event_Title__c='testEvent']; 
     
     QR_BoothAdmin__c t = new QR_BoothAdmin__c(BoothAdmin_FirstName__c='testboothadminfirstname',BoothAdmin_Organization_Name__c='testboothadminorganiname',BoothAdmin_LastName__c='testboothlastmname',BoothAdmin_EmailId__c='test123@noemail.com',Event_Id__c=x.id);
     insert t; 
     
     System.runAs(u) {
     
     exportBoothadminsCon controller = new exportBoothadminsCon();
     controller.selectedEvent =x.id;
     controller.Export();
      controller.exportBoothadmins();
     
     }
     
     
     
     
    }
    
    
    
       
    
}