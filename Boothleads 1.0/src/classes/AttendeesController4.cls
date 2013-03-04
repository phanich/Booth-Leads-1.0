public with sharing class AttendeesController4 {

   

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


 public PageReference boothqrcodeAction() {
      Pagereference pg = new pagereference('/apex/QRcode_Boothadmin_booth');
    pg.setredirect(true);
        return pg;
    }

public List<QR_BoothAdmin__c> boothAdminslistForEvent{get;set;}
   
public AttendeesController4 ()
    {
    
    checkUserId();
    searchstr='';
   // searchstr='Search With First Name,Last Name,Email,company Name';
     
     
    boothAdminslistForEvent=[select id, Event_Id__r.Event_Title__c FROM QR_BoothAdmin__c WHERE BoothAdmin_EmailId__c =:UserInfo.getUserName()];
    if(!boothAdminslistForEvent.isEmpty()){
      eventtitle =boothAdminslistForEvent[0].Event_Id__r.Event_Title__c;
    }
    
    displayPopUpForAdd = false;
        getAttendees();
    }
    









    public String sufix { get; set; }
    
    public List<SelectOption> getAllSuffix()
     {
         List<SelectOption> option = new  List<selectOption>();
         Option.add(new SelectOption('None','--None--'));  
         Option.add(new SelectOption('Sr.','Sr.'));  
         Option.add(new SelectOption('Jr.','Jr.'));  
        
        return option;
    
    }




    public String Birthdate {get; set;}
 
   
     public String Bdate{get; set;}
     public PageReference Reportsaction() { 
     pagereference pg = new pagereference('/apex/QRcode_Boothadmin_Reportsph');
     pg.setredirect(true);
     return pg;
    }


    public PageReference AttendeesAction() {
    pagereference pg = new pagereference('/apex/Boothadmin_Attendeesph');
    pg.setredirect(true);
        return pg;
        
    }

public PageReference profileaction() {
    Pagereference pg = new pagereference('/apex/QRcode_BoothAdmin_Profileupdate');
    pg.setredirect(true);
        return pg;
       
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


       public String loginUser=UserInfo.getUserName();
    
      
     //String loginUser ='phani+chimata8@globalnest.com';
      // 'durga+ba2@globalnest.com';
       
     
   
    public string eventName{get;set;}
    public String selEventName{get;set;}
    public QR_BoothAdmin__c boothAdminEvent{get; set;}
    
    public QR_AttendeeSummary__c objAttendees{get;set;}
    
    public List<QR_AttendeeSummary__c > attendeeList{get;set;}
    public List<QR_AttendeeSummary__c> returnList{get;set;}
    public List<SelectOption> selEventNameList{get;set;}
    
   public Boolean displayPopUp{get;set;}
   public Boolean displayPopUpForAdd{get;set;}
   public Boolean displayPopUpForAdd1{get;set;}
   public id UserId{get; set;}
   
   public String eventId=ApexPages.CurrentPage().getParameters().get('EventID');
    
    public string eventtitle{get;set;}
    
    
   public  List<QR_Attendee_BoothVisitSummary__c>  vistSummarylist{get;set;}
    public Set<string> barcodeSet{get;set;}
    
    
    public List<List<QR_Attendee_BoothVisitSummary__c>> ListOfListVisitSummary{get;set;}
    
    
     public String escapeSpecialCharacters(String input){
if(input!= null && input != '' && (input.contains('\\') )){
input = input.replace('\\','\\\\');

}
if(input!= null && input != '' && (input.contains('"') || input.contains('<'))){

if(input!= null && input != '' && (input.contains('"') )){
input = input.replace('"','\\\"');

}if(input!= null && input != '' && (input.contains('<') )){
input = input.replace('<','');
system.debug('llllllllllllllllllllll miru keka'+input);
}



}
return input;
    
    }
    
    
    
    public void getAttendees()
    {
    String hostname = ApexPages.currentPage().getHeaders().get('Host');
       system.debug('valu of hostname'+hostname ); 
         ListOfListVisitSummary = new List<List<QR_Attendee_BoothVisitSummary__c>>();
            
        if((eventId =='' || eventId ==null))
        {
            eventId =selEventName;
        }else if(selEventName == null || selEventName== '')
        {
            selEventName=eventId ;
        }
      
        Map<String,String> eventIdMap=new map<String,String>();
        
        for(QR_BoothAdmin__c obj :[Select g.id,g.Name,g.Event_Id__c, g.Event_Id__r.Event_Title__c,  g.BoothAdmin_EmailId__c
                                                From QR_BoothAdmin__c g 
                                                WHERE g.BoothAdmin_EmailId__c =: loginUser]){
        eventIdMap.put(obj.Event_Id__c,obj.Event_Id__r.Event_Title__c);
        
       
        }
        
        system.debug('eventIdMap::'+eventIdMap);
        selEventNameList = new List<SelectOption>();    
       
       system.debug('phhhhhhhhhhhhhhhhhhh Keyset Value'+eventIdMap.isEmpty());
       
        if(eventIdMap != null && !eventIdMap.isEmpty())
        {
        system.debug('hiiiiiiiiiiiiiiii Keyset Value'+eventIdMap);
            for(String evenId:eventIdMap.keySet())
            {
                selEventNameList.add(new Selectoption(evenId,eventIdMap.get(evenId)));
            }
        }
        
       
       
         
        vistSummarylist =[Select g.Attendee_ScannedBy__r.BoothAdmin_Id__c,g.Attendee_Designation__c, 
                                     g.Attendee_ScannedBy__r.Name,g.Name,  
                                     g.Attendee_ScannedBy__c,
                                     g.Attendee_ScannedBy__r.BoothPersonnel_FirstName__c,
                                     g.Attendee_NextFollowUpDate__c, 
                                     g.Attendee_BarCode1__c,
                                     g.Attendee_GatheredComments__c,
                                     g.Attendee_LeadCategory__c,g.Attendee_Company__c,
                                     g.Attendee_ScannedBy__r.BoothPersonnel_LastName__c,
                                     g.Attendee_PhoneNumber__c,g.Attendee_EmailId__c,
                                     g.Attendee_LastName__c,g.Attendee_FirstName__c 
                                    From QR_Attendee_BoothVisitSummary__c g
                                    where g.Attendee_ScannedBy__r.BoothAdmin_Id__r.BoothAdmin_EmailId__c = :loginUser limit 2500];
           
        
        
        
        integer makelistSize =0;
        List<QR_Attendee_BoothVisitSummary__c>  listOfvisitSummaryvalues = new  List<QR_Attendee_BoothVisitSummary__c>();
        
       barcodeSet= new Set<string>();
        
        for(QR_Attendee_BoothVisitSummary__c vistSummary:[Select g.Attendee_ScannedBy__r.BoothAdmin_Id__c,g.Attendee_Designation__c, 
                                    g.Attendee_ScannedBy__r.Name,g.Name,  
                                     g.Attendee_ScannedBy__c,
                                     g.Attendee_ScannedBy__r.BoothPersonnel_FirstName__c,
                                     g.Attendee_NextFollowUpDate__c, 
                                    g.Attendee_BarCode1__c,
                                    g.Attendee_GatheredComments__c,
                                    g.Attendee_LeadCategory__c,g.Attendee_Company__c,
                                    g.Attendee_ScannedBy__r.BoothPersonnel_LastName__c,
                                    g.Attendee_PhoneNumber__c,g.Attendee_EmailId__c,
                                    g.Attendee_LastName__c,g.Attendee_FirstName__c 
                                    From QR_Attendee_BoothVisitSummary__c g
                                    where g.Attendee_ScannedBy__r.BoothAdmin_Id__r.BoothAdmin_EmailId__c = :loginUser limit 2500]){
            barcodeSet.add(vistSummary.Attendee_BarCode1__c);
          
        
        vistSummary.Attendee_FirstName__c=escapeSpecialCharacters(vistSummary.Attendee_FirstName__c);
        vistSummary.Attendee_LastName__c=escapeSpecialCharacters(vistSummary.Attendee_LastName__c);
        vistSummary.Attendee_PhoneNumber__c=escapeSpecialCharacters(vistSummary.Attendee_PhoneNumber__c);
        vistSummary.Attendee_Company__c=escapeSpecialCharacters(vistSummary.Attendee_Company__c);
        vistSummary.Attendee_ScannedBy__r.BoothPersonnel_FirstName__c=escapeSpecialCharacters(vistSummary.Attendee_ScannedBy__r.BoothPersonnel_FirstName__c);
        vistSummary.Attendee_ScannedBy__r.BoothPersonnel_LastName__c=escapeSpecialCharacters(vistSummary.Attendee_ScannedBy__r.BoothPersonnel_LastName__c);
        vistSummary.Attendee_GatheredComments__c=escapeSpecialCharacters(vistSummary.Attendee_GatheredComments__c);
        
          listOfvisitSummaryvalues.add(vistSummary);
          
          if(makelistSize ==999){
          
          ListOfListVisitSummary.add(listOfvisitSummaryvalues);
          
          listOfvisitSummaryvalues = new List<QR_Attendee_BoothVisitSummary__c>();
          makelistSize =0;
          }
      
      makelistSize++; 
       }
      
      if(makelistSize  != 0){
      ListOfListVisitSummary.add(listOfvisitSummaryvalues);
      
      }
      
      
      
      
       system.debug('000000000000000'+barcodeSet);
      
       if(barcodeSet != null && barcodeSet.size()>0)
        {
             attendeeList = [Select g.SystemModstamp, g.OwnerId, g.Name, g.LastModifiedDate, g.LastModifiedById, 
                          g.LastActivityDate, g.IsDeleted, g.Id, g.Event_Id__c, 
                          g.Attendee_WorkPhone__c, g.Attendee_WorkPOBox__c, 
                          g.Attendee_WorkAddress__c, g.Attendee_WebsiteURL__c, 
                          g.Attendee_ThroughEventBrite__c, g.Attendee_Organization_City__c,
                          g.Attendee_Survey_Answers__c, g.Attendee_NewSuffix__c, 
                          g.Attendee_ShippingPOBox__c, g.Attendee_ShippingAddress__c, 
                          g.Attendee_SecondaryBusinessCategory2__c, 
                          g.Attendee_PrimaryBusinessCategory1__c, g.Attendee_NewPrefix__c, 
                          g.Attendee_NAICS_Code3__c, g.Attendee_NAICS_Code2__c, 
                          g.Attendee_NAICS_Code1__c, g.Attendee_LastName__c, 
                          g.Attendee_HomePhoneNumber__c, g.Attendee_HomeAddress__c, 
                          g.Attendee_Gender__c, g.Attendee_FirstName__c, 
                          g.Attendee_EmailId__c, g.Attendee_DiversityType1__c, 
                          g.Attendee_Designation__c, g.Attendee_Company__c, 
                          g.Attendee_CellPhoneNumber__c, g.Attendee_Business_NoOfEmployees__c, 
                          g.Attendee_Business_DnB_Id__c, g.Attendee_BusinessTaxId__c, 
                          g.Attendee_NewBusinessRevenue__c, g.Attendee_BusineesEstablished_Date1__c, 
                          g.New_Business_Description__c, g.Attendee_BlogURL__c, 
                          g.Attendee_BirthDate__c, g.Attendee_Barcode3__c, 
                          g.Attendee_Age__c, g.CreatedDate, g.CreatedById,g.Attendee_Workcity__c,
                          g.Attendee_HomeAddress1__c,g.Attendee_HomeCity__c,g.Attendee_NewHomeState__c,
                          g.Attendee_HomePOBox__c,g.Attendee_WorkAddress1__c ,g.Attendee_NewWorkState__c,
                          g.Attendee_ShippingAddress2__c,g.Attendee_shippingCity__c,g.Attendee_NewshippingState__c,Attendee_FaxNumber__c  
                          From QR_AttendeeSummary__c g where g.Attendee_Barcode3__c In : barcodeSet limit 2500];
        
             system.debug('****'+attendeeList);
        }
        
        innerclas = new List<innerclassfordisplayOdj>();
        
        for(QR_Attendee_BoothVisitSummary__c vv :vistSummarylist){
           for(QR_AttendeeSummary__c rr:attendeeList){
          
            if( vv.Attendee_BarCode1__c ==rr.Attendee_Barcode3__c){
            
            innerclas.add(new innerclassfordisplayOdj(vv,rr));
            
            }
          
          
          }
         
        }
        
                 
    }
    
    
     public List<innerclassfordisplayOdj> innerclas{get;set;}
    public class innerclassfordisplayOdj{
    
       public QR_AttendeeSummary__c a{get;set;}
       public QR_Attendee_BoothVisitSummary__c v{get;set;}
     
     
      public QR_AttendeeSummary__c b {get;set;}
       public QR_Attendee_BoothVisitSummary__c visit{get;set;}
     public  string  workpoBox {get;set;}
      public  string  homepoBox {get;set;}
       public  string  shippingpoBox {get;set;}
      public innerclassfordisplayOdj(QR_Attendee_BoothVisitSummary__c h,QR_AttendeeSummary__c r){
      this.v=h;
      this.a=r;
     
      this.b = r;
      this.visit =h;
     workpoBox = '';
     homepoBox='';
     shippingpoBox ='';
     system.debug('25252522525252525252252525252525252525252525252'+b);
    b.Attendee_NewPrefix__c=escape(b.Attendee_NewPrefix__c);
  
    
    
    
    visit.Attendee_FirstName__c=escape(visit.Attendee_FirstName__c);
    visit.Attendee_LastName__c=escape(visit.Attendee_LastName__c);
    
    visit.Attendee_EmailId__c =escape(visit.Attendee_EmailId__c);
   
    b.Attendee_Company__c=escape(b.Attendee_Company__c);
   
    b.Attendee_Designation__c=escape(visit.Attendee_Designation__c);  
    b.Attendee_CellPhoneNumber__c =escape(b.Attendee_CellPhoneNumber__c);
    
   // visit.Attendee_PhoneNumber__c=escape(visit.Attendee_PhoneNumber__c);
    
    b.Attendee_WorkAddress1__c=escape(b.Attendee_WorkAddress1__c);  
    b.Attendee_WorkAddress__c=escape(b.Attendee_WorkAddress__c);  
    b.Attendee_Workcity__c=escape(b.Attendee_Workcity__c);  
    b.Attendee_NewWorkState__c=escape(b.Attendee_NewWorkState__c);  
    b.Attendee_WorkPhone__c=escape(visit.Attendee_PhoneNumber__c); 
     
   
     
  // b.Attendee_WorkPOBox__c=escape(b.Attendee_WorkPOBox__c); 
     system.debug('Value Of WorkPOBox   ::::::'+b.Attendee_WorkPOBox__c);
      if(b.Attendee_WorkPOBox__c!=null){
   workpoBox ='"=TEXT('+b.Attendee_WorkPOBox__c+','+'\""00000\"")"';
   //b.Attendee_WorkPOBox__c ='"=TEXT('+b.Attendee_WorkPOBox__c+','+'\""00000\"")';
      }
    b.Attendee_FaxNumber__c = escape(b.Attendee_FaxNumber__c);       
   
    b.New_Business_Description__c=escape(b.New_Business_Description__c);  
    b.Attendee_Business_DnB_Id__c=escape(b.Attendee_Business_DnB_Id__c);  
    
   
    
    b.Attendee_BusinessTaxId__c=escape(b.Attendee_BusinessTaxId__c);  
    b.Attendee_PrimaryBusinessCategory1__c=escape(b.Attendee_PrimaryBusinessCategory1__c); 
     b.Attendee_SecondaryBusinessCategory2__c=escape(b.Attendee_SecondaryBusinessCategory2__c); 
     
    b.Attendee_ShippingAddress__c=escape(b.Attendee_ShippingAddress__c);  
    b.Attendee_shippingCity__c=escape(b.Attendee_shippingCity__c);  
    
    
    b.Attendee_NewshippingState__c=escape(b.Attendee_NewshippingState__c);  
    b.Attendee_ShippingAddress2__c=escape(b.Attendee_ShippingAddress2__c);  
   
   if(b.Attendee_ShippingPOBox__c!=null){
    shippingpoBox ='"=TEXT('+b.Attendee_ShippingPOBox__c+','+'\""00000\"")"';
   }
    
    
   // b.Attendee_ShippingPOBox__c=escape(b.Attendee_ShippingPOBox__c);  
    // system.debug('Value Of shippingPOBox   ::::::'+b.Attendee_ShippingPOBox__c);
   // b.Attendee_ShippingPOBox__c='"=TEXT('+b.Attendee_ShippingPOBox__c+','+'\""00000\"")';
   
    b.Attendee_BlogURL__c=escape(b.Attendee_BlogURL__c);  
    
    
    b.Attendee_WebsiteURL__c=escape(b.Attendee_WebsiteURL__c);  
    b.Attendee_HomePhoneNumber__c=escape(b.Attendee_HomePhoneNumber__c);  
    b.Attendee_HomeAddress__c=escape(b.Attendee_HomeAddress__c);  
    b.Attendee_HomeAddress1__c=escape(b.Attendee_HomeAddress1__c);  
    
    
    b.Attendee_HomeCity__c=escape(b.Attendee_HomeCity__c);  
    b.Attendee_NewHomeState__c=escape(b.Attendee_NewHomeState__c);  
   // b.Attendee_HomePOBox__c=escape(b.Attendee_HomePOBox__c);  
    
  //  system.debug('Value Of HomePOBox   ::::::'+b.Attendee_HomePOBox__c);
    
  // b.Attendee_HomePOBox__c='"=TEXT('+b.Attendee_HomePOBox__c+','+'\""00000\"")';
    
  //  system.debug('Value Of HomePOBox ;;;;;;;'+b.Attendee_HomePOBox__c);
    if(b.Attendee_HomePOBox__c!=null){
       homepoBox = '"=TEXT('+b.Attendee_HomePOBox__c+','+'\""00000\"")"';
    }
    b.Attendee_Survey_Answers__c=escape(b.Attendee_Survey_Answers__c); 
    
    b.Attendee_DiversityType1__c=escape(b.Attendee_DiversityType1__c);  
    
    visit.Attendee_LeadCategory__c=escape(visit.Attendee_LeadCategory__c);
    visit.Attendee_ScannedBy__r.BoothPersonnel_FirstName__c=escape(visit.Attendee_ScannedBy__r.BoothPersonnel_FirstName__c);
    visit.Attendee_ScannedBy__r.BoothPersonnel_LastName__c=escape(visit.Attendee_ScannedBy__r.BoothPersonnel_LastName__c);
    visit.Attendee_GatheredComments__c=escape(visit.Attendee_GatheredComments__c);
    
      }
      
      public string escape(string s){
      
     
      if(s != null && s.contains(',')){
          
         s=s.replaceAll('"','');
          
          s='"'+s+'"';
       } 
            
       return s;
      }
      
    }
    
    public void closePopup() {        
        displayPopup = false; 
         
    } 
   
   
    public void closePopupph() {
  
    displayPopUpForAdd = false;  
    //displayPopUpForAdd1=false;
       // objAttendees = null;        
          
    }
   
   
    
    public void closePopup2() {
  
    displayPopUpForAdd = false;  
    displayPopUpForAdd1=false;
       // objAttendees = null;        
          
    }
     
     
     public QR_AttendeeSummary__c ph{get;set;} 
       public QR_AttendeeSummary__c pha{get;set;} 
     public QR_Attendee_BoothVisitSummary__c  phvisit{get;set;} 
     
   
    public void getEventDetails()
    {
       phvisit = new QR_Attendee_BoothVisitSummary__c();
       pha = new QR_AttendeeSummary__c ();
        ph = new QR_AttendeeSummary__c ();
       for(QR_Attendee_BoothVisitSummary__c emEvent :vistSummarylist){
        
            if(eventName!= null && eventName !='' && eventName.equals(emEvent.id)){
             
          phvisit= [select Attendee_BarCode1__c,Attendee_PhoneNumber__c,Attendee_EmailId__c,Attendee_Designation__c,Attendee_LeadCategory__c,
          Attendee_FirstName__c,Attendee_Company__c,Attendee_GatheredComments__c,Attendee_NextFollowUpDate__c,Attendee_LastName__c,Attendee_ScannedBy__r.BoothPersonnel_FirstName__c,Attendee_ScannedBy__r.BoothPersonnel_LastName__c from QR_Attendee_BoothVisitSummary__c where id=:eventName];   
           string ig = phvisit.Attendee_BarCode1__c ;
            
         try{
          
            pha =[Select g.SystemModstamp, g.OwnerId, g.Name, g.LastModifiedDate, g.LastModifiedById, 
                          g.LastActivityDate, g.IsDeleted, g.Id, g.Event_Id__c, 
                          g.Attendee_WorkPhone__c, g.Attendee_WorkPOBox__c, 
                          g.Attendee_WorkAddress__c, g.Attendee_WebsiteURL__c, 
                          g.Attendee_ThroughEventBrite__c, g.Attendee_Organization_City__c,
                          g.Attendee_Survey_Answers__c, g.Attendee_NewSuffix__c, 
                          g.Attendee_ShippingPOBox__c, g.Attendee_ShippingAddress__c, 
                          g.Attendee_SecondaryBusinessCategory2__c, 
                          g.Attendee_PrimaryBusinessCategory1__c, g.Attendee_NewPrefix__c, 
                          g.Attendee_NAICS_Code3__c, g.Attendee_NAICS_Code2__c, 
                          g.Attendee_NAICS_Code1__c, g.Attendee_LastName__c, 
                          g.Attendee_HomePhoneNumber__c, g.Attendee_HomeAddress__c, 
                          g.Attendee_Gender__c, g.Attendee_FirstName__c, 
                          g.Attendee_EmailId__c, g.Attendee_DiversityType1__c, 
                          g.Attendee_Designation__c, g.Attendee_Company__c, 
                          g.Attendee_CellPhoneNumber__c, g.Attendee_Business_NoOfEmployees__c, 
                          g.Attendee_Business_DnB_Id__c, g.Attendee_BusinessTaxId__c, 
                          g.Attendee_NewBusinessRevenue__c, g.Attendee_BusineesEstablished_Date1__c, 
                          g.New_Business_Description__c, g.Attendee_BlogURL__c, 
                          g.Attendee_BirthDate__c, g.Attendee_Barcode3__c, 
                          g.Attendee_Age__c, g.CreatedDate, g.CreatedById,g.Attendee_Workcity__c,
                          g.Attendee_HomeAddress1__c,g.Attendee_HomeCity__c,g.Attendee_NewHomeState__c,
                          g.Attendee_HomePOBox__c,g.Attendee_WorkAddress1__c ,g.Attendee_NewWorkState__c,
                          g.Attendee_ShippingAddress2__c,g.Attendee_shippingCity__c,g.Attendee_NewshippingState__c,g.Attendee_FaxNumber__c  
                          From QR_AttendeeSummary__c g where g.Attendee_Barcode3__c=:ig limit 2500];
            
            }
            catch(exception e){
            pha = new QR_AttendeeSummary__c ();
            }
            
            
            
            
             system.debug('%%%%%%%%%%%%%%%%%%%%%%%%%'+pha);
            
            if(phvisit.Attendee_FirstName__c != null || phvisit.Attendee_FirstName__c!=''){
            ph.Attendee_FirstName__c = phvisit.Attendee_FirstName__c ;
            }else{
                ph.Attendee_FirstName__c = pha .Attendee_FirstName__c ;
            }
            
            if(phvisit.Attendee_LastName__c != null || phvisit.Attendee_LastName__c !=''){
            ph.Attendee_LastName__c= phvisit.Attendee_LastName__c ;
            }else{
                ph.Attendee_LastName__c= pha.Attendee_LastName__c ;
            }   
           
             
            if(phvisit.Attendee_EmailId__c!= null || phvisit.Attendee_EmailId__c!=''){
               ph.Attendee_EmailId__c= phvisit.Attendee_EmailId__c;
            }else{
                ph.Attendee_EmailId__c= pha .Attendee_EmailId__c;
            } 
            
            if(phvisit.Attendee_Company__c!= null || phvisit.Attendee_Company__c!=''){
            ph.Attendee_Company__c= phvisit.Attendee_Company__c;
            }else{
                ph.Attendee_Company__c= pha .Attendee_Company__c;
            }
            
            
            if(phvisit.Attendee_Designation__c != null || phvisit.Attendee_Designation__c != ''){
            ph.Attendee_Designation__c= phvisit.Attendee_Designation__c;
            }else{
                ph.Attendee_Designation__c= pha.Attendee_Designation__c;
            }
            
            
            
            if(phvisit.Attendee_PhoneNumber__c!= null || phvisit.Attendee_PhoneNumber__c!=''){
            ph.Attendee_CellPhoneNumber__c= phvisit.Attendee_PhoneNumber__c;
            }else{
                ph.Attendee_CellPhoneNumber__c= pha.Attendee_CellPhoneNumber__c;
            }
            
            
            ph.Attendee_HomePhoneNumber__c= pha.Attendee_HomePhoneNumber__c;  
            ph.Attendee_Gender__c= pha.Attendee_Gender__c;  
            ph.Attendee_BirthDate__c= pha.Attendee_BirthDate__c;  
            ph.Attendee_HomeAddress__c= pha.Attendee_HomeAddress__c;  
            ph.New_Business_Description__c= pha.New_Business_Description__c;  
            ph.Attendee_BusineesEstablished_Date1__c= pha.Attendee_BusineesEstablished_Date1__c;  
            ph.Attendee_Business_DnB_Id__c= pha.Attendee_Business_DnB_Id__c;  
            ph.Attendee_Business_NoOfEmployees__c= pha.Attendee_Business_NoOfEmployees__c;
            ph.Attendee_NewBusinessRevenue__c= pha.Attendee_NewBusinessRevenue__c;  
            ph.Attendee_BusinessTaxId__c= pha.Attendee_BusinessTaxId__c;  
            ph.Attendee_DiversityType1__c=pha.Attendee_DiversityType1__c;
            
            ph.Attendee_PrimaryBusinessCategory1__c= pha.Attendee_PrimaryBusinessCategory1__c;  
            ph.Attendee_SecondaryBusinessCategory2__c= pha.Attendee_SecondaryBusinessCategory2__c;  
            ph.Attendee_FaxNumber__c = pha.Attendee_FaxNumber__c;
            ph.Attendee_ShippingAddress__c= pha.Attendee_ShippingAddress__c;  
             ph.Attendee_ShippingAddress2__c  =pha.Attendee_ShippingAddress2__c;
            ph.Attendee_ShippingPOBox__c= pha.Attendee_ShippingPOBox__c;  
            ph.Attendee_BlogURL__c= pha.Attendee_BlogURL__c;  
            ph.Attendee_WebsiteURL__c= pha.Attendee_WebsiteURL__c;  
            ph.Attendee_WorkAddress__c= pha.Attendee_WorkAddress__c;  
            ph.Attendee_WorkPhone__c= pha.Attendee_WorkPhone__c;  
            ph.Attendee_WorkPOBox__c= pha.Attendee_WorkPOBox__c;  
            ph.Attendee_ThroughEventBrite__c= pha.Attendee_ThroughEventBrite__c;
            ph.Attendee_Survey_Answers__c= pha.Attendee_Survey_Answers__c; 
            ph.Attendee_Age__c= pha.Attendee_Age__c;  
            ph.Attendee_NAICS_Code1__c= pha.Attendee_NAICS_Code1__c;  
            ph.Attendee_NAICS_Code2__c= pha.Attendee_NAICS_Code2__c;  
            ph.Attendee_NAICS_Code3__c= pha.Attendee_NAICS_Code3__c;  
            ph.Attendee_HomeAddress1__c= pha.Attendee_HomeAddress1__c;  
            ph.Attendee_HomeCity__c= pha.Attendee_HomeCity__c;  
            ph.Attendee_newHomeState__c= pha.Attendee_newHomeState__c;  
            ph.Attendee_HomePOBox__c= pha.Attendee_HomePOBox__c;
            ph.Attendee_WorkAddress1__c= pha.Attendee_WorkAddress1__c; 
            ph.Attendee_Workcity__c= pha.Attendee_Workcity__c;  
            ph.Attendee_newWorkState__c= pha.Attendee_newWorkState__c; 
            ph.Attendee_shippingCity__c= pha.Attendee_shippingCity__c; 
            ph.Attendee_newshippingState__c= pha.Attendee_newshippingState__c;  
            ph.Attendee_NewPrefix__c= pha.Attendee_NewPrefix__c;  
            ph.Attendee_NewSuffix__c= pha.Attendee_NewSuffix__c; 
            
                displayPopUp= true;
                break;
          
        }
       
     
        }
    }

   
    public pagereference savePopupValues()
    {
       
        displayPopUpForAdd=false;
        
        
        if(objAttendees != null)
        {
     
       
            objAttendees.Event_Id__c=boothAdminEvent.Event_Id__c;
              objAttendees.Attendee_status__c = 'Active';
              objAttendees.Attendee_status__c = 'Active';
              System.debug('*****'+objAttendees);
             upsert objAttendees;
            
            getAttendees();
        }
        
        system.debug('@@@#####'+objAttendees.Attendee_HomeAddress1__c);
        pagereference pg = new pagereference('/apex/Boothadmin_Attendeesph');
        pg.setredirect(true);
        return pg;
    }
    
    
    public string displayattendeevalue{get;set;}
    
    
    public void addAttendees()
    {   
          
     objAttendees= new QR_AttendeeSummary__c();
        displayPopUpForAdd =true;
        displayattendeevalue ='Add Attendee';
       // displayPopUpForAdd1 =true;
       
    }
    
    public PageReference exportToCSV()
    {
    
     System.debug('@@@@venkatesh'+attendeeList);
    
        if(attendeeList != null && attendeeList.size()>0){
        
          System.debug('@@@@venkatesh'+attendeeList);
          
            PageReference pageRef= new PageReference('/apex/AttendeeExportph');
            pageRef.setredirect(false);
            return pageRef;
       }
       
       return null;
    }
    
    
 
    
    public void editAttendees()
    {   
        system.debug('eventName=========:::' +eventName);
        system.debug('eventName=========:::123' +attendeeList);
     //   objAttendees= new QR_AttendeeSummary__c();
     
     if(eventName != null || eventName!=''){
        displayattendeevalue ='EditAttendee';
      
        displayPopUpForAdd1 =true;
        //returnList = new List<QR_BoothAdmin__c>();
        for(QR_AttendeeSummary__c emEvent :attendeeList)
        {
          
            if(eventName!= null && eventName !='' && eventName.equals(emEvent.Id))
            {
            
                displayPopUpForAdd1 =true;
                emEvent.Attendee_status__c = 'Active';
                objAttendees=emEvent;
                  system.debug('eventName=========:::456' +objAttendees);
                break;
            }
        }
        }
    }
    
    public pagereference deleteAttendeeRecord()
    {
        system.debug('eventName=========:::' +eventName);
         system.debug('eventName=========:::' +attendeeList);
        
        objAttendees = new QR_AttendeeSummary__c();
        for(QR_AttendeeSummary__c emEvent :attendeeList)
        {
            if(eventName!= null && eventName !='' && eventName.equals(emEvent.Id))
            {
                emEvent.Attendee_status__c = 'InActive';
                objAttendees=emEvent;
                break;
            }
        }
        
        if(objAttendees != null)
        {
            update objAttendees;
            getAttendees();
        }
        
        pagereference pg = new pagereference('/apex/Boothadmin_Attendeesph');
         pg.setredirect(true);
         return pg;
        
    }
    
    public List<selectoption> getGender()
      { 
          List<selectoption> Option = new List<selectoption>();
          Option.add(new selectoption('Male','Male'));
          Option.add(new selectoption('Female','Female'));
          return option;
       }
       
       
       /**-------------------- Written By Mallik For Add Edit Attendees For Primary Business Category, Secondary Business Category, Diverity Type------------**/ 
       
    
    public string EditDate{get; set;}
    public string searchstr{get; set;}
   
    public void search(){
    List<QR_Attendee_BoothVisitSummary__c> listOfvisitSummaryvalues = new List<QR_Attendee_BoothVisitSummary__c>();
    integer makelistSize=0;
    
     ListOfListVisitSummary = new List<List<QR_Attendee_BoothVisitSummary__c>>();
    
    vistSummarylist  = new List<QR_Attendee_BoothVisitSummary__c >();
       vistSummarylist =[Select g.Attendee_ScannedBy__r.BoothAdmin_Id__c, 
                                    g.Attendee_ScannedBy__r.Name,
                                     g.Attendee_ScannedBy__c,
                                     g.Attendee_ScannedBy__r.BoothPersonnel_FirstName__c,
                                     g.Attendee_NextFollowUpDate__c, 
                                    g.Attendee_BarCode1__c,
                                    g.Attendee_GatheredComments__c,
                                    g.Attendee_LeadCategory__c,g.Attendee_Company__c,
                                    g.Attendee_ScannedBy__r.BoothPersonnel_LastName__c,
                                    g.Attendee_PhoneNumber__c,g.Attendee_EmailId__c,
                                    g.Attendee_LastName__c,g.Attendee_FirstName__c,
                                    g.Name  
                                    From QR_Attendee_BoothVisitSummary__c g
                                    where g.Attendee_ScannedBy__r.BoothAdmin_Id__r.BoothAdmin_EmailId__c = :loginUser and (Attendee_FirstName__c like :searchstr+'%' OR Attendee_LastName__c like :searchstr+'%' OR  Attendee_Company__c like :searchstr+'%' OR Attendee_EmailId__c like :searchstr+'%' OR Attendee_PhoneNumber__c like :'%'+searchstr+'%' OR Attendee_ScannedBy__r.BoothPersonnel_LastName__c like :searchstr+'%' OR Attendee_ScannedBy__r.BoothPersonnel_FirstName__c like :searchstr+'%') limit 2500];
            
        for(QR_Attendee_BoothVisitSummary__c vistSummary:vistSummarylist){
        vistSummary.Attendee_FirstName__c=escapeSpecialCharacters(vistSummary.Attendee_FirstName__c);
        vistSummary.Attendee_LastName__c=escapeSpecialCharacters(vistSummary.Attendee_LastName__c);
        vistSummary.Attendee_PhoneNumber__c=escapeSpecialCharacters(vistSummary.Attendee_PhoneNumber__c);
        vistSummary.Attendee_Company__c=escapeSpecialCharacters(vistSummary.Attendee_Company__c);
        vistSummary.Attendee_ScannedBy__r.BoothPersonnel_FirstName__c=escapeSpecialCharacters(vistSummary.Attendee_ScannedBy__r.BoothPersonnel_FirstName__c);
        vistSummary.Attendee_ScannedBy__r.BoothPersonnel_LastName__c=escapeSpecialCharacters(vistSummary.Attendee_ScannedBy__r.BoothPersonnel_LastName__c);
        vistSummary.Attendee_GatheredComments__c=escapeSpecialCharacters(vistSummary.Attendee_GatheredComments__c);
        
       listOfvisitSummaryvalues.add(vistSummary);
          
          if(makelistSize ==999){
          
          ListOfListVisitSummary.add(listOfvisitSummaryvalues);
          
          listOfvisitSummaryvalues = new List<QR_Attendee_BoothVisitSummary__c>();
          makelistSize =0;
          }
      
      makelistSize++; 
       }
      
      if(makelistSize  != 0){
      ListOfListVisitSummary.add(listOfvisitSummaryvalues);
      
      }
    
    
    
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
   
    
     QR_Event__c x = new QR_Event__c(Event_Title__c='testEvent',Event_HostingTimeZone__c='Eastern Time(USA)',Start_Date__c =date.parse('05/22/2012'),End_Date__c=date.parse('05/29/2012'));
     insert x;
    
    QR_Event__c hg = [select id from QR_Event__c where Event_Title__c='testEvent']; 
    
      QR_AttendeeSummary__c atts = new QR_AttendeeSummary__c(Attendee_FirstName__c='testboothadminfirstname',Attendee_Company__c='testboothadminorganiname',Attendee_LastName__c='testboothlastmname',Attendee_EmailId__c='test@globalnest.com',Attendee_NAICS_Code1__c=123456);
       Database.insert(atts);
       
       QR_AttendeeSummary__c atts2 = new QR_AttendeeSummary__c(Attendee_FirstName__c='testboothadminfirstname2',Attendee_Company__c='testboothadminorganiname2',Attendee_LastName__c='testboothlastmname2',Attendee_EmailId__c='test2@globalnest.com',Attendee_NAICS_Code1__c=123456);
       Database.insert(atts2);
       
       
       
       
      QR_AttendeeSummary__c  g = new QR_AttendeeSummary__c();
      
      g=[select name,Attendee_FirstName__c,Attendee_Company__c,Attendee_LastName__c,Attendee_NAICS_Code1__c from  QR_AttendeeSummary__c where id=:atts.id];
      system.debug('hi pahani this is the value of atts'+ g.Name);
    
      
      QR_BoothAdmin__c t = new QR_BoothAdmin__c(BoothAdmin_FirstName__c='testboothadminfirstname',BoothAdmin_Organization_Name__c='testboothadminorganiname',BoothAdmin_LastName__c='testboothlastmname',BoothAdmin_EmailId__c='test123@noemail.com',Event_Id__c=x.id);
      insert t;
     QR_BoothAdmin__c z= [select BoothAdmin_EmailId__c from QR_BoothAdmin__c where BoothAdmin_EmailId__c='test123@noemail.com'];
     
      QR_BoothPersonnel__c boothpersonal = new QR_BoothPersonnel__c(BoothPersonnel_FirstName__c='Booth',BoothPersonnel_LastName__c='Personnel',BoothPersonnel_EmailId__c='boothpersonnel@gmail.com',BoothAdmin_Id__c=z.Id);
      insert boothpersonal;
      
    system.debug('testttttttttttttttttttt'+boothpersonal);
     QR_Attendee_BoothVisitSummary__c  boothSummary = new QR_Attendee_BoothVisitSummary__c(Attendee_FirstName__c='testboothadminfirstname',Attendee_LastName__c='testboothlastmname',Attendee_Company__c='testboothadminorganiname',Attendee_EmailId__c='test@globalnest.com',Attendee_BarCode1__c=g.Name,Attendee_ScannedBy__c=boothpersonal.id);
    insert boothSummary;
   
   List<QR_Attendee_BoothVisitSummary__c> jj = new List<QR_Attendee_BoothVisitSummary__c>();
   jj.add(boothSummary);
   
    
    
    
   List<QR_AttendeeSummary__c > dd = new List<QR_AttendeeSummary__c  >();
   dd.add(g);
   
   
   List<QR_AttendeeSummary__c > ff = new List<QR_AttendeeSummary__c  >();
   ff.add(atts2);
   
   List<List<QR_Attendee_BoothVisitSummary__c>> gr= new List<List<QR_Attendee_BoothVisitSummary__c>>();
   gr.add(jj);
   
   set<string> hh = new set<string>();
   
     hh.add(boothSummary.Attendee_BarCode1__c);
   
   
    set<string> ti = new set<string>();
    ti.add(boothSummary.Attendee_BarCode1__c); 
     system.debug('hiphani'+ hh);
    pageReference p = Page.Boothadmin_Attendeesph;
      Test.setCurrentPage (p);
      p.getParameters().put('EventID',t.id);
      
       System.runAs(u) {
        
      List<QR_Attendee_BoothVisitSummary__c>  vistSummarylist =[Select g.Attendee_ScannedBy__r.BoothAdmin_Id__c,g.Attendee_Designation__c, 
                                     g.Attendee_ScannedBy__r.Name,g.Name,  
                                     g.Attendee_ScannedBy__c,
                                     g.Attendee_ScannedBy__r.BoothPersonnel_FirstName__c,
                                     g.Attendee_NextFollowUpDate__c, 
                                     g.Attendee_BarCode1__c,
                                     g.Attendee_GatheredComments__c,
                                     g.Attendee_LeadCategory__c,g.Attendee_Company__c,
                                     g.Attendee_ScannedBy__r.BoothPersonnel_LastName__c,
                                     g.Attendee_PhoneNumber__c,g.Attendee_EmailId__c,
                                     g.Attendee_LastName__c,g.Attendee_FirstName__c 
                                    From QR_Attendee_BoothVisitSummary__c g
                                    where g.Attendee_ScannedBy__r.BoothAdmin_Id__r.BoothAdmin_EmailId__c = 'test123@noemail.com'];
        
        system.debug('value of listoF visitSummary'+vistSummarylist); 
       AttendeesController4 con = new AttendeesController4();
     con.loginUser = 'test123@noemail.com';
     con.getAllSuffix();
     con.Reportsaction();
     con.AttendeesAction();
     con.profileaction();
     con.Customeraction();
     con.EventAction();
     con.barcodeSet =hh;
     con.vistSummarylist =jj;
     con.attendeeList=dd;
     con.ListOfListVisitSummary =gr;
    
     
    //  AttendeesController4.innerclassfordisplayOdj  coninner1= new AttendeesController4.innerclassfordisplayOdj(boothSummary ,g);
      con.closePopup();
      con.closePopupph();
      con.closePopup2();
     
      
      con.eventName =boothSummary.id;
      system.debug('hi anu this is the value of atts'+ con.eventName);
       con.getEventDetails();
       con.boothAdminEvent =t;
       con.attendeeList=dd;
       con.exportToCSV();
       con.attendeeList=ff;
       con.objAttendees =g;
       con.getGender();
       con.searchstr ='testbooth';
       con.search();
       con.Help();
       con.CloseHelppopup();
       con.boothqrcodeAction();
     }
    }

 









}