public class ResetPasswordCon {

    public PageReference Reportsaction() {
    Pagereference pg = new Pagereference('/apex/QRCode_EventReport');
    pg.setredirect(True); 
        return pg;
    }


    public PageReference AttendeesAction() {
    Pagereference pg = new Pagereference('/apex/Qr_Booth_attendees');
        Pg.setredirect(true);
        Return pg;  
    }


    public PageReference Customeraction() {
    Pagereference pg = new Pagereference('/apex/QRCode_Eventadmin_Boothadmin');
    pg.setredirect(true);
        return Pg;
    }


    public PageReference EventAction() {
    Pagereference pg = new Pagereference('/apex/Qrcode_Eventadmin_homepage');
    pg.setredirect(True); 
        return pg;
    }

    public PageReference Back() {
    Pagereference pg = new Pagereference('/apex/QRcode_Eventadmin_profileupdate');
    pg.setredirect(True); 
        return pg;
    }

    public String oldPassword {get; set;}
    public String newPassword {get; set;}
    public String verifyNewPassword {get; set;}
    Public User user{get;set;}        
    
    public pageReference success{get;set;} 
    
    public PageReference changePassword() {
     
       success= Site.changePassword(newPassword, verifyNewPassword, oldpassword);
      
    system.debug('hiiiiiiiiiiiiiiiiiiiiiiiiii'+success);
    
    if(success != null){
    pageReference pg = new pageReference('/apex/QRcode_EventAdmin_ProfileUpdate');
    pg.setredirect(true);
          return pg;
    }
    
    
         return null;
    }
    Public Boolean HelpPopUp{get;set;}
    Public void Help(){
    HelpPopUp = True;
    }
    Public Void CloseHelppopup(){
    HelpPopUp = false;
    }     
    
    public ResetPasswordCon () {}
    
    public static testMethod void testResetPasswordCon () {
        // Instantiate a new controller with all parameters in the page
        ResetPasswordCon  controller = new ResetPasswordCon();
        controller.oldPassword = '123456';
        controller.newPassword = 'qwerty1'; 
        controller.verifyNewPassword = 'qwerty1';  
        controller.Reportsaction();
        controller.AttendeesAction();
        controller.Customeraction();
        controller.EventAction();
        controller.Back();
        controller.Help();
        controller.CloseHelpPopup();
        
                      
        
        System.assertEquals(controller.changePassword(),null);                           
    }    

}