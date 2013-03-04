public class BoothadminForgotPasswordController {
/**
 * An apex page controller that exposes the site forgot password functionality
 */

    public String username {get; set;}   
       
    //public BoothAdminForgotPasswordController() {}
        
        public PageReference forgotPassword() {
                boolean success = Site.forgotPassword(username);
                PageReference pr = Page.Qrcode_BoothAdminforgotpasswordconfirm;
                pr.setRedirect(true);
                
                if (success) {                          
                        return pr;
                }
                return null;
        }
        
         public static testMethod void testForgotPasswordController() {
        // Instantiate a new controller with all parameters in the page
        BoothadminForgotPasswordController controller = new BoothadminForgotPasswordController();
        controller.username = 'test@salesforce.com';            
      // controller.BoothAdminForgotPasswordController();
        
        controller.forgotPassword();
        
        System.assertEquals(controller.forgotPassword(),null); 
    }
}