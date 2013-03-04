/***********************************************************************************************
*   Controller Name : BoothAdminController
*   Date            : 25/03/2012
*   Author          : 
*   Purpose         : This class covers all both admin information. 
*   Change History  :
*   Date                         Programmer      Reason
*   --------------------    -------------------    -------------------------
*   
**************************************************************************************************/

public class BoothAdminController1 {

    public PageReference Reportsaction() {
    pagereference pg = new pagereference('/apex/QRcode_Boothadmin_Reports');
    pg.setredirect(true);
        return pg;
        
    }


    public PageReference AttendeesAction() {
    pagereference pg = new pagereference('/apex/QRCode_Boothadmin_Attendees');
    pg.setredirect(true);
        return pg;
        
    }


    public PageReference Customeraction() {
    pagereference pg = new pagereference('/apex/QRCode_Boothadmin_Personnels');
    pg.setredirect(true);
        return pg;
    }


    public PageReference EventAction() {
    pagereference pg = new pagereference('/apex/QRCode_BoothadminEvents');
    pg.setredirect(true);
        return pg;
       
    }




    
    public string eventName{get;set;}
    public String selEventName{get;set;}
    public String strAdminId{get;set;}
    public QR_BoothAdmin__c objBothAdmin{get;set;}
    public QR_BoothPersonnel__c  objBothAdmin1{get;set;}
    //public List<QR_Event__c> returnList{get;set;}
    public String popupLabelName{get;set;}
    public List<QR_BoothPersonnel__c > bothAdminList1{get;set;}
    public List<QR_BoothAdmin__c > bothAdminList{get;set;}

    public List<QR_BoothPersonnel__c  > returnList1{get;set;}
   public List<QR_BoothAdmin__c> returnList{get;set;}
    public List<SelectOption> selEventNameList{get;set;}
    
    public Boolean displayPopUp{get;set;}
    public Boolean displayPopUpForAdd{get;set;}
    public Boolean displayPopUpForEdit{get;set;}
    String bothAdminId{get;set;}
    public BoothAdminController1 ()
    {
        getBoothAdminDetails();
    }
    
    public void getBoothAdminDetails()
    {
        
        String eventId=ApexPages.CurrentPage().getParameters().get('EventID');
          
        System.debug('***eveeventId'+eventId);   
            
        if((eventId =='' || eventId ==null))
        {
            eventId =selEventName;
        }else if(selEventName == null || selEventName== '')
        {
            selEventName=eventId ;
        }
        String loginUser=UserInfo.getUserName();
        Map<String,String> eventIdMap=new map<String,String>();
        for(QR_BoothAdmin__c obj :[Select g.id,g.Name,g.Event_Id__r.Name, g.Event_Id__r.Event_Title__c,  g.BoothAdmin_EmailId__c
                                                From QR_BoothAdmin__c g 
                                                WHERE g.BoothAdmin_EmailId__c =: loginUser]){
        eventIdMap.put(obj.Event_Id__r.Name,obj.Event_Id__r.Event_Title__c);
        
        if(strAdminId ==null||strAdminId==''){strAdminId=  obj.Name;}
        if(bothAdminId ==null ||bothAdminId ==''){bothAdminId = obj.id;}
        }
        
        system.debug('eventIdMap::'+eventIdMap);
        selEventNameList = new List<SelectOption>();    
        selEventNameList.add(new Selectoption('ALL','ALL'));
        
        if(eventIdMap != null && !eventIdMap.isEmpty())
        {
            for(String evenId:eventIdMap.keySet())
            {
                selEventNameList.add(new Selectoption(evenId,eventIdMap.get(evenId)));
            }
        }
        
        /*if(eventId != null && eventId !='' && !eventId.equals('ALL'))
        {
            system.debug('in else loop '+eventId);
            
            
             bothAdminList1 = [Select   g.BoohtPersonnel_Designation__c,g.BoothAdmin_Id__c,
                                g.BoothPersonnel_EmailId__c,g.BoothPersonnel_FirstName__c,
                                g.BoothPersonnel_LastName__c,g.Event_HostedByEventBrite__c,
                                g.Name 
                              From QR_BoothPersonnel__c g 
                              WHERE g.BoothAdmin_Id__r.Event_Id__c= :eventId    ];
                              
                              
                             System.debug('Booth Admin ****'+bothAdminList1);
                              // where g.Event_Id__c = :eventId 
                              //          and g.BoothAdmin_Status__c != 'InActive'];
            
            
        }else{*/
        
         bothAdminList1 = [Select   g.BoohtPersonnel_Designation__c,g.BoothAdmin_Id__c,
                            g.BoothPersonnel_EmailId__c,g.BoothPersonnel_FirstName__c,
                            g.BoothPersonnel_LastName__c,g.BoothAdmin_Id__r.Name,g.Event_HostedByEventBrite__c,
                            g.Name 
                          From QR_BoothPersonnel__c g where g.BoothAdmin_Id__r.Name= :strAdminId];
            
       // }
        
    }
    
    public void closePopup() {        
        displayPopup = false;    
    } 
    
    public void closePopup1() {        
        displayPopUpForAdd = false;    
    }
     
    public void getEventDetails()
    {
        /*
        returnList = new List<QR_BoothAdmin__c>();
        objBothAdmin=null;
        system.debug('eventName'+eventName);
        for(QR_BoothAdmin__c emEvent :bothAdminList)
        {
            if(eventName!= null && eventName !='' && eventName.equals(emEvent.id))
            {
                returnList.add(emEvent);
                displayPopUp= true;
                break;
            }
        }
        */
        
        returnList1 = new List<QR_BoothPersonnel__c>();
        objBothAdmin1=null;
        system.debug('eventName'+eventName);
        for(QR_BoothPersonnel__c emEvent :bothAdminList1)
        {
            if(eventName!= null && eventName !='' && eventName.equals(emEvent.id))
            {
                returnList1.add(emEvent);
                displayPopUp= true;
                break;
            }
        }
        
    }

    
    public Pagereference savePopupValues()
    {
        displayPopUpForAdd=false;
        
        System.debug('strAdminId***'+strAdminId+'objBothAdmin1***'+objBothAdmin1  );
        
        if(objBothAdmin1 != null)
        {
        system.debug('in saving personnel****');
            objBothAdmin1.BoothAdmin_Id__c=bothAdminId;
            upsert objBothAdmin1;
            getBoothAdminDetails();
        }
        
        system.debug(objBothAdmin);
        Pagereference pg = new Pagereference('/apex/QRCode_Boothadmin_Personnels');
        pg.setredirect(true);
        return pg;
    }
    
    public void addAttendees()
    {   
        system.debug('eventName=========:::' +eventName);
        popupLabelName ='';
        //objBothAdmin= new QR_BoothAdmin__c();
        objBothAdmin1= new QR_BoothPersonnel__c();
        popupLabelName ='Add Booth Person Details';
        displayPopUpForAdd =true;
    }
    
    public void deleteAdminRecord()
    {
        system.debug('eventName=========:::' +eventName);
        objBothAdmin1=[select id from  QR_BoothPersonnel__c where id=:eventName];
        
        System.debug('Deleteing booth personal'+objBothAdmin1);
        /**
        for(QR_BoothAdmin__c emEvent :bothAdminList)
        {
            if(eventName!= null && eventName !='' && eventName.equals(emEvent.Id))
            {
                emEvent.BoothAdmin_Status__c = 'InActive';
                objBothAdmin=emEvent;
                break;
            }
        }
        **/
        if(objBothAdmin1 != null)
        {
           // update objBothAdmin;
            
            delete  objBothAdmin1;
            getBoothAdminDetails();
        }
    }
    
    public void editAttendees()
    {   
        system.debug('eventName=========:::' +eventName);
        objBothAdmin= new QR_BoothAdmin__c();
        objBothAdmin1= new QR_BoothPersonnel__c();
        
      /*  for(QR_BoothAdmin__c emEvent :bothAdminList)
        {
            if(eventName!= null && eventName !='' && eventName.equals(emEvent.Id))
            {
                displayPopUpForAdd =true;
                objBothAdmin=emEvent;
                break;
            }
        }
        */
        
      for(QR_BoothPersonnel__c emEvent1 :bothAdminList1)
        {
            if(eventName!= null && eventName !='' && eventName.equals(emEvent1.id))
            {
                displayPopUpForAdd =true; 

                popupLabelName='';
                objBothAdmin1=emEvent1;
                popupLabelName ='Edit Booth Person Details';
                break;
            }
        }  
        
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
                  
       QR_Eventadmin__c  h = new QR_Eventadmin__c(
       EventAdmin_FirstName__c='testEvenfirstnametAdmin',EventAdmin_LastName__c='testEvenLastname',EventAdmin_EmailId__c=u.Email,User_ID__c=u.Id);    
        insert h;
     
     QR_Event__c x = new QR_Event__c(Event_Title__c='testEvent',Event_HostingTimeZone__c='Eastern Time(USA)',Eventadmin_Id__c=h.id,Start_Date__c=date.parse('04/06/2900'),End_Date__c=date.parse('04/06/2900'));
     insert x;
     
     QR_AttendeeSummary__c e = new QR_AttendeeSummary__c(Attendee_FirstName__c='testattendeesummaryfirstname',Attendee_LastName__c='testattendeelastname',Attendee_EmailId__c='test123@noemail.com',Attendee_Company__c='testattendeecompany');
     
            insert e;          
            system.debug('hiiiiii'+e);  
            
            QR_BoothAdmin__c t = new QR_BoothAdmin__c(BoothAdmin_FirstName__c='testboothadminfirstname',BoothAdmin_Organization_Name__c='testboothadminorganiname',BoothAdmin_LastName__c='testboothlastmname',BoothAdmin_EmailId__c='test123@noemail.com',Event_Id__c=x.id);
            insert t;
            
            
           QR_Report__c y = new QR_Report__c (QR_BoothAdmin__c=t.id,QR_Eventadmin__c=h.id); 
    insert y;
    
    account a = new account(name ='testName');
    insert a;
    
    QR_BoothPersonnel__c  q = new  QR_BoothPersonnel__c(BoothAdmin_Id__c=t.id,BoothPersonnel_FirstName__c='testboothpersonelfirstname',BoothPersonnel_LastName__c='testboothpersonellastname',BoothPersonnel_EmailId__c='test@gmail.com');
    
              pageReference p = Page.QRCode_Boothadmin_Personnels;
              Test.setCurrentPage (p);
              
              
              BoothAdminController1 o = new BoothAdminController1();
              o.eventName='t.id';
              o.Reportsaction();
              o.AttendeesAction();
              o.Customeraction();
              o.EventAction();
              o.getBoothAdminDetails();
              p.getParameters().put('EventID',t.id);
              o.closePopup();
              o.closePopup1();
              o.getEventDetails();
              o.savePopupValues();
              o.addAttendees();
            //  o.deleteAdminRecord();
              o.editAttendees();
              
              
              
              
              
              
    }


}