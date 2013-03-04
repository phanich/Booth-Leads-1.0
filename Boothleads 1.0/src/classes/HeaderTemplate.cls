public class HeaderTemplate {

    public PageReference Reportsaction() {
    Pagereference pg = new Pagereference('/apex/QRCode_EventReport');
            pg.setRedirect(true);
            return pg;
        
    }


    public PageReference AttendeesAction() {
    Pagereference pg = new Pagereference('/apex/QRCodeDummyAttendee');
        Pg.setredirect(true);
        Return pg; 
    }


    public PageReference Customeraction() {
    Pagereference pg = new Pagereference('/apex/QRCode_Exhibitorslogindetails');
    pg.setredirect(true);
        return Pg;
    }


    public PageReference EventAction() {
    Pagereference pg = new Pagereference('/apex/QRCode_eventadmin_homepage');
    pg.setredirect(true);
        return Pg;
    }

}