public with sharing class boothadminChangePasswordpagecon {

public PageReference boothqrcodeAction() {
      Pagereference pg = new pagereference('/apex/QRcode_Boothadmin_booth');
    pg.setredirect(true);
        return pg;
    }



public Pagereference checkUserId()
{
system.debug('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh'+UserInfo.getUserId());

if(UserInfo.getUserId() == '00590000000zKNlAAM' || UserInfo.getUserId()==null)
{
  system.debug('ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt'+UserInfo.getUserId());
Pagereference pg = new Pagereference('/apex/QRcode_BoothAdmin_signin');
Pg.setredirect(true);
return pg;


}else {
return null;
}


}



  public PageReference Back() {
    Pagereference pg = new Pagereference('/apex/QRcode_Boothadmin_profileupdate');
    pg.setredirect(True); 
        return pg;
    }
    
     public PageReference Reportsaction() {
    pagereference pg = new pagereference('/apex/QRcode_Boothadmin_Reportsph');
    pg.setredirect(true);
        return pg;
        
    }

    public PageReference profileaction() {
    Pagereference pg = new pagereference('/apex/QRcode_BoothAdmin_Profileupdate');
    pg.setredirect(true);
        return pg;
       
    }


    public PageReference AttendeesAction() {
    pagereference pg = new pagereference('/apex/Boothadmin_Attendeesph');
    pg.setredirect(true);
        return pg;
        
    }


    public PageReference Customeraction() {
     pagereference pg = new pagereference('/apex/QRCode_Boothadmin_Personnelsph');
    pg.setredirect(true);
        return pg;
        
    }
    
    public PageReference EventAction() {
    pagereference pg = new pagereference('/apex/QRCode_Boothadmineventsph');
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
        Pagereference pg = new Pagereference('/apex/QRcode_Boothadmin_profileupdate');  
        pg.setredirect(true);
        return pg;  
        }
        
        return null;
    }     
    
    public boothadminChangePasswordpagecon() {}
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
        boothadminChangePasswordpagecon con = new boothadminChangePasswordpagecon();
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