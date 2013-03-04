public with sharing class Qrcode_eventadmin_signinmultiEventCon {

 public pagereference cancel() {
    pagereference pf= new pagereference('/apex/QRcode_EventAdmin_signinmultiEvent');
        pf.setRedirect(true);
        return pf;
       //Signuppopup = false;  
    }
    
    public pagereference SuccesPopUpclose() {
    pagereference pf= new pagereference('/apex/QRcode_EventAdmin_signinmultiEvent');
        pf.setRedirect(true);
        return pf;
       //Signuppopup = false;  
    }

    public pagereference Signuppop() {
       Signuppopup = True;
       return null;
    }
    
    public void Onclickback()
    {
       signuppopup = False;
     }  

  
    public PageReference forgotpassword() 
    {
      PageReference pf = new PageReference('/apex/qrcode_forgotpasswordmultiEvent');
       pf.setRedirect(true);
        return pf;
    }

    public String Loginname{get; set;}
    public String password {get; set;}
    public Pagereference mallikpg{get; set;}
    Public Boolean SucessPopUp{get;set;}
    public User u{get; set;}
    
    public User userid{get; set;}

    public PageReference login()
     
    {
          password = password.trim();
           Loginname = Loginname.trim(); 
          try{
        userid =[select Name,Profile.Name from user where Username=: Loginname];
        
        System.debug('UserName is'+userid );
        
        }
        
        catch(QueryException ex){
        
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Your login attempt has failed. Make sure the username and password are correct.'));
        return null;
        
        }
         
         //if(userid.Profile.Name !='NJ Admin')
         if(userid.Profile.Name =='Event Admin1'){
         return Site.login(Loginname, password, '/apex/Qrcode_Eventadmin_homepage');        
         }else if(userid.Profile.Name =='Booth Admin1'){
           return Site.login(loginname, password, '/apex/QRCode_BoothadmineventsphmultiEvent');
         }
         else{
          ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'User has no Privileges to access'));
          return null;
       }
       
    }
 
  
       public Qrcode_eventadmin_signinmultiEventCon (){
       
              displayerror='';
              signuppopup = False;
              sucessPopUp = False;
             
       }
    
     

    public pagereference SignIn()
    {
    
        pagereference pf= new pagereference('/apex/QRcode_EventAdmin_signin');
        pf.setRedirect(true);
        return pf;
    
    
    
    }

    public String FirstName{get; set;}
    public String LastName{get; set;}
    public String Email{get; set;}
    public String Phone{get; set;}
    public String Street{get; set;}
    public String City{get; set;}
    public String State{get; set;}
    public String Country{get; set;}
    public String postalcode{get; set;}
    public String information{get; set;}
    public String UserName{get; set;}
        
    public Account acc{get; set;}
    Public Contact con{get; set;}
    //Public User u{get; set;}
    public Profile p{get; set;}
    Public UserRole r{get; set;}
    //public id UserId{get; set;}
    public String Searchstr{get;set;}
    Public QR_EventAdmin__c EventAdm{get;set;}
    Public QR_EventOrganizationDetails__c EventOrg{get; set;}
    Public string OrgName{get; Set;}
    Public String Website{get; set;}
    Public Boolean Onclickback{get;set;}
    Public Boolean SignupPopup{get;set;}
    Public String POBox{get;set;}
    Public string add1{get;set;}
    public string add2{get;set;}
    Public QR_Report__c EventAdminReports{get;set;}
    public LIST<User> BoothUsers{get; set;}
    public string displayerror{get;set;}
    public boolean booltet{get;set;}
  public boolean Emailvalidation(string s)
  {
  booltet =true;
    BoothUsers = [SELECT Email FROM user]; 
    System.debug('@@@@@@@@@@@@@@@@@@@@'+BoothUsers );  
   for(user u:BoothUsers){
     if(u.Email== Email)
     {
     System.debug('!!!!!!!!!!!!!!!!!!!!!!!!!' +u.email);
    displayerror ='Email already exist';
     booltet = false;
     }     
   System.debug('%%%%%%%%%%%%%%%%%%%%%%%%%%%'+ booltet );
   } 
  return booltet;
  }

    
    

}