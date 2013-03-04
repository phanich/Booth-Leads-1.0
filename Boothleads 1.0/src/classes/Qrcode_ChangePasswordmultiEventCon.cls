public with sharing class Qrcode_ChangePasswordmultiEventCon {

public PageReference boothqrcodeAction() {
      Pagereference pg = new pagereference('/apex/QRcode_Boothadmin_boothmultiEvent');
    pg.setredirect(true);
        return pg;
    }





  public PageReference Back() {
    Pagereference pg = new Pagereference('/apex/QRcode_Boothadmin_profilemultiEvent');
    pg.setredirect(True); 
        return pg;
    }
    
     public PageReference Reportsaction() {
    pagereference pg = new pagereference('/apex/QRcode_Boothadmin_ReportsphmultiEvent');
    pg.setredirect(true);
        return pg;
        
    }

    public PageReference profileaction() {
    Pagereference pg = new pagereference('/apex/QRcode_BoothAdmin_ProfilemultiEvent');
    pg.setredirect(true);
        return pg;
       
    }


    public PageReference AttendeesAction() {
    pagereference pg = new pagereference('/apex/Boothadmin_Attendeesphmulti');
    pg.setredirect(true);
        return pg;
        
    }


    public PageReference Customeraction() {
     pagereference pg = new pagereference('/apex/QRCode_Boothadmin_PersonnelsmultiEvent');
    pg.setredirect(true);
        return pg;
        
    }
    
    public PageReference EventAction() {
    pagereference pg = new pagereference('/apex/QRCode_BoothadmineventsphmultiEvent');
    pg.setredirect(true);
        return pg;
    
       }

    public String oldPassword {get; set;}
    public String newPassword {get; set;}
    public String verifyNewPassword {get; set;}        
    public pageReference success{get;set;}
    
    public PageReference changePassword() {
        success =Site.changePassword(newPassword, verifyNewPassword, oldpassword);
       
       
       if(success != null){
        Pagereference pg = new Pagereference('/apex/QRcode_Boothadmin_profilemultiEvent');  
        pg.setredirect(true);
        return pg;  
        }
        
        return null;
    }     
    
    public Qrcode_ChangePasswordmultiEventCon () {}
     //---------------Help-------------------
    Public Boolean HelpPopUp{get;set;}
    Public void Help(){
    HelpPopUp = True;
    }
    Public Void CloseHelppopup(){
    HelpPopUp = false;
    }
    
     public static testMethod void testChangePasswordController() {
        // Instantiate a new controller with all parameters in the page
        Qrcode_ChangePasswordmultiEventCon  con = new Qrcode_ChangePasswordmultiEventCon ();
        con.oldPassword = '123456';
        con.newPassword = 'qwerty1'; 
        con.verifyNewPassword = 'qwerty1';                
        con.changePassword();
        con.Back();
        con.Reportsaction();
        con.profileaction();
        con.AttendeesAction();
        con.Customeraction();
        con.EventAction();
        con.Reportsaction();
        con.success =null;
        con.changePassword();
        con.CloseHelppopup();
        con.Help();
        System.assertEquals(con.changePassword(),null);                           
    } 
    
    
    
}