public with sharing class QRCode_BoothadmineventsphMultiEventCon {

public PageReference boothqrcodeAction() {
      Pagereference pg = new pagereference('/apex/QRcode_Boothadmin_boothMultiEvent');
    pg.setredirect(true);
        return pg;
    }


   
public Pagereference checkUserId()
{
system.debug('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh'+UserInfo.getUserId());

if(UserInfo.getUserId() == '00590000000zKNlAAM' || UserInfo.getUserId()==null)
{
  system.debug('ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt'+UserInfo.getUserId());
Pagereference pg = new Pagereference('/apex/QRcode_BoothAdmin_signinMultiEvent');
Pg.setredirect(true);
return pg;


}else {
return null;
}


}

public PageReference Reportsaction() {
    Pagereference pg = new pagereference('/apex/QRcode_Boothadmin_ReportsphmultiEvent');
    pg.setredirect(true);
        return pg;
        
    }

   public PageReference profileaction() {
    Pagereference pg = new pagereference('/apex/QRcode_BoothAdmin_ProfileMultiEvent');
    pg.setredirect(true);
        return pg;
       
    }



    public PageReference AttendeesAction() {
    Pagereference pg = new pagereference('/apex/Boothadmin_Attendeesphmulti');
    pg.setredirect(true);
        return pg;
       
    }


    public PageReference Customeraction() {
    Pagereference pg = new pagereference('/apex/QRCode_Boothadmin_PersonnelsmultiEvent');
    pg.setredirect(true);
        return pg;
    }


    public PageReference EventAction() {
    Pagereference pg = new pagereference('/apex/QRCode_BoothadminEventsphmultiEvent');
    pg.setredirect(true);
        return pg;
        
    }

    
    public List<QR_Event__c > lstEvtDet{get;set;}
    
    public string eventName{get;set;}
    
    public List<QR_Event__c> returnList{get;set;}
    
    public QR_Event__c objBothAdmin{get;set;}
    public Boolean displayPopUp{get;set;}
    public Boolean displayPopUpForAdd{get;set;}
    public String selEventName{get;set;}
    public String strAdminId{get;set;}
    
    
    
    public Boolean helpPopUpBool{get; set;}
    public Boolean neverShowBool{get; set;}
    public USER uu{get; set;}
    
    
    
    public QRCode_BoothadmineventsphMultiEventCon()
    {
   
      
           uu = [SELECT ID,Name, Boothleads_help__c FROM USER WHERE ID =: UserInfo.getUserId() ];
           
           helpPopUpBool = uu.Boothleads_help__c;
    
    
     getEvents();
    
  
    
        
    }
    
    
    public String strLoginUserId{get;set;} 
    public void getEvents()
    {
        /*lstEvtDet = [Select g.SystemModstamp, g.OwnerId, g.Name, g.LastModifiedDate, 
                            g.LastModifiedById, g.LastActivityDate, g.IsDeleted, g.Id, 
                            g.Status__c, g.SendReminder__c, 
                            g.PrimaryContactPhone__c, g.PrimaryContactName__c, 
                            g.PrimaryContactEmail__c, g.NoFee__c, 
                            g.MinDonation__c, g.MaxFreeTickets__c, 
                            g.EventZip__c, g.EventType__c, 
                            g.EventState__c, g.EventStart__c, 
                            g.EventName__c, g.EventEnd__c, 
                            g.EventConfig__c, g.EventCity__c, 
                            g.EventAddr2__c, g.EventAddr1__c, 
                            g.Donations__c, g.Details__c, 
                            g.Description__c, g.DailyEvent__c, 
                            g.CreatedOn__c, g.AltContactPhone__c, 
                            g.AltContactName__c, g.AltContactEmail__c, 
                            g.CreatedDate, g.CreatedById From EM_Event__c g];*/
        
        
     
        
  strLoginUserId=UserInfo.getUserName();
      
     ListOfEvents = new List<QR_Event__c>();
    lstEvtDet = new List<QR_Event__c>();
   // strLoginUserId = 'phani+chimata8@globalnest.com';
       
        system.debug('hi phani Emailie:'+strLoginUserId);
        Set<String> eventIdSet=new Set<String>();
       for(QR_BoothAdmin__c obj :[Select g.SystemModstamp, g.OwnerId, g.Name, g.LastModifiedDate, 
                                                           g.LastModifiedById, g.LastActivityDate, g.IsDeleted, 
                                                           g.Id, g.Event_Id__c, g.BoothAdmin_Status__c, 
                                                           g.BoothAdmin_Organization_ZipCode__c, g.BoothAdmin_Organization_WebsiteURL__c, 
                                                           g.BoothAdmin_Organization_State__c, g.BoothAdmin_Organization_PhoneNumber__c, 
                                                           g.BoothAdmin_Organization_Name__c, g.BoothAdmin_Organization_Description__c, 
                                                           g.BoothAdmin_Organization_City__c, g.BoothAdmin_Organization_Address2__c, 
                                                           g.BoothAdmin_Organization_Address1__c, g.BoothAdmin_LastName__c, 
                                                           g.BoothAdmin_IsActive__c,g.Event_Id__r.Name,g.BoothAdmin_FirstName__c, 
                                                           g.BoothAdmin_EmailId__c, g.CreatedDate, g.CreatedById
                                                           From QR_BoothAdmin__c g WHERE g.BoothAdmin_EmailId__c =:strLoginUserId ]){
      
        eventIdSet.add(obj.Event_Id__r.Name);
        }
     
                            
        ListOfEvents = [Select g.SystemModstamp, g.OwnerId, g.Name, g.LastModifiedDate, g.LastModifiedById, 
                            g.LastActivityDate, g.IsDeleted, g.Id,g.Event_ZipCode__c,  
                            g.Event_WebsiteURL__c, g.Event_Title__c, 
                            g.Event_Status1__c, g.Start_Date__c,g.Start_Time__c,
                             g.End_Date__c,g.End_Time__c,
                            g.Event_Newsecondarycategory__c, g.Event_NewPrimaryCategory__c, 
                            g.Event_PhoneNumber__c, g.Event_POBox__c, 
                            g.Event_HostingTimeZone__c, g.Event_HostingNewState__c, 
                            g.Event_HostingOrganization__c, g.Event_HostingLocation__c, 
                            g.Event_HostingCity__c, g.Event_HostingAddress2__c, 
                            g.Event_HostingAddress1__c, g.Event_HostedByEventBrite__c, 
                            g.Event_EndDate__c,  g.CreatedDate,g.NewEvent_details__c,g.Event_FaxNumber__c, 
                            g.CreatedById,g.CreatedBy.Name,g.LastModifiedBy.Name From QR_Event__c g  where g.Name IN :eventIdSet ];
                           
              System.debug('lstEvtDet ***'+lstEvtDet);    
              
          
              for(QR_Event__c r: ListOfEvents ){
               
              r.Event_Title__c =escapeSpecialCharacters(r.Event_Title__c);
              r.Event_HostingNewState__c=escapeSpecialCharacters(r.Event_HostingNewState__c);
              r.Event_Status1__c=escapeSpecialCharacters(r.Event_Status1__c); 
               r.Event_HostingLocation__c=escapeSpecialCharacters(r.Event_HostingLocation__c); 
               
              system.debug('phani garu miru keka'+r.Event_Title__c);
              
              lstEvtDet.add(r);
              
              }
              
                 
                                                      
    
    }
    
    
   
      public String escapeSpecialCharacters(String input){
if(input!= null && input != '' && (input.contains('\\') )){
input = input.replace('\\','\\\\');

}
if(input!= null && input != '' && (input.contains('"') || input.contains('<'))){

if(input!= null && input != '' && (input.contains('"') )){
input = input.replace('"','\\\"');

}if(input!= null && input != '' && (input.contains('<') )){
input = input.replace('<','');
system.debug('llllllllllllllllllllll miru keka'+input);
}



}
return input;
    
    }
    
    
    
    
    public List<QR_Event__c> ListOfEvents{get;set;}
    
    public void closePopup() {        
        displayPopup = false;    
    } 
    
    public void getEventDetails()
    {
        system.debug('eventName::::'+eventName);
        returnList = new List<QR_Event__c>();
        if(eventName != null){
        returnList =[Select g.SystemModstamp, g.OwnerId, g.Name, g.LastModifiedDate, g.LastModifiedById, 
                            g.LastActivityDate, g.IsDeleted, g.Id,g.Event_ZipCode__c,  
                            g.Event_WebsiteURL__c, g.Event_Title__c, 
                            g.Event_Status1__c, g.Start_Date__c,g.Start_Time__c,
                             g.End_Date__c,g.End_Time__c,
                            g.Event_Newsecondarycategory__c, g.Event_NewPrimaryCategory__c, 
                            g.Event_PhoneNumber__c, g.Event_POBox__c, 
                            g.Event_HostingTimeZone__c, g.Event_HostingNewState__c, 
                            g.Event_HostingOrganization__c, g.Event_HostingLocation__c, 
                            g.Event_HostingCity__c, g.Event_HostingAddress2__c, 
                            g.Event_HostingAddress1__c, g.Event_HostedByEventBrite__c, 
                            g.Event_EndDate__c,  g.CreatedDate,g.NewEvent_details__c,g.Event_FaxNumber__c, 
                            g.CreatedById,g.CreatedBy.Name,g.LastModifiedBy.Name From QR_Event__c g  where g.id=:eventName ];
        
         displayPopUp= true;
        }
      /**  
        for(QR_Event__c emEvent :lstEvtDet)
        {
            if(eventName!= null && eventName !='' && eventName.equals(emEvent.Id))
            {
                displayPopUp= true;
                returnList.add(emEvent);
                break;
            }
            
        }**/
        
        //return null;
    }
    
    public Pagereference gotoAttendees()
    {
        system.debug('eventName::::'+eventName);
        Pagereference pageRef= new PageReference('/apex/Boothadmin_Attendeesphmulti');
        pageRef.getParameters().put('EventID', eventName);            
        pageRef.setredirect(true);

        return pageRef;
    }
    
    public void closePopup1() {        
        displayPopUpForAdd = false;    
    }
    
    public void savePopupValues()
        {
                displayPopUpForAdd=false;
                
                if(objBothAdmin != null)
                {

                        objBothAdmin.Eventadmin_Id__c=selEventName;
                         objBothAdmin.Event_status__c = 'Active';
                        System.debug('@@@@BoothAdmin'+objBothAdmin);
                        upsert objBothAdmin;
                    System.debug('@@@@BoothAdmin'+displayPopUpForAdd);
                        //getBoothAdminDetails();
                        getEvents();
                }
                
                system.debug(objBothAdmin);
                
        }
       
       // ---------------------- Booth Tour Help
        public void dontShow(){
  
          if(neverShowBool){
             
             uu.Boothleads_help__c = FALSE;
             
             Database.SaveResult ds = Database.Update(uu, false);
              
          }
          
          helpPopUpBool = FALSE;
          
  
      }
       
       
       
       
    //---------------Help-------------------
    Public Boolean HelpPopUp{get;set;}
    Public void Help(){
    HelpPopUp = True;
    }
    Public Void CloseHelppopup(){
    HelpPopUp = false;
    }    
        
   
   static testMethod void myUnitTest() {
      
contact m = new contact(firstname='testcontactname',lastname='testcontactlastname');
     insert m;
     Profile w = [select id from profile where name='standard user'];
    
     User u = new User(alias = 'test123', email='test123@noemail.com',
     emailencodingkey='UTF-8',profileid = w.Id,lastname='Testing', languagelocalekey='en_US',
     localesidkey='en_US',country='United States',
     timezonesidkey='America/Los_Angeles', username='test123@noemail.com');
     insert u;
     
      QR_Event__c x = new QR_Event__c(Event_Title__c='testEvent',Event_HostingTimeZone__c='Eastern Time(USA)',Start_Date__c =date.parse('05/22/2012'),End_Date__c=date.parse('05/29/2012'));
     insert x;
     
       QR_Event__c x1 = new QR_Event__c(Event_Title__c='testEvent',Event_HostingTimeZone__c='Eastern Time(USA)',Start_Date__c =date.parse('05/22/2012'),End_Date__c=date.parse('05/29/2012'));
       insert x1;
     
      QR_BoothAdmin__c t1 = new QR_BoothAdmin__c(BoothAdmin_FirstName__c='testboothadminfirstname',BoothAdmin_Organization_Name__c='testboothadminorganiname',BoothAdmin_LastName__c='testboothlastmname',BoothAdmin_EmailId__c='test1234@noemail.com',Event_Id__c=x1.id);
     insert t1;
     
     QR_BoothAdmin__c t = new QR_BoothAdmin__c(BoothAdmin_FirstName__c='testboothadminfirstname',BoothAdmin_Organization_Name__c='testboothadminorganiname',BoothAdmin_LastName__c='testboothlastmname',BoothAdmin_EmailId__c='test123@noemail.com',Event_Id__c=x.id);
     insert t;
     List<QR_Event__c> ttt = new  List<QR_Event__c>();
     ttt.add(x);
      List<QR_Event__c> ttt1 = new  List<QR_Event__c>();
      ttt1.add(x1);
      system.runas(u){
      
         QRCode_BoothadmineventsphMultiEventCon ww= new QRCode_BoothadmineventsphMultiEventCon();
     ww.Reportsaction();ww.profileaction();ww.AttendeesAction();ww.Customeraction();ww.EventAction(); 
     ww.strLoginUserId ='test123@noemail.com';
     
     ww.getEvents();
  
    ww.boothqrcodeAction();
     ww.closePopup();
     ww.lstEvtDet=ttt; 
     ww.getEventDetails();
     ww.gotoAttendees();
     ww.closePopup1();
     ww.objBothAdmin =x;
     ww.savePopupValues();
     ww.eventName=x.id;
     ww.eventName=x1.id;
     ww.lstEvtDet=ttt1;
     ww.escapeSpecialCharacters('phani"kumar<ch');
     ww.Help();
     ww.CloseHelppopup();
     }
     
     user uu =[select id from user where id='00590000000zKNlAAM'];
     system.runas(uu){
     QRCode_BoothadmineventsphMultiEventCon  gg= new QRCode_BoothadmineventsphMultiEventCon ();
     gg.checkUserId();
     }
     
}
   
   
   

}