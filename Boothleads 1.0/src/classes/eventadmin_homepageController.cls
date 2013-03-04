public class eventadmin_homepageController {
//------------------- Declaring The Variables --------------------

Public Boolean Eventbookpopup{get; set;}
Public Boolean Eventeditpopup{get; set;}
Public Boolean displayEventInfoPopup{get;set;}
Public Boolean InvisibleButton {get;set;}
public Boolean onclickback {get;set;}
public string eventName{get;set;}
Public QR_Event__c event{get; set;}
Public List<QR_Event__c> Eventlist{get;set;}
Public List<QR_Event__c> Eventlist1{get;set;}
public List<QR_Event__c> returnList{get;set;}
Public QR_EventAdmin__c Eventadm{get; set;}
Public Id EventadminId{get;set;}
Public Id UserId{get;set;}
public Transient BLOB UpdateEventLogo{get; set;}
Public Transient Attachment Updateattach{get;set;}
Public Transient Blob EventLogo{get;set;}
public Transient Attachment attach{get;set;}
public Attachment editEventLogo{get; set;}
Public String Selected{get;set;}
public List<selectoption> Options1{get;set;}
Public List<Selectoption> options{get;set;}
Public List<selectoption> options2{get;set;}
Public String SelectedState{get;set;} 
Public Integer EventCount{get;set;}
Public String Phone{get;set;}
Public String FaxNum{get;set;}

public Boolean helpPopUpBool{get; set;}
public Boolean neverShowBool{get; set;}
public USER uu{get; set;}
//----------------------------------- End Of Declaration --------------
Public Boolean HelpPopUp{get;set;}
    Public void Help(){
    HelpPopUp = True;
    }
    Public Void CloseHelppopup(){
    HelpPopUp = false;
    }
//----------------------------------- Check UserId -----------------------

    public Pagereference checkUserId()
   {
   
       System.debug('RRRRRRRRRRRRRRRRRRRRRRRRRRRRRR'+UserInfo.getUserId());
      
    if(UserInfo.getUserId() == '00590000000zKNlAAM' || UserInfo.getUserId()==null)
    {
                              
       Pagereference pg = new Pagereference('/apex/QRcode_EventAdmin_signin?id=QRCode_Eventadmin_Homepage');
             Pg.setredirect(true);
             return pg;

       
    }else {
             return null;
        }
   
   }



 
//----------------------------------- EventBrite Event Page navigation --------------



   public Pagereference getEventbriteEvent(){
   
   
   pagereference pf = new pagereference('/apex/qr_eventbriteapi');
   
   
   pf.setredirect(true);
   
   
   return pf;
   
   
   
   
   }






//----------------------------------- Methods For Selectlist(States And EventBrite) -----------










    public List<selectOption> getStates(){
      
    options = new List<SelectOption>();
    options.add(new SelectOption('NONE','None'));
    options.add(new SelectOption('AL','Alabama'));
    options.add(new SelectOption('AZ','Arizona'));
    options.add(new SelectOption('AR','Arkansas'));
    options.add(new SelectOption('CA','California'));
    options.add(new SelectOption('CO','Colorado'));
    options.add(new SelectOption('CT','Connecticut'));
    options.add(new SelectOption('DE','Delaware'));
    options.add(new SelectOption('DC','District of Columbia'));
    options.add(new SelectOption('FL','Florida'));
    options.add(new SelectOption('GA','Georgia'));
    options.add(new SelectOption('HI','Hawaii'));
    options.add(new SelectOption('ID','Idaho'));
    options.add(new SelectOption('IL','Illinois'));
    options.add(new SelectOption('IN','Indiana'));
    options.add(new SelectOption('IA','Iowa'));
    options.add(new SelectOption('KS','Kansas'));
    options.add(new SelectOption('KY','Kentucky'));
    options.add(new SelectOption('LA','Louisiana'));
    options.add(new SelectOption('ME','Maine'));
    options.add(new SelectOption('MD','Maryland'));
    options.add(new SelectOption('MA','Massachusetts'));
    options.add(new SelectOption('MI','Michigan'));
    options.add(new SelectOption('MN','Minnesota'));
    options.add(new SelectOption('MS','Mississippi'));
    options.add(new SelectOption('MO','Missouri'));
    options.add(new SelectOption('MT','Montana'));
    options.add(new SelectOption('NE','Nebraska'));
    options.add(new SelectOption('NV','Nevada'));
    options.add(new SelectOption('NH','New Hampshire'));
    options.add(new SelectOption('NJ','New Jersey'));
    options.add(new SelectOption('NM','New Mexico'));
    options.add(new SelectOption('NY','New York'));
    options.add(new SelectOption('NC','North Carolina'));
    options.add(new SelectOption('ND','North Dakota'));
    options.add(new SelectOption('OH','Ohio'));
    options.add(new SelectOption('OK','Oklahoma'));
    options.add(new SelectOption('OR','Oregon'));
    options.add(new SelectOption('PA','Pennsylvania'));
    options.add(new SelectOption('RI','Rhode Island'));
    options.add(new SelectOption('SC','South Carolina'));
    options.add(new SelectOption('SD','South Dakota'));
    options.add(new SelectOption('TN','Tennessee'));
    options.add(new SelectOption('TX','Texas'));
    options.add(new SelectOption('UT','Utah'));
    options.add(new SelectOption('VT','Vermont'));
    options.add(new SelectOption('VA','Virginia'));
    options.add(new SelectOption('WA','Washington'));
    options.add(new SelectOption('WV','West Virginia'));
    options.add(new SelectOption('WI','Wisconsin'));
    options.add(new SelectOption('WY','Wyoming'));
    return options;
}

          public List<selectoption> getselect() { 
          List<selectoption> Option = new List<selectoption>();
          Option.add(new selectoption('Yes','Yes'));
          Option.add(new selectoption('No','No'));
          return option;
      }



//----------------------------------- *********** END *********** -----------------------------
//------------------------- PopUp Cancel Functionalities(We'll come Across Three)---------------

    
        public Pagereference Cancel() {
        Pagereference pg = new pagereference('/apex/Qrcode_Eventadmin_homepage');
        pg.setredirect(true);
        return Pg;
   }        
    
        public Pagereference Cancel1() { 
        //EventEditpopup = False;
        Pagereference pg = new pagereference('/apex/Qrcode_Eventadmin_homepage');
        pg.setredirect(true);
        return Pg;       
   }

    public void cancel2() {
    displayeventinfopopup = false;   
   }
   
   public void onclickback(){
       eventbookpopup = False;
       EventEditPopUp= TRUE;
}  

//-------------------------------------********** End**********-----------------------
//--------------------------------- ADD Event Button ---------------------------------
       public void Addevent() {
       Eventbookpopup = True;
       Event = new QR_Event__c(); 
      } 
//---------------------------------- ***** END OF Adding -----------------------------
//---------------------------------- Constructor--------------------------------------
      Public eventadmin_homepageController ()
       
      {
      
          try{
         
         
                 InvisibleButton = True;
                   
                 eventbookpopup = False;
                
                 EventEditpopup = False;
                 
                userId =UserInfo.getUserId();
                  
                 //UserId = '005O0000000eqY2';       
 
         //005A0000002kbcZ Eventadm = [select id,EventHostingOrganization_Id__r.Event_HostingOrganizationName__c,EventHostingOrganization_Id__r.Event_HostingOrganization_Address1__c,EventHostingOrganization_Id__r.Event_HostingOrganization_Address2__c from QR_EventAdmin__c where User_ID__c =: UserId];
        
         //Eventlist = [Select Event_Title__c,Event_status__c,Eventadmin_Id__r.EventHostingOrganization_Id__r.Event_HostingOrganization_city__c ,Event_HostingOrganization__c,Event_PhoneNumber__c,Event_HostingLocation__c,Event_HostingTimeZone__c from QR_Event__c where EventAdmin_id__r.User_ID__c =: Userid];
         
           uu = [SELECT ID,Name, Boothleads_help__c FROM USER WHERE ID =: UserInfo.getUserId() ];
           
           helpPopUpBool = uu.Boothleads_help__c;
           
           
           
    
    
                Integer  EventCount = [select count() from QR_Event__c where EventAdmin_id__r.User_ID__c =: Userid];
                 
                System.debug('^^^^^^^^^^^^^^^^^'+EventCount );
                
                if(EventCount >= 1)
                 {
                  InvisibleButton = False;
                 }
                }Catch(Exception e){}  
        
                options2 = new List<selectoption>();
                Options2.add(new SelectOption('None','--None--')); 
                options2.add(new SelectOption('Eastern Time(USA)','Eastern Time(USA)'));
                options2.add(new SelectOption('Central Time(USA)','Central Time(USA)'));
                options2.add(new SelectOption('Mountain Time(USA)','Mountain Time(USA)'));
                options2.add(new SelectOption('Pacific Time(USA)','Pacific Time(USA)'));
        
        system.debug('--------------'+eventName);
        
        getEvents();//Method for Calling List in the EXTJS
        //EditEvent();
      
       
   }
//------------------------------------- End Of Constructor ---------------------------------
//-------------------------------------Method which Use List Of Event for Extjs Grid-----------------------
    public void getEvents(){
       
         try{                       
         Eventadm = [select id,EventHostingOrganization_Id__r.Event_HostingOrganizationName__c,EventHostingOrganization_Id__r.Event_HostingOrganization_Address1__c,EventHostingOrganization_Id__r.Event_HostingOrganization_Address2__c from QR_EventAdmin__c where User_ID__c =: UserId];
        }catch(Exception e){}   
       
         Eventlist = [Select   id,Event_HostedByEventBrite__c,Event_POBox__c,Event_WebsiteURL__c,Event_ZipCode__c,Event_startdate__c,Event_HostingNewState__c ,
         Event_HostingCity__c,End_Time__c,Event_Status1__c ,Event_FaxNumber__c,
         NewEvent_details__c,End_date__c,start_Time__c,start_date__c,Event_HostingState__c,
         Event_Title__c,Event_status__c,Eventadmin_Id__r.EventHostingOrganization_Id__r.Event_HostingOrganization_city__c ,
         Event_HostingOrganization__c,Event_PhoneNumber__c,Event_HostingLocation__c,Event_HostingTimeZone__c,Event_NewPrimaryCategory__c, 
         Event_NewSecondaryCategory__c,Event_HostingAddress2__c,Event_HostingAddress1__c 
         from QR_Event__c where EventAdmin_id__r.User_ID__c =: Userid]; 
         for(QR_Event__c s:Eventlist)
          {      
  
      s.Event_Title__c = escapeSpecialCharacters(s.Event_Title__c);
      s.Event_status__c = escapeSpecialCharacters(s.Event_status__c);
      s.Event_HostingLocation__c = escapeSpecialCharacters(s.Event_HostingLocation__c);
      s.Event_HostingOrganization__c = escapeSpecialCharacters(s.Event_HostingOrganization__c);
      
          }   
         Eventlist1 = [Select   id,Event_HostedByEventBrite__c,Event_POBox__c,Event_WebsiteURL__c,Event_ZipCode__c,Event_startdate__c,Event_HostingNewState__c ,
         Event_HostingCity__c,End_Time__c,Event_Status1__c ,Event_FaxNumber__c,
         NewEvent_details__c,End_date__c,start_Time__c,start_date__c,Event_HostingState__c,
         Event_Title__c,Event_status__c,Eventadmin_Id__r.EventHostingOrganization_Id__r.Event_HostingOrganization_city__c ,
         Event_HostingOrganization__c,Event_PhoneNumber__c,Event_HostingLocation__c,Event_HostingTimeZone__c,Event_NewPrimaryCategory__c, 
         Event_NewSecondaryCategory__c,Event_HostingAddress2__c,Event_HostingAddress1__c 
         from QR_Event__c where EventAdmin_id__r.User_ID__c =: Userid];
     }

//--------------------------------------- ********* END******* ----------------------------------------------
//--------------------------------------- Method For Editing The Events -------------------------------------
public void EditEvent()
    {
        system.debug('eventName::::'+eventName);
        
        Event = new QR_Event__c ();
        
        for(QR_Event__c emEvent1 :EventList1)
        {
            if(eventName!= null && eventName !='' && eventName.equals(emEvent1.Id))
            {
                
                system.debug('-------+++++++++++-----------'+emEvent1.Id);
                EventEditPopUp= TRUE;
                Event = emEvent1;
                break;
                
            }
          
        }
        
      EditEvent1();
     selectedstate = Event.Event_HostingNewState__c;
     attach = new Attachment();     
      try{   
         attach =[select parentid,name from attachment where parentid=: Event.id];
         editEventLogo = attach;
         System.debug('********** To Check Whether Attachment is Retrived********' +attach);
         
        }catch(exception e){}     
      
  }
    public void EditEvent1() {    
    
    if(Event.Event_HostedByEventBrite__c == True){
          Selected = 'Yes';
      }else{
          Selected = 'No';
      }
      
      /**attach = new Attachment();     
      try{   
         attach =[select parentid,name from attachment where parentid=: Event.id];
         
         System.debug('********** To Check Whether Attachment is Retrived********' +attach);
         
        }catch(exception e){}**/
  }
//----------------------------------------- ****** END OF Editing ****** ---------------------
//------------------------------------------ Method For Displaying Events --------------------
public void geteventdetails()
    {
        system.debug('eventName::::'+eventName);
        
        returnList = new List<QR_Event__c>();
        
        for(QR_Event__c emEvent :EventList1)
        {
            if(eventName!= null && eventName !='' && eventName.equals(emEvent.Id))
            {
                displayeventinfoPopUp= true;
                returnList.add(emEvent);
                break;
            }
            
        }
        
        //return null;
    }
//--------------------------------------- ******* END *********-----------------------------------------------
//--------------------------------------- Method For Creating an Event ---------------------------------------

public Pagereference createEvent() {
       
        System.debug('--------Method Is firing---------');
        
        Event.Event_HostingOrganization__c = Eventadm.EventHostingOrganization_Id__r.Event_HostingOrganizationName__c ; 
        Event.Event_Title__c = Event.Event_Title__c;
        Event.Event_HostingTimeZone__c = Event.Event_HostingTimeZone__c ;
        if(Event.Start_Date__c > System.Today()){
            Event.Start_Date__c = Event.Start_Date__c;
        }else{
             ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Start Date Must be Greater Than Current Date'));       
             return null;
           }
        if(Event.End_Date__c > System.Today()){    
        Event.End_Date__c = Event.End_Date__c;
        }else{
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'End Date Must be Greater Than Current Date'));       
            return null;
         }
        Event.Start_Time__c = Event.Start_Time__c; 
        Event.End_Time__c = Event.End_Time__c;
        Event.Event_PhoneNumber__c = Phone;
        Event.Event_FaxNumber__c = FaxNum;
        Event.Event_WebsiteURL__c = Event.Event_WebsiteURL__c;
        Event.Event_NewPrimaryCategory__c = Event.Event_NewPrimaryCategory__c;
        Event.Event_NewSecondaryCategory__c = Event.Event_NewSecondaryCategory__c ;
        Event.Event_Status1__c = Event.Event_Status1__c;
        Event.Event_HostingAddress1__c = Event.Event_HostingAddress1__c;
        Event.Event_HostingAddress2__c = Event.Event_HostingAddress2__c;
        Event.Event_HostingLocation__c = Event.Event_HostingLocation__c;
        Event.Event_HostingCity__c = Event.Event_HostingCity__c;
        if(selectedstate!= 'None')
        Event.Event_HostingNewState__c = selectedstate;
        Event.Event_ZipCode__c = Event.Event_ZipCode__c;
        Event.Event_POBox__c = Event.Event_POBox__c;
        Event.NewEvent_Details__c = Event.NewEvent_Details__c;
        Event.Eventadmin_Id__c = Eventadm.id;
        //Event.Eventadmin_Id__c ='a1kA00000005Gf5';
            if(Selected == 'Yes'){
                Event.Event_HostedByEventBrite__c = True;
            }
            if(EventLogo == null){            
                insert event;//Creating an event
                System.debug('--------Event Created Without Attachment---------'+Event);                
            }else if(EventLogo.size() < 102400 ){
            
                insert event;
                System.debug('--------Event Should be Created With Attachment---------'+Event);        
                Id parentId = Event.id;
                attach = new Attachment();
                attach.Name= 'Event Logos';
                attach.parentId = ParentId;
                attach.Body = EventLogo;
                Insert Attach;//Attachment is Inserted
                System.debug('--------EventLogo is Saved in Attachment---------'+Attach);
              }else{
                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Please make sure the  file is not more than 100 kb'));       
                return null;
             }
             
            String named='';
            String ObjectName = 'QR_AttendeeSummary__c'; // Object Name Goes Here
            Map<String, Schema.SObjectField> ObjectFieldMap = Schema.getGlobalDescribe().get(ObjectName).getDescribe().fields.getMap();
            
            for (Schema.SObjectField SObjectF : ObjectFieldMap.values())
            {
               Schema.DescribeFieldResult field = SObjectF.getDescribe();
               named +=field.getLocalname()+',';
            }
             
            QRCode_Attendee_Settings__c attset = new QRCode_Attendee_Settings__c();
            
            attset.QRCode_Selected_Fields__c = named;
            attset.QR_Event__c = Event.id;  
             
            insert attset;

        Pagereference pg = new Pagereference('/apex/Qrcode_Eventadmin_homepage');
        Pg.setredirect(true);
        Return pg;  
  }
//----------------------------------------- ****** End Of Creating Event ******-------------------------------- 
//----------------------------------------- ****** Updating Event ******--------------------------------------- 
public PageReference Updateevent() {
   
    System.debug('------ Whether Attachment is Hitting Before Editing Event----------'+attach);
    
    Event.Event_Title__c= Event.Event_Title__c;//Event Title  
    Event.Event_PhoneNumber__c = Event.Event_PhoneNumber__c;//Phone Number
    Event.Event_FaxNumber__c = Event.Event_FaxNumber__c;//Fax Number
    Event.Event_WebsiteURL__c = Event.Event_WebsiteURL__c;//Website 
    Event.Event_ZipCode__c = Event.Event_ZipCode__c;//Zip Code
    Event.Event_POBox__c = Event.Event_POBox__c;//PO Box
    Event.Event_newPrimaryCategory__c = Event.Event_NewPrimaryCategory__c;//Primary Category
    Event.Event_NewSecondaryCategory__c = Event.Event_NewSecondaryCategory__c;//Secondary Category 
    if(selectedstate != 'NONE'){
    Event.Event_HostingNewState__c = selectedstate;//States
    }else {
     Event.Event_HostingNewState__c = '';  
    }
    Event.Event_Hostingcity__c = Event.Event_Hostingcity__c;//City
    Event.NewEvent_details__c = Event.NewEvent_details__c;//event Details
    Event.Event_HostingAddress1__c = Event.Event_HostingAddress1__c;//Address 1
    Event.Event_HostingAddress2__c = Event.Event_HostingAddress2__c;//Address 2
    //if(Event.Start_Date__c > System.Today()){
       Event.Start_Date__c = Event.Start_Date__c;//Event start Date
        //System.debug('------ Lets Check start Date----------'+Event.Start_Date__c);
       //}else{
       //  ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Start Date Must be Greater Than Current Date'));       
       //  return null;
      // }
    //if(Event.End_Date__c > System.Today()){
        if(Event.End_Date__c >= Event.Start_Date__c){    
        Event.End_Date__c = Event.End_Date__c;//Event End Date
        System.debug('------ Lets Check End Date----------'+Event.End_Date__c);
    }else{
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'End Date Must be Greater Than Start Date'));       
        return null;
     }
    Event.Start_Time__c = Event.Start_Time__c;//Event start time  
    Event.End_Time__c = Event.End_Time__c;//Event End time  
    Event.Event_HostingLocation__c = Event.Event_HostingLocation__c;//Location
    Event.Event_HostingTimeZone__c = Event.Event_HostingTimeZone__c;//Time Zone
    Event.Event_Status1__c = Event.Event_Status1__c;//Event status
        if(Selected == 'Yes'){
            Event.Event_HostedByEventBrite__c = True;
        }else{
            Event.Event_HostedByEventBrite__c = false;
        } 
    Update event;    
    System.debug('------ Updating The Event Information----------'+event);
    try{
        if(UpdateEventLogo.size()!= null){
        try{
            
            attach =[select parentid,name from attachment where parentid=: Event.id];
            
            System.debug('------ Whether Attachment is Hitting or Not----------'+attach);
            
           // Delete attach;
            
            System.debug('------ Whether Attachment is Deleted or Not----------');
            
            Updateattach = new Attachment();
            Updateattach.Name= 'Event Logos';
            Updateattach.parentId = Event.id;
            Updateattach.Body = UpdateEventLogo;
            
            if(UpdateEventLogo.size() < 102400){
            
            delete editEventLogo;//Deleting the Previous Logo
            Insert Updateattach;//Updating the attachment
            System.debug('------ Whether Attachment is Deleted and Updated ----------'+Updateattach);
         }else{
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Please make sure the file is not more than 100 kb'));       
            return null;
          } 
            
            
     }catch(Exception e){ 
     
            Updateattach = new Attachment();
            Updateattach.Name= 'Event Logos';
            Updateattach.parentId = Event.id;
            Updateattach.Body = UpdateEventLogo; 
            
            if(UpdateEventLogo.size() < 102400){
            
             Insert Updateattach ;
             
            System.debug('------ Whether Attachment is Updated ----------'+Updateattach);
             
        }else{
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Please make sure the file is not more than 100 kb'));       
            return null;
       }
     }       
    }
  }catch(Exception Ex){}
       Pagereference pg = new Pagereference('/apex/Qrcode_Eventadmin_homepage');
       Pg.setredirect(true);
       Return pg;
}

//-----------------------------------------******* End******* ------------------------------------------------- 
//---------------------------------- TAB NAVIGATION --------------------------------

    Public PageReference ProfileSettings() {
    Pagereference pg = new Pagereference('/apex/Qrcode_EventAdmin_Profileupdate');
    Pg.setredirect(true);
    Return pg; 
     } 

   public PageReference Dashboardaction() {
     
     pagereference pg = new pagereference('/apex/QRDashboard');
     pg.setRedirect(true);
     return pg;
   
    }


    public PageReference Reportsaction() {
    Pagereference pg = new Pagereference('/apex/QRCode_EventReport');
    pg.setRedirect(true);
    return pg;       
    }


    public PageReference AttendeesAction() {
    Pagereference pg = new pagereference('/apex/Qr_Booth_attendees');
    pg.setredirect(true);
        return pg;
        
    }


    public PageReference Customeraction() {
    Pagereference pg = new Pagereference('/apex/QRCode_Eventadmin_Boothadmin');
    pg.setredirect(true);
        return Pg;
    }


    public PageReference EventAction() {
    Pagereference pg = new pagereference('/apex/Qrcode_Eventadmin_homepage');
    pg.setredirect(true);
        return pg;
        
    }
//-------------------------------------------- END ----------------------------------------     
//--------------------------------------For avoiding Double quotes -------------------------------------     
     public String escapeSpecialCharacters(String input){
      
   if(input!= null && input != '' && (input.contains('<') )){
        input = input.replace('<','');
         system.debug('llllllllllllllllllllll'+input);
        }
       if(input!= null && input != '' && (input.contains('\\') )){
        input = input.replace('\\','\\\\');
 
      } 
      if(input!= null && input != '' && (input.contains('"') )){
           input = input.replace('"','\\\"');
      } 
      if(input!= null && input != '' && (input.contains(',') )){
        input = input.replace(',','//,');
      }
    return input;
    
  } 
  
  public void dontShow(){
  
  if(neverShowBool){
     
     uu.Boothleads_help__c = FALSE;
     
     Database.SaveResult ds = Database.Update(uu, false);
      
  }
  
  helpPopUpBool = FALSE;
  
  
  }
  

  
  
//----------------------- *** Test class *** ----------------------
static testmethod void test_eventadmin_homepageController(){
    
    Profile p = [select id FROM profile where name='Standard User'];

    User u = new User(alias = 'test123', email='test123@noemail.com',
    emailencodingkey='UTF-8',profileid = p.Id, lastname='Testing', languagelocalekey='en_US',
    localesidkey='en_US',country='United States',
    timezonesidkey='America/Los_Angeles', username='test123@noemail.com');

    insert u;
    
    QR_EventOrganizationDetails__c HostingOrg = new QR_EventOrganizationDetails__c(    
    Event_HostingOrganizationName__c = 'Accenture'           
    );
    insert HostingOrg;

    QR_Eventadmin__c eventAdmin = new QR_Eventadmin__c(
    EventAdmin_FirstName__c='testEventadminfirstname',
    EventAdmin_LastName__c='testEventadminLastname',
    EventAdmin_EmailId__c=u.Email,
    User_ID__c=u.Id,
    EventHostingOrganization_Id__c = HostingOrg.id);
    
    insert eventAdmin;
    QR_Event__c event  = new QR_Event__c(Event_Title__c='testEvent',
    Event_HostingTimeZone__c='Eastern Time(USA)',
    End_Date__c=date.valueOf('2012-05-15 00:00:00'),
    Start_Date__c=date.valueOf('2012-05-11 00:00:00'),
    Eventadmin_Id__c=eventAdmin.id);

       
    insert event;
    
    
   
    
    

    eventadmin_homepageController testcon = new eventadmin_homepageController();
    
    testcon.Userid = u.id;
    testcon.eventname = event.id;
    testcon.getEventbriteEvent();
    testcon.getStates();
    testcon.getselect();
    testcon.Cancel();
    testcon.Cancel1();
    testcon.cancel2();
    testcon.onclickback();
    testcon.Addevent();
    testcon.getEvents();    
    testcon.EventCount = 1;
    testcon.InvisibleButton = false;
    testcon.EditEvent();
    testcon.geteventdetails();
    testcon.ProfileSettings();
    testcon.Dashboardaction();
    testcon.Reportsaction();
    testcon.AttendeesAction();
    testcon.Customeraction();
    testcon.EventAction();
    testcon.escapeSpecialCharacters(testcon.SelectedState);
    testcon.SelectedState = 'sh"ru<thi';
    testcon.Updateevent();    
    testcon.createEvent();
    event.Event_title__c = event.Event_title__c;
    Event.Start_Date__c = Event.Start_Date__c;
    testcon.Help();
    testcon.CloseHelppopup();
    testcon.checkUserId();
    
    
   
   

}
 
}