public with sharing class QRCode_EventReportCon {

// geography chart code start

public AggregateResult[] graphy{get;set;}

// inner class
/**
public list<geographyinner> grphy{get;set;}

public class geographyinner
{

public integer georecords{get;set;}
public string geogy{get;set;}

public geographyinner(AggregateResult ge)

{
          georecords= (integer)ge.get('expr0');
          geogy = (string)ge.get('Attendee_NewWorkState__c'); //       Attendee_PrimaryBusinessCategory1__c
}


}



public pagereference geochart()
{
      userId =UserInfo.getUserId();
     
      graphy = [select Attendee_NewWorkState__c,count(id) from QR_AttendeeSummary__c
      where Event_Id__r.Eventadmin_Id__r.User_ID__c=:userid
      group by Attendee_NewWorkState__c]; // 
    
      system.debug('hiiiiiiiiiii@@@@' +graphy );
     
     grphy= new list<geographyinner>();
     
     for ( AggregateResult ta : graphy ){
     
    // at.Event_Title__c = escapeSpecialCharacters(at.Event_Title__c);
     
     geographyinner es = new geographyinner(ta);
     grphy.add(es);
     
     }
     

return null;
}
*/

// geography chart code end


  
    public String escapeSpecialCharacters(String input){
       if(input!= null && input != '' && (input.contains('\\') )){
        input = input.replace('\\','\\\\');

      }
        if(input!= null && input != '' && (input.contains('"') )){
           input = input.replace('"','\\\"');
       
        }if(input!= null && input != '' && (input.contains('<') )){
        input = input.replace('<','');
         system.debug('llllllllllllllllllllll miru keka'+input);
        }
        
        if(input!= null && input != '' && (input.contains(',') )){
        input = input.replace(',','//,');
      }
       
    return input;
    
  }
    
 /**   
    public Pagereference checkUserId()
   {
   
       System.debug('RRRRRRRRRRRRRRRRRRRRRRRRRRRRRR'+UserInfo.getUserId());
      
    if(UserInfo.getUserId() == '00590000000zKNlAAM' || UserInfo.getUserId()==null)
    {
                              
       Pagereference pg = new Pagereference('/apex/QRcode_EventAdmin_signin?id=QRCode_extendsDataImport');
             Pg.setredirect(true);
             return pg;

       
    }else {
             return null;
        }
   
   }
    
   */

    Public PageReference ProfileSettings()
{
Pagereference pg = new Pagereference('/apex/Qrcode_EventAdmin_Profileupdate');
Pg.setredirect(true);
Return pg;
}



    public void BackAction() {
    IndustryReportBool = false;
    GeographyReportBool=false;
    pageReportBool=true;
   
    }


   public PageReference CustomerAdminAct() {
   Pagereference pg = new Pagereference('/apex/QRCode_Eventadmin_Boothadmin');
   pg.setRedirect(true);
   return pg;
  }

  public PageReference reportact() {
  Pagereference pg = new Pagereference('/apex/QRCode_EventReport');
  pg.setRedirect(true);
  return pg;
 }


  public PageReference Attendees() {
  Pagereference pg = new Pagereference('/apex/Qr_Booth_attendees');
  pg.setRedirect(true);
  return pg;
  }

  public PageReference Events() {
       Pagereference pg = new Pagereference('/apex/Qrcode_Eventadmin_homepage');
            pg.setRedirect(true);
              return pg;
       
    }
    
    //pagination start
   public String reporttype{get;set;}
   public Boolean nextbool{set; get;}
   public Boolean Previousbool{set; get;}
   public integer pgnumber{set; get;}
   public integer Total{set; get;}
   public integer totalpages{set; get;}
   private String sortDirection = 'ASC';
   private String sortExp = 'name';
   //public string eventname{get; set;}
  public list<QR_AttendeeSummary__c> customer {get;set;} 
  public list<list<QR_AttendeeSummary__c>> geographycus{get; set;}
  public list<QR_AttendeeSummary__c> query1{get;set;} 
  public String singleEvent{get; set;}
  public Boolean pageReportBool{get; set;}
  public Boolean StandReportBool{get; set;}
  public Boolean GeographyReportBool{get; set;}
  public Boolean CustomReportBool{get; set;}
  public Boolean IndustryReportBool{get; set;} 
    

    
    
    public Boolean geonextbool{set; get;}
    public Boolean geoPreviousbool{set; get;}
    public integer geopgnumber{set; get;}
    public integer geoTotal{set; get;}
    public integer geototalpages{set; get;}
    public LIST<QR_Event__c> QRevent{get; set;}
    public String SingleEv{get; set;}
  //  public QR_Eventadmin__c eventadminId{get; set;}
    public LIST<QR_AttendeeSummary__c> listattendees{get; set;}
    public LIST<QR_Report__c> reportTypes{get; set;}
   public QR_BoothAdmin__c EVReport {get;set;} 
    public LIST<QR_Report__c> StandRep{get; set;}
    public QR_Report__c EditRep{get; set;}
    public Boolean EditReportBool{get; set;}
    
    public ID userId{set; get;}
    public ID EventAdmin{get; set;}
   
   
   // Industry
   
 public LIST<QR_AttendeeSummary__c> cus12{get;set;} 
      public string eventName{get;set;}
      public Boolean displayPopUp{get;set;}
      
     public LIST<LIST<QR_AttendeeSummary__c>> customers{get;set;}
       public LIST<QR_AttendeeSummary__c> query{get;set;} 
 
    public QRCode_EventReportCon()
    {
  
    
       
    PageReportBool= TRUE;
    StandReportBool=FALSE;
    CustomReportBool=FALSE;
    GeographyReportBool=False;
    IndustryReportBool=FALSE;
    EditReportBool = FALSE;
    try{
    
        
        userId =UserInfo.getUserId();
       //   userID='005A0000002lFGd';
               
        system.debug('hiii aniiilllljiiiiiii'+userID);
    
  
        QRevent = new LIST<QR_Event__c>(); 
        reportTypes = new LIST<QR_Report__c>();
        
       EVReport = new QR_BoothAdmin__c(); 
        reportTypes =[Select QR_Report_Description__c, QR_Report_Name__c, createdDate FROM QR_Report__c WHERE QR_Eventadmin__r.User_ID__c =:Userid];
        
       
        System.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'+ reportTypes );
        
        for(QR_Event__c e: QRevent)
        {

                SingleEv = e.id ;   
        }
    
       
        System.debug('########################################'+ SingleEv );
        
        
        StandRep = new LIST<QR_Report__c>();
        
        StandRep = [select QR_Report_Name__c, QR_Report_Description__c, Createddate FROM QR_Report__c WHERE QR_Eventadmin__c =: SingleEv];
        
         System.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'+ standrep );
         
         
        listattendees = new LIST<QR_AttendeeSummary__c>();
       
        
        listattendees = [select id FROM QR_AttendeeSummary__c WHERE Event_Id__c =: singleEv ];

        
        System.debug('----------------------------------------'+ listattendees.size());
        
      
    }catch(Exception e){}    
         
    
    
    }
  
    public Void ReportType()
    {
        PageReportBool= TRUE;
        StandReportBool=FALSE;
        CustomReportBool=FALSE;
        GeographyReportBool=False;
        IndustryReportBool=FALSE;
        EditReportBool=FALSE;
    
    }

    public void Cancel()
    {
    
        EditReportBool=FALSE;
        StandReportBool=FALSE;
        CustomReportBool=FALSE;
        GeographyReportBool=False;
        IndustryReportBool=FALSE;
        EditReportBool=FALSE;
    
    }
    
  //string ReportName = UserId;
  public List<QR_AttendeeSummary__c> an{get;set;}
public string s {get;set;}

 public List<QR_AttendeeSummary__c> gn{get;set;}
public string t{get;set;}



    public void chooseReport()
    {
   
    system.debug('----------------------------eventname------------------'+eventname);
         PageReportBool=false;
  
       if(eventname !=null && eventname == 'Report By Industry')
       {
       system.debug('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr'+eventname);
        IndustryReportBool = TRUE;
       
        customers = new List<List<QR_AttendeeSummary__c>> ();
        integer recCount=0;
        
        query =  [select h.id,h.name,Event_Id__c,h.Attendee_Designation__c,
                         h.Attendee_PrimaryBusinessCategory__c,h.Attendee_NewWorkState__c,
                         h.Attendee_PrimaryBusinessCategory1__c,h.Attendee_WorkState__c,
                         h.Attendee_FirstName__c,h.Attendee_Organization_City__c,
                         h.Attendee_BusineesEstablished_Date1__c,h.Attendee_LastName__c,
                         h.Attendee_WorkPhone__c,h.Attendee_CellPhoneNumber__c,
                         h.Attendee_EmailId__c,h.Attendee_Company__c 
                         from QR_AttendeeSummary__c h  
                         WHERE  h.Event_Id__r.Eventadmin_Id__r.User_ID__c=:userid
                         ORDER BY Attendee_PrimaryBusinessCategory1__c DESC NULLS LAST];
                         
                         
                           
               system.debug('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'+query);            
          
             an=new List<QR_AttendeeSummary__c>();
       
      for(QR_AttendeeSummary__c s:query)
      
   {
   
    s.Attendee_FirstName__c = escapeSpecialCharacters(s.Attendee_FirstName__c);
  s.Attendee_LastName__c = escapeSpecialCharacters(s.Attendee_LastName__c);
  s.Attendee_CellPhoneNumber__c = escapeSpecialCharacters(s.Attendee_CellPhoneNumber__c);
  s.Attendee_EmailId__c = escapeSpecialCharacters(s.Attendee_EmailId__c);
  s.Attendee_Company__c = escapeSpecialCharacters(s.Attendee_Company__c);
   s.Attendee_Designation__c = escapeSpecialCharacters(s.Attendee_Designation__c);
   s.Attendee_PrimaryBusinessCategory1__c = escapeSpecialCharacters(s.Attendee_PrimaryBusinessCategory1__c);
   
       recCount++;
       an.add(s);
       if(recCount==1000){
       customers.add(an);
       an = new LIST<QR_AttendeeSummary__c>();
       recCount=0;
       }
      
  }
  if(recCount !=0)
  customers.add(an);
          
                
      }  
      else if(eventname !=null && eventname== 'Report By Geography')
       {
      
                // geochart();
              
                
                GeographyReportBool=TRUE;
               
                geographycus = new list<list<QR_AttendeeSummary__c>> ();
                integer recCount=0;
                
                
                
                query1=  [select h.id,h.name,Event_Id__c,h.Attendee_Designation__c,h.Attendee_PrimaryBusinessCategory__c,h.Attendee_NewWorkState__c,h.Attendee_PrimaryBusinessCategory1__c,h.Attendee_WorkState__c,h.Attendee_FirstName__c,h.Attendee_Organization_City__c,h.Attendee_BusineesEstablished_Date1__c,h.Attendee_LastName__c,h.Attendee_WorkPhone__c,h.Attendee_CellPhoneNumber__c,h.Attendee_EmailId__c,h.Attendee_Company__c from QR_AttendeeSummary__c h   WHERE  h.Event_Id__r.Eventadmin_Id__r.User_ID__c=:userid ORDER BY Attendee_NewWorkState__c DESC NULLS LAST];
                system.debug('jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj'+geographycus);
      
             gn = new List<QR_AttendeeSummary__c>();
       
      for(QR_AttendeeSummary__c t:query1)
  {
  
   t.Attendee_FirstName__c = escapeSpecialCharacters(t.Attendee_FirstName__c);
  t.Attendee_LastName__c = escapeSpecialCharacters(t.Attendee_LastName__c);
  t.Attendee_CellPhoneNumber__c = escapeSpecialCharacters(t.Attendee_CellPhoneNumber__c);
  t.Attendee_EmailId__c = escapeSpecialCharacters(t.Attendee_EmailId__c);
  t.Attendee_Company__c = escapeSpecialCharacters(t.Attendee_Company__c);
   t.Attendee_Designation__c = escapeSpecialCharacters(t.Attendee_Designation__c);
   t.Attendee_NewWorkState__c = escapeSpecialCharacters(t.Attendee_NewWorkState__c);
   
  
  
  
  
       recCount++;
       gn.add(t);
       if(recCount==1000){
       geographycus .add(gn);
       gn= new LIST<QR_AttendeeSummary__c>();
       recCount=0;
       }
      
  }
  
  if(recCount !=0)
  geographycus.add(gn);
        
       }
      
    }
    
    public void EditReport()
    {
        system.debug('----------------------------'+eventname);
        EditReportBool=TRUE;
        EditRep = new  QR_Report__c();
        editRep = [Select QR_Report_Description__c, QR_Report_Name__c, createdDate FROM QR_Report__c WHERE  id=: eventname];
    
    }
    
    
    public Pagereference UpdateReport()
    {
    
        editRep.QR_Report_Description__c = editRep.QR_Report_Description__c;
        editRep.QR_Report_Name__c =  editRep.QR_Report_Name__c;
    
        update  editRep;
        EditReportBool=FALSE;
        
         Pagereference pg = new Pagereference('/apex/QRCode_EventReport');
            pg.setRedirect(true);
            return pg; 
        
    
    }
    
    Public Boolean HelpPopUp{get;set;}
    Public void Help(){
    HelpPopUp = True;
    }
    Public Void CloseHelppopup(){
    HelpPopUp = false;
    }
   
    static testMethod void myUnitTest()
 {
        Profile w = [select id from profile where name='Standard User'];
 
        User u = new User(alias = 'test123', email='test123@noemail.com',
                 emailencodingkey='UTF-8',profileid = w.Id, lastname='Testing', languagelocalekey='en_US',
                  localesidkey='en_US',country='United States',
                  timezonesidkey='America/Los_Angeles', username='test123@noemail.com');
                  insert u;
                  
QR_Eventadmin__c  h = new QR_Eventadmin__c( EventAdmin_FirstName__c='testEvenfirstnametAdmin',
                                                         EventAdmin_LastName__c='testEvenLastname',EventAdmin_EmailId__c=u.Email,
                                               User_ID__c=u.Id);    
 insert h;
     
     QR_Event__c x = new QR_Event__c(Event_Title__c='testEvent',
                                               Event_HostingTimeZone__c='Eastern Time(USA)',
                                               End_Date__c=date.valueOf('2012-05-15 00:00:00'),
                                               Start_Date__c=date.valueOf('2012-05-11 00:00:00'),
                                               Eventadmin_Id__c=h.id);
     insert x;
     
QR_AttendeeSummary__c e = new QR_AttendeeSummary__c(Attendee_FirstName__c='testattendeesummaryfirstname',
                                                            Attendee_LastName__c='testattendeelastname',
                                                            Attendee_EmailId__c='test123@noemail.com',
                                                            Attendee_Company__c='testattendeecompany');
     
            insert e;          
            system.debug('hiiiiii'+e);  
            
QR_BoothAdmin__c t = new QR_BoothAdmin__c(BoothAdmin_FirstName__c='testboothadminfirstname',BoothAdmin_LastName__c='testboothlastmname',BoothAdmin_EmailId__c='test123@noemail.com',Event_Id__c=x.id);
            
QR_Report__c y = new QR_Report__c (QR_BoothAdmin__c=t.id, QR_Eventadmin__c=h.id); 
insert y;


pageReference p = Page.QRCode_EventReport;
Test.setCurrentPage(p);
p.getParameters().put('EditReport',y.id);
list<QR_Event__c> o = new list<QR_Event__c>();
o.add(x);    
 QRCode_EventReportCon a = new QRCode_EventReportCon();
         
         a.UserId=u.id;
         a.SingleEv = x.id ;
         a.QRevent=o;
          
         a.CustomerAdminAct();
         a.reportact();
         a.Attendees();
         a.Events();
          
          a.userId =u.id;
         a.BackAction();
          a.ProfileSettings();
         a.ReportType();
         a.cancel();
         
         a.choosereport();
         a.eventname='Report By Geography';
         a.eventname='Report By Industry';
         
         a.choosereport();
         //p.getParameters().put('EditReport','Report By Industry'); 
       
       a.escapeSpecialCharacters(a.SingleEv);
       a.SingleEv='sdasd"Sda<df';
       a.escapeSpecialCharacters(a.SingleEv);
       a.eventname=y.id;
        a.EditReport();
        //a.editRep=ev;
        //a.EditReport();
       a.UpdateReport();
       a.Help();
       a.CloseHelppopup();
   }
   
    
    
    
  

}