public class QRcode_BoothAdmin_Profileupdatecon {


 public PageReference boothqrcodeAction() {
      Pagereference pg = new pagereference('/apex/QRcode_Boothadmin_booth');
    pg.setredirect(true);
        return pg;
    }


 public Pagereference checkUserId(){
 system.debug('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh'+UserInfo.getUserId());
if(UserInfo.getUserId() == '00590000000zKNlAAM' || UserInfo.getUserId()==null)
{
 system.debug('tttttttttttttttttttttttt'+UserInfo.getUserId());
Pagereference pg = new Pagereference('/apex/QRcode_BoothAdmin_signin');
Pg.setredirect(true);
return pg;


}else{

 BoothAdmin =[select BoothAdmin_EmailId__c,BoothAdmin_Organization_POBox__c,BoothAdmin_FirstName__c,BoothAdmin_LastName__c,BoothAdmin_Organization_Address1__c,BoothAdmin_Organization_Address2__c,BoothAdmin_Organization_City__c,BoothAdmin_Organization_Description__c,BoothAdmin_Organization_Name__c,BoothAdmin_Organization_PhoneNumber__c,BoothAdmin_Organization_NewState__c,BoothAdmin_Organization_WebsiteURL__c,BoothAdmin_Organization_ZipCode__c  from QR_BoothAdmin__c where BoothAdmin_EmailId__c =:LoginUsername limit 1];
          
          if(BoothAdmin!=null){
           selectedState =BoothAdmin.BoothAdmin_Organization_NewState__c;
          }
          
          
          
          System.debug('---------------------'+BoothAdmin.BoothAdmin_EmailId__c);
          
          BoothUsers = [select Firstname,Lastname,Email from User where Email =:LoginUsername limit 1];
          system.debug('---------------------%%%%%%%'+BoothUsers);
       

return null;

}

}


  
    public PageReference Reportsaction() {
     Pagereference pg = new Pagereference('/apex/QRcode_Boothadmin_Reportsph');
            pg.setRedirect(true);
            return pg;
    }

public pagereference  Profileupdatepage(){
      
       pagereference pg = new pagereference('/apex/boothadminChangePasswordpage');
       pg.setredirect(true);
       return pg;
      }
   

    public PageReference AttendeesAction() {
      Pagereference pg = new Pagereference('/apex/Boothadmin_Attendeesph');
        Pg.setredirect(true);
        Return pg;
    }


    public PageReference Customeraction() {
       pagereference pg = new pagereference('/apex/QRCode_Boothadmin_Personnelsph');
       pg.setredirect(true);
       return pg;
    }


    public PageReference EventAction() {
        pagereference pg = new pagereference('/apex/QRCode_BoothadminEventsph');
       pg.setredirect(true);
       return pg;
    }
    
     public string LoginuserName=UserInfo.getUserName();
     //UserInfo.getUserName();
     
     
       Public QR_BoothAdmin__c BoothAdmin{get;set;}
       Public User BoothUsers{get;set;}
      
      
      public string selectedState{get;set;}
      
      public List<selectOption> getStates(){
      
     List<SelectOption> options = new List<SelectOption>();
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
      
      
      
      
       Public QRcode_BoothAdmin_Profileupdatecon()
       
       {
           checkUserId();     
         
         
        
           
      } 
      
      Public Pagereference Save()
      {
      
      system.debug('admin valuessssssssssssssssssssssssss'+BoothAdmin.BoothAdmin_FirstName__c);
       BoothAdmin.BoothAdmin_FirstName__c = BoothAdmin.BoothAdmin_FirstName__c;
       BoothAdmin.BoothAdmin_Lastname__c = BoothAdmin.BoothAdmin_LastName__c;
       BoothAdmin.BoothAdmin_Organization_Address1__c = BoothAdmin.BoothAdmin_Organization_Address1__c;
       BoothAdmin.BoothAdmin_Organization_Address2__c = BoothAdmin.BoothAdmin_Organization_Address2__c;
       BoothAdmin.BoothAdmin_Organization_City__c = BoothAdmin.BoothAdmin_Organization_City__c;
       BoothAdmin.BoothAdmin_Organization_Description__c = BoothAdmin.BoothAdmin_Organization_Description__c;
       BoothAdmin.BoothAdmin_Organization_Name__c = BoothAdmin.BoothAdmin_Organization_Name__c;
       BoothAdmin.BoothAdmin_Organization_NewState__c =selectedState;
      
       BoothAdmin.BoothAdmin_Organization_PhoneNumber__c = BoothAdmin.BoothAdmin_Organization_PhoneNumber__c;
       BoothAdmin.BoothAdmin_Organization_POBox__c = BoothAdmin.BoothAdmin_Organization_POBox__c;
       BoothAdmin.BoothAdmin_Organization_WebsiteURL__c = BoothAdmin.BoothAdmin_Organization_WebsiteURL__c;
       BoothAdmin.BoothAdmin_Organization_ZipCode__c = BoothAdmin.BoothAdmin_Organization_ZipCode__c;
       
       update BoothAdmin;//Updating BoothAdmin's Info
       
       system.debug('-------------------Update BoothAdmins Info-----------'+BoothAdmin);
       
        List<QR_BoothPersonnel__c> boothPersonnel = new List<QR_BoothPersonnel__c>();
       
        boothPersonnel=[select BoothPersonnel_FirstName__c,BoothPersonnel_LastName__c from QR_BoothPersonnel__c where BoothPersonnel_EmailId__c=:BoothAdmin.BoothAdmin_EmailId__c]; 
        if(!boothPersonnel.isEmpty()){
        boothPersonnel[0].BoothPersonnel_FirstName__c = BoothAdmin.BoothAdmin_FirstName__c;
        boothPersonnel[0].BoothPersonnel_LastName__c =BoothAdmin.BoothAdmin_LastName__c;
           Update boothPersonnel;        
     
       
       } 
        
         BoothUsers.FirstName = BoothAdmin.BoothAdmin_FirstName__c;
       BoothUsers.LastName = BoothAdmin.BoothAdmin_LastName__c;
       BoothUsers.City = BoothAdmin.BoothAdmin_Organization_City__c;
       BoothUsers.State = BoothAdmin.BoothAdmin_Organization_NewState__c;
       BoothUsers.PostalCode = BoothAdmin.BoothAdmin_Organization_ZipCode__c;
       BoothUsers.Phone = BoothAdmin.BoothAdmin_Organization_PhoneNumber__c;
       
       
       Update BoothUsers;
        
        
        
         system.debug('-------------------Update User Info-----------'+BoothUsers);
       
       pagereference pg = new pagereference('/apex/QRCode_BoothadminEventsph');
       pg.setredirect(true);
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
   
   static testMethod void myUnitTest() {
    
    
    contact m = new contact(firstname='testcontactname',lastname='testcontactlastname');
           
           insert m;
       
       Profile w = [select id from profile where name='Standard User'];
 
        User u = new User(alias = 'test123', email='test123@noemail.com',
                 emailencodingkey='UTF-8',profileid = w.Id,lastname='Testing', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',
                  timezonesidkey='America/Los_Angeles', username='test123@noemail.com');
                  insert u;
 
    
    system.runAs(u){
        
       
    
     QR_Event__c x = new QR_Event__c(Event_Title__c='testEvent',Event_HostingTimeZone__c='Eastern Time(USA)',Start_Date__c =date.parse('05/22/2012'),End_Date__c=date.parse('05/29/2012'));
     insert x;
    
      QR_BoothAdmin__c t = new QR_BoothAdmin__c(BoothAdmin_FirstName__c='testboothadminfirstname',BoothAdmin_Organization_Name__c='testboothadminorganiname',BoothAdmin_LastName__c='testboothlastmname',BoothAdmin_EmailId__c='test123@noemail.com',Event_Id__c=x.id);
      insert t;
      
    // QRcode_BoothAdmin_Profileupdatecon.LoginuserName='durga+exhibitor2@globalnest.com';
     
        
      //'LoginuserName='durga+exhibitor2@globalnest.com';
     
     QRcode_BoothAdmin_Profileupdatecon con = new QRcode_BoothAdmin_Profileupdatecon();
    con.boothqrcodeAction();
       con.LoginuserName = u.Username;
       con.Reportsaction();
      con.Profileupdatepage();
      con.AttendeesAction();
      con.Customeraction();
      con.EventAction();
     con.getStates();
      //con.LoginUsername=t.id; 
     con.BoothAdmin = t;
     con.save();
     con.Help();
     con.CloseHelppopup();
    }
   
   }
       
}