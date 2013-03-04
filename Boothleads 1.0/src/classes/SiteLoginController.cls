public class SiteLoginController {

    public PageReference forgotpassword() 
    {
      PageReference pf = new PageReference('/apex/portal_forgotpassword');
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
    
        
        
        /**condition based on user*/
       if(loginname=='durgam@globalnest.com')
        {
            return Site.login(loginname, password, '/apex/portaladmin_Report');
        }
      else
      {
         
           return Site.login(Loginname, password, '/apex/restaurentadmin_Reportdummay');
         
      }
   
    }
    
    
    public void validate()
    {
        userid =[select Name from user where Username=: Loginname  ];
    
    }
    
    
    
       public SiteLoginController () {}
    
    public static testMethod void testSiteLoginController () {
        // Instantiate a new controller with all parameters in the page
        SiteLoginController controller = new SiteLoginController ();
        controller.Loginname = 'test@salesforce.com';
        controller.password = '123456';
                
        System.assertEquals(controller.login(),null);                           
    } 
    
    
  /**  public Pagereference selectPassword()
    {
        u = new User();
        
        u =[Select password__c,Username  from USER WHERE Username=: Loginname];
        
        System.debug('Hello Mallikkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk'+ u);
        //u.password__c = password;
        System.debug('1111111111111111111111111111111111111111111111111------');
        
        if(u.password__c == NULL|| u.password__c =='')
        {
 
            mallikpg = new Pagereference('/apex/portal_resetPassword');
            mallikpg.setRedirect(true);
             
            System.debug('2222222222222222222222222222222222222222222222222------');
            
        }
         
       return mallikpg;
         
        
    }*/
    
         
}