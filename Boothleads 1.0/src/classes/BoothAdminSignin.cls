public class BoothAdminSignin {


    public PageReference forgotpassword() 
    {
      PageReference pf = new PageReference('/apex/qrcode_Boothadmin_forgotpassword');
       pf.setRedirect(true);
        return pf;
    }

    public String Loginname {get; set;}
    public String password {get; set;}
    public Pagereference mallikpg{get; set;}
    
    public User u{get; set;}
    
    public User userid{get; set;}

    public PageReference login() 
    {
           // validate();
           password = password.trim();
           Loginname = Loginname.trim(); 
                 try{
            userid =[select Name,Profile.Name from user where Username=:Loginname];
            }catch(Exception e){
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Your login attempt has failed. Make sure the username and password are correct.'));
             return null;
    
            }
            //if(userid.Profile.Name == 'Booth Admin')
            if(userid.Profile.Name == 'Booth Admin1')
            {
            return Site.login(loginname, password, '/apex/QRCode_Boothadmineventsph');
            }else{
         ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'User has no Privileges to access'));
         return null;
         }
    }
    
    
    public Pagereference validate()
    {
        system.debug('ggggggggggggggggggggg'+Loginname);
        
        try{
        userid =[select Name,Profile.Name from user where Username=:Loginname];
        }catch(Exception e){
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Invalid Username'));
         return null;

        }
        
      return null;
    }
    
    
    
       public BoothAdminSignin () {}
    
    public static testMethod void testBoothAdminSignin  () {
        // Instantiate a new controller with all parameters in the page
      
         
    
      
      
        BoothAdminSignin controller = new BoothAdminSignin ();
        controller.Loginname = 'test@salesforce.com';
        controller.password = '123456';
         controller.forgotpassword();
         controller.validate();
        System.assertEquals(controller.login(),null);                           
    } 
    
 
    
         
}