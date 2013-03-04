public with sharing class AttendeeReportControllerph {

  
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

    
    public string eventName{get;set;}
    public String selEventName{get;set;}
    public String selReportType{get;set;}
    public QR_Report__c objAttendees{get;set;}
    
    public List<QR_AttendeeSummary__c > attendeeList{get;set;}
    public List<QR_AttendeeSummary__c> returnList{get;set;}
    public List<SelectOption> selEventNameList{get;set;}
    
    public Boolean displayPopUp{get;set;}
    public Boolean displayPopUpForAdd{get;set;}
    public List<QR_Report__c > reportsLst{get;set;}
    public string eventtitle{get;set;}
    public QR_BoothAdmin__c boothAdminEvent {get;set;}
   
    public AttendeeReportControllerph ()
    {
    getReportDetails();
    }

    
public static String loginUserId = UserInfo.getUserName();
    
    public void getReportDetails()
    {
        reportsLst = new List<QR_Report__c>();
  List<QR_Report__c> reportsList = new List<QR_Report__c>();
  
   system.debug('yyyyyyyyyyyyyyyyyyyy::'+userInfo.getUserName());
       
        reportsList = [Select g.SystemModstamp, g.OwnerId, g.Name, g.LastModifiedDate, g.LastModifiedById, g.LastActivityDate, 
                             g.IsDeleted, g.Id, g.QR_Report_Name__c, 
                             g.QR_Report_Description__c, g.QR_Eventadmin__c, 
                             g.QR_BoothAdmin__r.BoothAdmin_EmailId__c,
                              g.QR_BoothAdmin__r.Name, g.QR_BoothAdmin__c, 
                              g.CreatedDate, g.CreatedById From QR_Report__c g where 
                              g.QR_BoothAdmin__r.BoothAdmin_EmailId__c =: UserInfo.getUserName()];
        system.debug('reportsLst::'+reportsLst);
   
   for(QR_Report__c h:reportsList ){
   
    h.QR_Report_Description__c =escapeSpecialCharacters(h.QR_Report_Description__c);
   reportsLst.add(h); 
   
   }
    }
    
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
    
    public void closePopup() {        
        displayPopup = false;    
    } 
    
    public void closePopup1() {
        objAttendees = null;        
        displayPopUpForAdd = false;    
    }
    public void closePopup2()
    {
        reportDisplay= false;
    }
    public void closePopup3()
    {
        reportDisplay1= false;
    }
    public Boolean reportDisplay1{get;set;}
    
    
    public  List<List<innerclas>> listOfListInnerclass{get;set;}
    
    public String reporttype{get;set;}
    public void getEventDetails()
    {
        listOfListInnerclass = new List<List<innerclas>>();
        integer sizeOflist =0;
        
        searchtext ='hi';
        system.debug('reportDisplay'+reportDisplay);
        
        system.debug('Event Details Phani '+eventname);
        reporttype='';
        returnList = new List<QR_AttendeeSummary__c>();
        if(eventname != null && eventname !=''){
            String[] evntArrsy=eventname.split('~');
            eventname =evntArrsy[0];
            reporttype=evntArrsy[1];
        }
        
         List<QR_Attendee_BoothVisitSummary__c>  
            
          vistSummaryList=[Select g.Attendee_ScannedBy__r.BoothAdmin_Id__c, 
                                    g.Attendee_ScannedBy__r.Name, g.Attendee_ScannedBy__c, 
                                    g.Attendee_BarCode1__c,g.Attendee_Company__c,g.Attendee_PhoneNumber__c,g.Attendee_EmailId__c,
                                    g.Attendee_FirstName__c,g.Attendee_LastName__c,g.Attendee_NextFollowUpDate__c
                                    
                                     From QR_Attendee_BoothVisitSummary__c g
                                    where g.Attendee_ScannedBy__r.BoothAdmin_Id__r.Name =:eventname order by g.Attendee_LastName__c limit 2500];
                                    
       
        
        Set<string> barcodeSet= new Set<string>();
        for(QR_Attendee_BoothVisitSummary__c vistSummary:[Select g.Attendee_ScannedBy__r.BoothAdmin_Id__c, 
                                    g.Attendee_ScannedBy__r.Name, g.Attendee_ScannedBy__c, 
                                    g.Attendee_BarCode1__c From QR_Attendee_BoothVisitSummary__c g
                                    where g.Attendee_ScannedBy__r.BoothAdmin_Id__r.Name = :eventname order by g.Attendee_LastName__c  limit 2500]){
           
            barcodeSet.add(vistSummary.Attendee_BarCode1__c);
             
             system.debug('Hello phani garu'+barcodeSet);
        }
      
       
        if(reporttype!= null && reporttype.equals('Report By Geography') ){
            reportDisplay= true;
            
          if(barcodeSet != null && barcodeSet.size()>0)
        {
            
            map<string,QR_AttendeeSummary__c> getvaluesofmap = new map<string,QR_AttendeeSummary__c> ();
            
            for(QR_AttendeeSummary__c ggg:[Select g.Attendee_Barcode3__c,g.SystemModstamp, g.OwnerId, g.Name, g.LastModifiedDate, g.LastModifiedById, 
                          g.LastActivityDate, g.IsDeleted, g.Id, g.Event_Id__c, 
                          g.Attendee_WorkPhone__c, g.Attendee_WorkPOBox__c, 
                          g.Attendee_WorkAddress__c, g.Attendee_WebsiteURL__c,
                          g.Attendee_NewWorkState__c,g.Attendee_Workcity__c, 
                          g.Attendee_ThroughEventBrite__c, g.Attendee_Organization_City__c,
                          g.Attendee_Survey_Answers__c, g.Attendee_newSuffix__c, 
                          g.Attendee_ShippingPOBox__c, g.Attendee_ShippingAddress__c, 
                          g.Attendee_SecondaryBusinessCategory2__c, 
                          g.Attendee_PrimaryBusinessCategory1__c, g.Attendee_newPrefix__c, 
                          g.Attendee_NAICS_Code3__c, g.Attendee_NAICS_Code2__c, 
                          g.Attendee_NAICS_Code1__c, g.Attendee_LastName__c, 
                          g.Attendee_HomePhoneNumber__c, g.Attendee_HomeAddress__c, 
                          g.Attendee_Gender__c, g.Attendee_FirstName__c, 
                          g.Attendee_EmailId__c, g.Attendee_DiversityType1__c, 
                          g.Attendee_Designation__c, g.Attendee_Company__c, 
                          g.Attendee_CellPhoneNumber__c, g.Attendee_Business_NoOfEmployees__c, 
                          g.Attendee_Business_DnB_Id__c, g.Attendee_BusinessTaxId__c, 
                          g.Attendee_BusinessRevenue__c, g.Attendee_BusineesEstablished_Date1__c, 
                          g.New_Business_Description__c, g.Attendee_BlogURL__c, 
                          g.Attendee_BirthDate__c,  
                          g.Attendee_Age__c, g.CreatedDate, g.CreatedById
                          From QR_AttendeeSummary__c g where g.Attendee_Barcode3__c In : barcodeSet  ORDER BY g.Attendee_PrimaryBusinessCategory1__c DESC Nulls Last  limit 2500]){
                          
                          
                     getvaluesofmap.put(ggg.Attendee_Barcode3__c,ggg);     
                          
                          }
             system.debug('Hello Chadrasekhar garu'+attendeeList);
              listclas = new  List<innerclas>();
        
        for(QR_Attendee_BoothVisitSummary__c p:vistSummaryList){
        
        string phanigaru =p.Attendee_BarCode1__c;
        
        QR_AttendeeSummary__c  g=getvaluesofmap.get(phanigaru);
        
         p.Attendee_Company__c =escapeSpecialCharacters(p.Attendee_Company__c);
         p.Attendee_LastName__c=escapeSpecialCharacters(p.Attendee_LastName__c);
         p.Attendee_FirstName__c=escapeSpecialCharacters( p.Attendee_FirstName__c);
       
         listclas.add(new innerclas(g,p));
         if(sizeOflist==999){
        
         listOfListInnerclass.add(listclas);
         listclas = new List<innerclas>();
          sizeOflist =0;
          } sizeOflist++;  
        }
        if(sizeOflist !=0){
          listOfListInnerclass.add(listclas); 
          }
        }
        }
         else if (reporttype!= null && reporttype.equals('Report By Industry') ){
            reportDisplay1=true;
           
         if(barcodeSet != null && barcodeSet.size()>0)
        {
            
            map<string,QR_AttendeeSummary__c> getvaluesofmap = new map<string,QR_AttendeeSummary__c> ();
            
            for(QR_AttendeeSummary__c ggg:[Select g.Attendee_Barcode3__c,g.SystemModstamp, g.OwnerId, g.Name, g.LastModifiedDate, g.LastModifiedById, 
                          g.LastActivityDate, g.IsDeleted, g.Id, g.Event_Id__c, 
                          g.Attendee_WorkPhone__c, g.Attendee_WorkPOBox__c, 
                          g.Attendee_WorkAddress__c, g.Attendee_WebsiteURL__c,
                          g.Attendee_NewWorkState__c,g.Attendee_Workcity__c, 
                          g.Attendee_ThroughEventBrite__c, g.Attendee_Organization_City__c,
                          g.Attendee_Survey_Answers__c, g.Attendee_newSuffix__c, 
                          g.Attendee_ShippingPOBox__c, g.Attendee_ShippingAddress__c, 
                          g.Attendee_SecondaryBusinessCategory2__c, 
                          g.Attendee_PrimaryBusinessCategory1__c, g.Attendee_newPrefix__c, 
                          g.Attendee_NAICS_Code3__c, g.Attendee_NAICS_Code2__c, 
                          g.Attendee_NAICS_Code1__c, g.Attendee_LastName__c, 
                          g.Attendee_HomePhoneNumber__c, g.Attendee_HomeAddress__c, 
                          g.Attendee_Gender__c, g.Attendee_FirstName__c, 
                          g.Attendee_EmailId__c, g.Attendee_DiversityType1__c, 
                          g.Attendee_Designation__c, g.Attendee_Company__c, 
                          g.Attendee_CellPhoneNumber__c, g.Attendee_Business_NoOfEmployees__c, 
                          g.Attendee_Business_DnB_Id__c, g.Attendee_BusinessTaxId__c, 
                          g.Attendee_BusinessRevenue__c, g.Attendee_BusineesEstablished_Date1__c, 
                          g.New_Business_Description__c, g.Attendee_BlogURL__c, 
                          g.Attendee_BirthDate__c,  
                          g.Attendee_Age__c, g.CreatedDate, g.CreatedById
                          From QR_AttendeeSummary__c g where g.Attendee_Barcode3__c In : barcodeSet  ORDER BY g.Attendee_PrimaryBusinessCategory1__c DESC Nulls Last  limit 2500]){
                          
                          
                     getvaluesofmap.put(ggg.Attendee_Barcode3__c,ggg);     
                          
                          }
        
          system.debug('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh'+getvaluesofmap.keySet());
              listclas = new  List<innerclas>();
        
        for(QR_Attendee_BoothVisitSummary__c p:vistSummaryList){
        
        string phanigaru =p.Attendee_BarCode1__c;
        
        
        
        QR_AttendeeSummary__c  rrrr= new QR_AttendeeSummary__c();
         
         rrrr=getvaluesofmap.get(phanigaru);
      
      //system.debug('hhhhhhhhhhpppppp'+escapeSpecialCharacters(rrrr.Attendee_PrimaryBusinessCategory1__c));
       
       // rrrr.Attendee_PrimaryBusinessCategory1__c=escapeSpecialCharacters(rrrr.Attendee_PrimaryBusinessCategory1__c);
       
        p.Attendee_Company__c =escapeSpecialCharacters(p.Attendee_Company__c);
        p.Attendee_LastName__c=escapeSpecialCharacters(p.Attendee_LastName__c);
        p.Attendee_FirstName__c=escapeSpecialCharacters( p.Attendee_FirstName__c);
       
       
          
        listclas.add(new innerclas(rrrr,p));
        if(sizeOflist==999){
        
         listOfListInnerclass.add(listclas);
         listclas = new List<innerclas>();
          sizeOflist =0;
          } sizeOflist++;  
          }  if(sizeOflist !=0){
          listOfListInnerclass.add(listclas); 
          }
            
         
       
        }
        
        
        
        
        }
        
   
       
        
      
      
    }

public List<innerclas> listclas{get;set;}
 public class innerclas{
 
  public QR_AttendeeSummary__c  attsum{get;set;}
  public QR_Attendee_BoothVisitSummary__c  attvisitsum{get;set;}
 
 public innerclas(QR_AttendeeSummary__c   A,QR_Attendee_BoothVisitSummary__c V){
 this.attsum=A;
 this.attvisitsum=V;
 }
 
 
 }



    public Boolean reportDisplay{get;set;}
    
    public pageReference savePopupValues()
    {
         system.debug('5555555555555555555555555555555555555');
        displayPopUpForAdd=false;
        if(objAttendees.QR_Report_Description__c != null)
        {
           system.debug('objAttendees=========:::' +objAttendees.QR_Report_Description__c);
            upsert objAttendees;
            system.debug('44444444444444444444444444444444444444444444'+objAttendees);
        
        
        getReportDetails();
     /**   PageReference pageRef= new PageReference('/apex/QRcode_Boothadmin_Reportsph');
        pageRef.setredirect(false);
        return pageRef; **/
        }
        
        
        return null;
       
    }
    
   
    
    public void editAttendees()
    {   
        
        objAttendees= new QR_Report__c();
       // displayPopUpForAdd =true;
     
        for(QR_Report__c emEvent :reportsLst)
        {
            if(eventName!= null && eventName !='' && eventName.equals(emEvent.Id))
            {
             system.debug('phani=========:::' +emEvent);
                displayPopUpForAdd =true;
                objAttendees=emEvent;
                break;
            }
        }
    }
    
    

public string searchtext{get;set;}

        
   
   
   public boolean boolval{get;set;}
   
   
   
   public List<GroupedQuery> queryResults{get;set;}
    public List<GroupedQuery> queryResultsForGeography{get;set;}
   
   public List<GroupedQuery> getdata(){
   return queryResults;
}
   
 
 
  public List<GroupedQuery> getdataGeo(){
   return queryResultsForGeography;
}
 
        
        
   public class GroupedQuery
{
    public string GroupBy1{get;set;}
    public integer Count {get;set;}
   
    public string GroupBy2{get;set;}
    public integer Count1 {get;set;}
   
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
      
     QR_BoothAdmin__c z= [select id,BoothAdmin_EmailId__c,Name from QR_BoothAdmin__c where BoothAdmin_EmailId__c='test123@noemail.com'];
       
   
    
    
   
   QR_BoothPersonnel__c boothPersonal = new QR_BoothPersonnel__c(BoothAdmin_Id__c=z.id,BoothPersonnel_FirstName__c='firstName',BoothPersonnel_LastName__c='lastName',BoothPersonnel_EmailId__c='testBoothpersonal@gmail.com');
   insert boothPersonal;

   QR_BoothPersonnel__c f = [select name,id from QR_BoothPersonnel__c where id=:boothPersonal.id];
   
   
    QR_Attendee_BoothVisitSummary__c  boothSummary = new QR_Attendee_BoothVisitSummary__c(Attendee_FirstName__c='testboothadminfirstname',Attendee_LastName__c='testboothlastmname',Attendee_Company__c='testboothadminorganiname',Attendee_EmailId__c='test@globalnest.com',Attendee_BarCode1__c=g.Name,Attendee_ScannedBy__c=f.id);
     insert boothSummary;
   
     QR_Report__c report = new QR_Report__c(QR_Report_Name__c='Report By Industry',QR_Report_Description__c='hi',QR_BoothAdmin__c=t.id); 
     QR_Report__c report1 = new QR_Report__c(QR_Report_Name__c='Report By Geography',QR_Report_Description__c='hi',QR_BoothAdmin__c=t.id); 
      
       System.runAs(u) {
       
       
   QR_BoothAdmin__c rrrrrr= [select id,BoothAdmin_EmailId__c,Name from QR_BoothAdmin__c where BoothAdmin_EmailId__c=:userInfo.getUserName()];    
        system.debug('testttttttttttttttttttttt  '+rrrrrr);
       AttendeeReportControllerph con = new AttendeeReportControllerph();
     // con.loginUserId=u.id;
       con.Reportsaction();
       con.profileaction();
       con.Customeraction();
       con.EventAction();
      
       con.AttendeesAction();con.closePopup();con.closePopup1();con.closePopup2();con.closePopup3();
     con.eventname =z.Name+'~Report By Geography';
     // con.loginUserId='test123@noemail.com';
      con.getReportDetails(); 
     
     
     //con.reporttype ='Report By Geography';
     con.getEventDetails();
      con.eventname =z.Name+'~Report By Industry';
     con.getEventDetails();
    
     con.objAttendees =report;
     
    
    con.savePopupValues();
    
      con.objAttendees =report1;
     con.editAttendees();
    con.boothqrcodeAction();
     con.getdata();
     con.getdataGeo();
    con.escapeSpecialCharacters('phani"kumar<ch');
    con.Help();
    con.CloseHelppopup();
     
     }
    }



}