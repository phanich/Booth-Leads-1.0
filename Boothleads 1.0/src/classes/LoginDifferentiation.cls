public class LoginDifferentiation {

    public PageReference BoothAdminadminLogin() {
        Pagereference pg = new pagereference('/apex/QRcode_BoothAdmin_signin');
        Pg.setredirect(true);
        return Pg;
        
    }


    public PageReference EventAdminLogin() {
        Pagereference pg = new pagereference('/apex/QRcode_EventAdmin_signin');
        Pg.setredirect(true);
        return Pg;
    }

}