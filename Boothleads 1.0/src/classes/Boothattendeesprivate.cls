public with sharing class Boothattendeesprivate {

    //------------------------------------------------------
   public boolean emailalertforprofile{get;set;}
   public boolean TatianaRegtypes{get;set;}
   public boolean OtherthanTatianaRegtypes{get;set;}
   public boolean singledymo{get;set;}
    public boolean emailalert{get;set;}
    public boolean Ebool{get;set;}
    public boolean fbool{get;set;}
    public string selectedvalues{get;set;}
    public string EventReqString1{get;set;}
    public boolean dymo{get;set;}
    public Blob attendeeImage { get; set; }
    public Blob attendeeImageEdit{ get; set; }
    public string attendeeName{get;set;}
    public String attendeeNameAfterEdit{get;set;}   
    public Boolean updateAttendeeSettingBool{get; set;}
    Public String RegTypeList{get;set;}
    public boolean RegValu0{get;set;} 
     public boolean RegValu1{get;set;} 
      public boolean RegValu2{get;set;} 
      public boolean RegValu3{get;set;}
      public boolean RegValu4{get;set;}
      public boolean RegValu5{get;set;}
      public boolean RegValu6{get;set;}
      public boolean RegValu7{get;set;}
      public boolean RegValu8{get;set;}
      public boolean RegValu9{get;set;}
      public boolean RegValu10{get;set;}
      public boolean RegValu11{get;set;}
    public pagereference pdf{get;set;}
    public  Blob b  {get;set;}
    public string message{get;set;}
    Public String RegTypeValues{get;set;}
  
    public pagereference backaction() {
    
    
    pagereference pg = new pagereference('/apex/qr_booth_attendees');
        pg.setRedirect(true);
        return pg;
        
    }
    public List<selectoption> getfields()
      { 
          fbool=true;
          List<selectoption> Option = new List<selectoption>();
          Option.add(new selectoption('Select','Select'));
          Option.add(new selectoption('Dymo 30856(Single Label)','Dymo 30856(Single Label)'));
          Option.add(new selectoption('Avery 5392 Name badges','Avery 5392 Name badges'));
          Option.add(new selectoption('Avery 22806 easy peal square Badges','Avery 22806 easy peal square Badges'));
          return option;
       }  
        public void popup(){
        emailalertforprofile=false;
        
        Event1 = new QR_AttendeeSummary__c();
        
        if(eventname1 != '' && eventname1 != null)
        {
        EventReqStringBool =false;
             for(QR_AttendeeSummary__c emEvent1 :attendees1234)
        {
              if(eventname1!= null && eventname1!='' && eventname1.equals(emEvent1.Id))
              system.debug('###printbadge1###'+eventname1);
              
            {
                fbool= TRUE;
                Event1 = emEvent1;
                break;
                
            }
            
        }
        
  getfields();
  }
  else
  {
  EventReqString = 'Please select atleast one attendee to print';
              EventReqStringBool = TRUE;
  }
  
  }
  public void selectedprint()
   {
   
    system.debug('###printbadge1###'+eventname1);
    system.debug('----------------Selected Values before--------------'+selectedvalues);
 
   if(selectedvalues == 'Avery 5392 Name badges')
   {
   fbool=false;
   printbadge();
   addattendee1=true;
   }
   else if(selectedvalues == 'Avery 22806 easy peal square Badges')
   {
   fbool=false;
   PrintBadgeforthree();
   addattendee1=true;
   }
   else if(selectedvalues == 'Dymo 30856(Single Label)')
   {
   fbool=false;
   printbadge();
   dymo=true;
   }
   else
   {
   fbool=TRUE;
   EventReqString1 = 'Please Select a Template';
              EventReqStringBool = TRUE;
            
   }
   }


    
    public String escapeSpecialCharacters(String input){
        if(input!= null && input != '' && (input.contains('<') )){
        input = input.replace('<','');
         system.debug('llllllllllllllllllllll'+input);
        }
       if(input!= null && input != '' && (input.contains('\\') )){
        input = input.replace('\\','\\\\');
 
      } 
      if(input!= null && input != '' && (input.contains('"') )){
           input = input.replace('"','\\\"');
      } 
    
        if(input!= null && input != '' && (input.contains(',') )){
        input = input.replace(',','//,');
      }
    
    
 
  return input;
  }
    
    public Pagereference checkUserId()
   {
   
       System.debug('RRRRRRRRRRRRRRRRRRRRRRRRRRRRRR'+UserInfo.getUserId());
      
    if(UserInfo.getUserId() == '00590000000zKNlAAM' || UserInfo.getUserId()==null)
    {
                              
       Pagereference pg = new Pagereference('/apex/QRcode_EventAdmin_signin?id=Qr_Booth_attendees');
             Pg.setredirect(true);
             return pg;

       
    }else {
             return null;
        }
   
   }

 public PageReference Dashboardaction() {
     
     pagereference pg = new pagereference('/apex/QRDashboard');
     pg.setRedirect(true);
     return pg;
   
    }


public pagereference attendeedetail()
{
emailalertforprofile=false;
pagereference pg = new pagereference('/apex/QRCodeAttendeeDetail?id='+eventname1);
pg.setRedirect(true);
return pg;

}

    public PageReference ImportAttendee() {
    emailalertforprofile=false;
    EventReqStringBool=false;
    if(singleEvent ==null )
             {
              EventReqString = 'Please Create An Event';
              EventReqStringBool = TRUE;
            return  null;
             }
             else
             {
    Pagereference pg = new Pagereference('/apex/QRCode_extendsDataImport');
            pg.setRedirect(true);
            return pg;
            }
       
    }


      Public PageReference ProfileSettings()
{
 
Pagereference pg = new Pagereference('/apex/Qrcode_EventAdmin_Profileupdate');
Pg.setredirect(true);
Return pg;
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

public pagereference singledymobadge()
{
   
    try
    { 
     eventadmin=[select id from QR_Eventadmin__c where User_ID__c =: userid];
     eventid=[select id,Event_title__c from QR_Event__c where Eventadmin_Id__c =: eventadmin.id];
    
          attach=[select parentid,name from attachment where parentid =:eventid.id];
         logo=true;

    }catch(exception e)
    {
        logo=false;

    }
    singledymo=false;
    pagereference pg=page.qr_singledymo;
    return pg;
}

public List<QR_AttendeeSummary__c> checkedbadge{get;set;}
     public pagereference genpdf() {
    
     checkedbadge=[select id, Attendee_BadgePrint__c from QR_AttendeeSummary__c where id in:attid];
     for(QR_AttendeeSummary__c dd:checkedbadge)
    {

         dd.Attendee_BadgePrint__c=true;
         List<QR_AttendeeSummary__c> changed=new List<QR_AttendeeSummary__c>{};
         changed.add(dd);
         
         update changed;

    }
     
    if(selectedvalues=='Avery 5392 Name badges')
   {
   pagereference pg =page.qr5392private;
    return pg;
       
   }
   else if(selectedvalues=='Avery 22806 easy peal square Badges')
       {
       pagereference pf =page.qrcode_12labels;
 
    return pf;    
   }
 else
 if(selectedvalues=='Dymo 30856(Single Label)')
   {
   pagereference pg =page.qr_Dymolabel;
    return pg;
       
   }
  
    return null;
    
       
    }


  
    public Boolean displayPopUp{get;set;}
    Public Boolean Eventbookpopup{get; set;}
    Public Boolean Eventeditpopup{get; set;}
    public Boolean onclickback { get; set;}
    public Boolean addattendee{get; set;}
    public Boolean addattendee1{get; set;}
    public Boolean editAttendeeBool{get; set;}
    public Boolean foundHistoryBool{get; set;}
    public Boolean DataImportBool{get; set;}
    public Boolean duplicateAttendeeBool{get; set;}
    
    public Integer Naics1{get; set;}
    public Integer Naics2{get; set;}
    public Integer Naics3{get; set;}
    public Boolean EventReqStringbool{get; set;}
     public String EventReqString{get; set;}
    public List<id> attid{get;set;}
    public string eventname1{get;set;}
    public string strNamesmult{get;set;}
    public String singleEvent{get; set;}
    Public String Selected{get;set;}
    public String NAICS1Mod{get; set;}
    public String NAICS2Mod{get; set;}
    public String NAICS3Mod{get; set;} 
    public string eventName{get;set;}
    public string deventName{get;set;}
    public String ageMod{get; set;}
    public String FirstName{get; set;}
    public String LastName{get; set;}
    public String CompanyName{get; set;}
    public String EmailId{get; set;}
   // public String Prefix{get; set;}
   // public String sufix{get; set;}
    public String degignation{get; set;}
    public String CellPhone{get; set;}
    //public string age{get; set;}
    public String homePhone{get; set;}
    public String gender{get; set;}
    public String Bdate{get; set;}
    public String homeAddress{get; set;}
    public String pbcategory{get; set;}
    public String sbcategory{get; set;}
    public string noOfEmployees{get; set;}
    public String BEDate{get; set;}
    
    public string Brevenue{get; set;}
   // public String BTaxId{get; set;}
    public String BDnBId{get; set;}
    public String BwebSite{get; set;}
    public String BDescription{get; set;}
    public String wAddress{get; set;}
    public String WPhone{get; set;}
    public String WPOBox{get; set;}
    public String SAddress{get; set;}
    public String SPOBox{get; set;}
    public String SBlogURL{get; set;}
    public String Diversity{get; set;}
    public String wstate{get; set;}
    public String wcity{get; set;}
    public String wAdd2{get; set;}
    public String Scity{get; set;}
    public String Sstate{get; set;}
    Public String Homeaddress1{get;set;}
    Public String Homecity{get;set;}
    Public String Homestate{get;set;}
    public String HPOBox{get; set;}
    public String EditDate{get; set;}
    public String SAddress2{get; set;}
    public String duplicateAttendee {get; set;}
    
    public id userId{get; set;}
    
    public QR_Event__c selectevent{get; set;}
    public QR_Eventadmin__c eventadmin {get; set;} 
    public QR_AttendeeSummary__c newAttendee1 {get; set;}
    
    public QR_AttendeeSummary__c newAttendee  {get; set;}
    
    public QR_AttendeeSummary__c editAttend   {get; set;}
    public QR_AttendeeSummary__c event {get;set;}
     public QR_AttendeeSummary__c event1 {get;set;}
    public LIST<LIST<EventWrapper>> TotalAttendees{get; set;} 
    // For Data Import History -----------------------------By Mallik
    public LIST<QR_DataImport_SavePoint__c> ImportHistory{get; set;}
    
     
    public List<QR_AttendeeSummary__c> attendees12345{get;set;}
    public List<QR_AttendeeSummary__c> cus12 {get;set;}
    public List<QR_AttendeeSummary__c> attendees1234{get;set;}
    Public List<selectoption> SecBCat{get;set;}
    Public List<selectoption> options2{get;set;}
    public LIST<QR_Event__c> allselectedevent{get; set;}
//-------------------------Inner Class---------------------------------------------------------------------
  public class EventWrapper
{
     public QR_AttendeeSummary__c atnd{get;set;}
     public string z{get;set;} 
     public string status{get;set;}
     public string hover{get;set;}
     public Eventwrapper(QR_AttendeeSummary__c atnd)
     {
      this.atnd =atnd;
      if(atnd.Attendee_BadgePrint__c==true){
      this.z='background-color:#e2e2e2;"';
      this.hover='Already Printed';
      this.status='Printed';
      }
      else
      {
      this.status='Not Printed';
      }
         
      }
}
//--------------------------END OF INNER-----------------------------------------------------------------

   public void printbadge1()
   
        {
            
              Event1 = new QR_AttendeeSummary__c();
        
        
             for(QR_AttendeeSummary__c emEvent1 :attendees1234)
        {
              if(eventname1!= null && eventname1!='' && eventname1.equals(emEvent1.Id))
              system.debug('###printbadge1###'+eventname1);
              
            {
                addattendee1 = TRUE;
                Event1 = emEvent1;
                break;
                
            }
            
        }
        
    }
//  public QR_Eventadmin__c eventadmin {get; set;}
public QR_Event__c eventid{get;set;}
public LIST<LIST<QR_AttendeeSummary__c>> LeftValues{get; set;}
public LIST<LIST<QR_AttendeeSummary__c>> RightValues{get; set;} 
public LIST<LIST<QR_AttendeeSummary__c>> MiddleValues{get; set;}
public List<QR_AttendeeSummary__c> str{get;set;}
public List<QR_AttendeeSummary__c> newstr1{get;set;}
public List<QR_AttendeeSummary__c> newstr2{get;set;}
public List<QR_AttendeeSummary__c> newstr{get;set;} 
public List<QR_AttendeeSummary__c> attendeeslist{get;set;}
public LIST<selectoption> states{get; set;}
public attachment attach{get;set;}
public boolean logo{get;set;}


   
 public void PrintBadgeforthree()
    
    {
    
    
    fbool=false;
    EventReqStringBool =false;
        if(TotalAttendees.size()>0)
        {
        system.debug('***printBadge***'+eventname1);
        if(eventname1 != '')
        {
         EventReqStringBool = false;
        List<string> listeventname=eventname1.split(',');
        attid=new List<id>();
        for(string  aa: listeventname)
        {
        attid.add((id)aa);
        system.debug('aaaannnnnnnn'+aa);
        }
        attendeeslist=new List<QR_AttendeeSummary__c>();
        attendeeslist=[select id,name,Attendee_FirstName__c,Attendee_BadgePrint__c,Attendee_status__c ,Attendee_LastName__c,Attendee_Barcode3__c,
        Attendee_Company__c,Attendee_EmailId__c,Attendee_newPrefix__c FROM QR_AttendeeSummary__c where id in:attid ORDER By Attendee_LastName__c ASC];
        
        
        newstr=new List<QR_AttendeeSummary__c>();
        newstr1=new List<QR_AttendeeSummary__c>();
        newstr2=new List<QR_AttendeeSummary__c>();      
      integer i=0;
     for(QR_AttendeeSummary__c eww: attendeeslist)
    {
      if(math.mod(i,3)==0)
      {
         newstr.add(eww);
      }
      else
      if(math.mod(i,3)==1)
      {
        newstr1.add(eww);
      }
      else
      if(math.mod(i,3)==2)
      {
        newstr2.add(eww);
      }
       i++;
    }
    
    
     LIST<QR_AttendeeSummary__c> FLRec = new LIST<QR_AttendeeSummary__c>();
     LeftValues = new LIST<LIST<QR_AttendeeSummary__c>>();
     integer Lpagecount=0;
    for(QR_AttendeeSummary__c l: newstr)
    {
    
        FLRec.add(l);
        Lpagecount++;
     if(Lpagecount==4)
     {
        LeftValues.add(FLRec);
        Lpagecount=0;
        FLRec = new LIST<QR_AttendeeSummary__c>();
     }
    }
      if(FLRec.size() != 0)
      {
        
       LeftValues.add(FLRec);
      }


      LIST<QR_AttendeeSummary__c> MLRec = new LIST<QR_AttendeeSummary__c>();
     MiddleValues = new LIST<LIST<QR_AttendeeSummary__c>>();
     integer Middlecount=0;
    for(QR_AttendeeSummary__c l: newstr1)
    {
    
        MLRec.add(l);
        Middlecount++;
     if(Middlecount==4)
     {
        MiddleValues.add(MLRec);
        Middlecount=0;
        MLRec = new LIST<QR_AttendeeSummary__c>();
     }
    }
      if(MLRec.size() != 0)
      {
        
       MiddleValues.add(MLRec);
      }






      LIST<QR_AttendeeSummary__c> SLRec = new LIST<QR_AttendeeSummary__c>();
      RightValues = new LIST<LIST<QR_AttendeeSummary__c>>();
      integer Rpagecount=0;
     for(QR_AttendeeSummary__c l: newstr2)
    {
    
        SLRec.add(l);
        Rpagecount++;
        if(Rpagecount==4)
      {
        RightValues.add(SLRec);
        Rpagecount=0;
        SLRec = new LIST<QR_AttendeeSummary__c>();
      }
    
    }
     if(SLRec.size() != 0)
        {
            RightValues.add(SLRec);
        }
   system.debug('leftttttttttttttttttt'+RightValues);
   try
    { 
     eventadmin=[select id from QR_Eventadmin__c where User_ID__c =: userid];
     eventid=[select id,Event_title__c from QR_Event__c where Eventadmin_Id__c =: eventadmin.id];
    
          attach=[select parentid,name from attachment where parentid =:eventid.id];
         logo=true;

    }catch(exception e)
    {
        logo=false;

    }
        addattendee1 = TRUE;
        event1= new QR_AttendeeSummary__c();
        printbadge1();
        }
        else
        {
        //ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Please select atleast one checkbox'));
        EventReqString = 'Please Select atleast one Attendee';
              EventReqStringBool = TRUE;
        
        }
        }
        
        else
        if(TotalAttendees.size()<=0)
        {
        EventReqString = 'Please create an Attendee';
              EventReqStringBool = TRUE;
        }
     }


   
   
   
    public void PrintBadge()
    
    {
    EventReqStringBool =false;
        if(TotalAttendees.size()>0)
        {
        system.debug('***printBadge***'+eventname1);
        if(eventname1 != '')
        {
         EventReqStringBool = false;
        List<string> listeventname=eventname1.split(',');
        attid=new List<id>();
        for(string  aa: listeventname)
        {
        attid.add((id)aa);
        system.debug('aaaannnnnnnn'+aa);
        }
        attendeeslist=new List<QR_AttendeeSummary__c>();
        attendeeslist=[select id,name,Attendee_FirstName__c,Attendee_BadgePrint__c,Attendee_status__c ,
                              Attendee_LastName__c,Attendee_Barcode3__c,Attendee_registration_type__c,Event_Id__c,
                              Attendee_Company__c,Attendee_EmailId__c,Attendee_Designation__c,Event_Id__r.Event_Title__c 
                              FROM QR_AttendeeSummary__c where id in:attid ORDER By Attendee_LastName__c ASC];
        system.debug('anilllllllllllllllllllllllll'+attendeeslist);
         try
    {
          attach=[select parentid,name from attachment where parentid =:singleevent];
         logo=true;

    }catch(exception e)
    {
        logo=false;

    }
        newstr=new List<QR_AttendeeSummary__c>();
        newstr1=new List<QR_AttendeeSummary__c>();
               
      integer i=0;
     for(QR_AttendeeSummary__c eww: attendeeslist)
    {
      if(math.mod(i,2)==0)
      {
         newstr.add(eww);
      }
      else
      {
        newstr1.add(eww);
      }
       i++;
    }
    
    
     LIST<QR_AttendeeSummary__c> FLRec = new LIST<QR_AttendeeSummary__c>();
     LeftValues = new LIST<LIST<QR_AttendeeSummary__c>>();
     integer Lpagecount=0;
    for(QR_AttendeeSummary__c l: newstr)
    {
    
        FLRec.add(l);
        Lpagecount++;
     if(Lpagecount==3)
     {
        LeftValues.add(FLRec);
        Lpagecount=0;
        FLRec = new LIST<QR_AttendeeSummary__c>();
     }
    }
      if(FLRec.size() != 0)
      {
        
       LeftValues.add(FLRec);
      }
system.debug('leftttttttttttttttttt'+LeftValues);
      LIST<QR_AttendeeSummary__c> SLRec = new LIST<QR_AttendeeSummary__c>();
      RightValues = new LIST<LIST<QR_AttendeeSummary__c>>();
      integer Rpagecount=0;
     for(QR_AttendeeSummary__c l: newstr1)
    {
    
        SLRec.add(l);
        Rpagecount++;
        if(Rpagecount==3)
      {
        RightValues.add(SLRec);
        Rpagecount=0;
        SLRec = new LIST<QR_AttendeeSummary__c>();
      }
    
    }
     if(SLRec.size() != 0)
        {
            RightValues.add(SLRec);
        }
   system.debug('leftttttttttttttttttt'+RightValues);

    
    
        addattendee1 = TRUE;
        event1= new QR_AttendeeSummary__c();
        printbadge1();
        }
        else
        {
        //ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Please select atleast one checkbox'));
        EventReqString = 'Please Select atleast one Attendee';
              EventReqStringBool = TRUE;
        
        }
        }
        
        else
        if(TotalAttendees.size()<=0)
        {
        EventReqString = 'Please create an Attendee';
              EventReqStringBool = TRUE;
        }
     }

       public List<selectoption> getselect()
    {
        List<selectoption> Option = new List<selectoption>();
        Option.add(new selectoption('Male','Male'));
        Option.add(new selectoption('Female','Female'));
        return option;
    }

  

    public PageReference deleteAdminRecord() {
    EventReqStringBool =false;
        system.debug('hiiiiiikkkkkkkkkk11111111');
        attendees12345 = [select h.id from QR_AttendeeSummary__c h WHERE id=:eventName1 ];
        system.debug('hiiiiiikkkkkkkkkk'+attendees12345 );
    if ( attendees12345 != null)
    {
    delete  attendees12345;
    getvalues();
    }
    
         pageReference pg = new pagereference('/apex/Qr_Booth_attendees');
         pg.setRedirect(true);
         return pg;
    }

      
    public void getEventDetails()
    {
        system.debug('eventName1::::'+eventName);
        cus12= new List<QR_AttendeeSummary__c>();
        
        for(QR_AttendeeSummary__c emEvent :cus12)
        {
            if(eventName1!= null && eventName1 !='' && eventName1.equals(emEvent.Id))
            {
                displayPopUp= true;
                cus12.add(emEvent);
                break;
            }
            
        }
        
        //return null;
    }
   
   public List<Eventwrapper> ew{get;set;}
   public void getvalues()
   
   {
   EventReqStringBool =false;
   
 //userId ='005A0000002lFGd';
 userid = UserInfo.getUserId();
 

  TotalAttendees = new LIST<LIST<EventWrapper>>();
  integer recCount=0;
  
   attendees1234 = [select id,name,Attendee_FirstName__c,Attendee_status__c ,Attendee_LastName__c,Attendee_Company__c,Attendee_registration_type__c,
                           Attendee_EmailId__c,Attendee_CellPhoneNumber__c,Attendee_BadgePrint__c,Attendee_Barcode3__c,Attendee_Designation__c,
                            (select parentid,name from attachments)
                            FROM QR_AttendeeSummary__c WHERE  Event_Id__r.Eventadmin_Id__r.User_ID__c=:userid
                                                                           order by  Createddate];
        
  
 
  
   ew=new List<eventwrapper>();
    for(QR_AttendeeSummary__c s:attendees1234)
  {      
  
  s.Attendee_FirstName__c = escapeSpecialCharacters(s.Attendee_FirstName__c);
  s.Attendee_LastName__c = escapeSpecialCharacters(s.Attendee_LastName__c);
  s.Attendee_CellPhoneNumber__c = escapeSpecialCharacters(s.Attendee_CellPhoneNumber__c);
  s.Attendee_EmailId__c = escapeSpecialCharacters(s.Attendee_EmailId__c);
  s.Attendee_Company__c = escapeSpecialCharacters(s.Attendee_Company__c);
   s.Attendee_registration_type__c = escapeSpecialCharacters(s.Attendee_registration_type__c);
       recCount++;
       ew.add(new eventwrapper(s));
       if(recCount==1000){
       TotalAttendees.add(ew);
       ew = new LIST<EventWrapper>();
       recCount=0;
       }
      
  }
  if(recCount !=0)
  TotalAttendees.add(ew);
  
  
system.debug(';;;;;;;;;;;;;;;;;;;;;;;;;'+ew); 

   }
   
  
  public string s{get;set;} 
   public Boothattendeesprivate ()
   {
   
  // serarchstringvalue='Search with first name';
   string uname=userinfo.getUserName();
   system.debug('--------------------------------------------------'+uname);
   if(uname == 'tparedes@gnemsdc.org' || uname== 'arzun2009@gmail.com')
   {
   system.debug('--------------------------------------------------');
   TatianaRegtypes=true;
   system.debug('--------------------------------------------------'+TatianaRegtypes);
   }
   else{
   OtherthanTatianaRegtypes=true;
   }
   
   if(ApexPages.CurrentPage().getParameters().get('multipleIds') != null)
            {
                deventname= ApexPages.CurrentPage().getParameters().get('multipleIds');
            }
              system.debug('eventName1: consttuctor:::'+deventName);
              
          
      getvalues();
      
         eventadmin = new  QR_Eventadmin__c();
         allselectedevent = new LIST<QR_Event__c>();
         
         try {
        
         eventadmin = [Select id, EventAdmin_FirstName__c, EventAdmin_LastName__c,EventHostingOrganization_Id__c FROM QR_Eventadmin__c WHERE User_ID__c =: userId];  
          
       } catch(exception e){}
        
        
         allselectedevent = [select id,Name,Eventadmin_Id__c, Event_Title__c FROM QR_Event__c WHERE Eventadmin_Id__c =: eventadmin.id];
         id Sid;
         system.debug('hiiii this for test '+allselectedevent);
         for(QR_Event__c q: allselectedevent )
         {
             sid=q.id;
             EventName = q.Event_Title__c;
         
         }
         
        singleEvent = sid;
      
        options2 = new List<selectoption>();
        Options2.add(new SelectOption('None','--None--')); 
        options2.add(new SelectOption('Business & Consumer Services','Business & Consumer Services'));
        options2.add(new SelectOption('Energy & Utilities','Energy & Utilities'));
        options2.add(new SelectOption('Financial Services','Financial Services'));
        options2.add(new SelectOption('Government, Education & Public Services','Government, Education & Public Services'));
        options2.add(new SelectOption('Healthcare, Pharmaceuticals and Biotech','Healthcare, Pharmaceuticals and Biotech'));
        options2.add(new SelectOption('Manufacturing','Manufacturing'));
        options2.add(new SelectOption('Media, Entertainment & Leisure','Media, Entertainment & Leisure'));
        options2.add(new SelectOption('Retail, Wholesale & Distribution','Retail, Wholesale & Distribution'));
        options2.add(new SelectOption('Software & Internet','Software & Internet'));
        options2.add(new SelectOption('Telecommunications ','Telecommunications'));
          
        SecBcat = new List<selectoption>();  
        SecBcat.add(new SelectOption('None','--None--')); 
        SecBcat.add(new SelectOption('Certified Minority Business Enterprise (MBE)','Certified Minority Business Enterprise (MBE)'));
        SecBcat.add(new SelectOption('Disadvantaged Business Enterprise(DBE)','Disadvantaged Business Enterprise(DBE)'));
        SecBcat.add(new SelectOption('Service Disabled Veteran Owned','Service Disabled Veteran Owned'));
        SecBcat.add(new SelectOption('Native Indian Tribe','Native Indian Tribe'));
        SecBcat.add(new SelectOption('Veteran Owned','Veteran Owned'));
        SecBcat.add(new SelectOption('Woman Owned Business (Enterprise WBE)','Woman Owned Business (Enterprise WBE)'));
        SecBcat.add(new SelectOption('HUB Zone (SBA Certified)','HUB Zone (SBA Certified)'));
        SecBcat.add(new SelectOption('8a Certified ','8a Certified '));
        
        
        
        states = new LIST<selectoption>();
        states.add(new SelectOption('None','--None--'));
        states.add(new SelectOption('AL','Alabama'));
        states.add(new SelectOption('AK', 'Alaska'));
        states.add(new SelectOption('AZ','Arizona'));
        states.add(new SelectOption('AR','Arkansas'));
        states.add(new SelectOption('CA','California'));
        states.add(new SelectOption('CO','Colorado'));
        states.add(new SelectOption('CT','Connecticut'));
        states.add(new SelectOption('DE','Delaware'));
        states.add(new SelectOption('DC','District of Columbia'));
        states.add(new SelectOption('FL','Florida'));
        states.add(new SelectOption('GA','Georgia'));
        states.add(new SelectOption('HI','Hawaii'));
        states.add(new SelectOption('ID','Idaho'));
        states.add(new SelectOption('IL','Illinois'));
        states.add(new SelectOption('IN','Indiana'));
        states.add(new SelectOption('IA','Iowa'));
        states.add(new SelectOption('KS','Kansas'));
        states.add(new SelectOption('KY','Kentucky'));
        states.add(new SelectOption('LA','Louisiana'));
        states.add(new SelectOption('ME','Maine'));
        states.add(new SelectOption('MD','Maryland'));
        states.add(new SelectOption('MA','Massachusetts'));
        states.add(new SelectOption('MI','Michigan'));
        states.add(new SelectOption('MN','Minnesota'));
        states.add(new SelectOption('MS','Mississippi'));
        states.add(new SelectOption('MO','Missouri'));
        states.add(new SelectOption('MT','Montana'));
        states.add(new SelectOption('NE','Nebraska'));
        states.add(new SelectOption('NV','Nevada'));
        states.add(new SelectOption('NH','New Hampshire'));
        states.add(new SelectOption('NJ','New Jersey'));
        states.add(new SelectOption('NM','New Mexico'));
        states.add(new SelectOption('NY','New York'));
        states.add(new SelectOption('NC','North Carolina'));
        states.add(new SelectOption('ND','North Dakota'));
        states.add(new SelectOption('OH','Ohio'));
        states.add(new SelectOption('OK','Oklahoma'));
        states.add(new SelectOption('OR','Oregon'));
        states.add(new SelectOption('PA','Pennsylvania'));
        states.add(new SelectOption('RI','Rhode Island'));
        states.add(new SelectOption('SC','South Carolina'));
        states.add(new SelectOption('SD','South Dakota'));
        states.add(new SelectOption('TN','Tennessee'));
        states.add(new SelectOption('TX','Texas'));
        states.add(new SelectOption('UT','Utah'));
        states.add(new SelectOption('VT','Vermont'));
        states.add(new SelectOption('VA','Virginia'));
        states.add(new SelectOption('WA','Washington'));
        states.add(new SelectOption('WV','West Virginia'));
        states.add(new SelectOption('WI','Wisconsin'));
        states.add(new SelectOption('WY','Wyoming'));
        
            
        
        
   
        //editAttendee();
      
        // Code For Data Import History---------------------------By Mallik
        integer foundHistory =0;
        foundHistory = [select count() FROM QR_DataImport_SavePoint__c WHERE QR_Eventadmin__r.User_ID__c =: userInfo.getUserId() ];
        
        if(foundHistory > 0)
            foundHistoryBool = TRUE;
            else foundHistoryBool = FALSE;
        AttendeeSetting();
        updateAttendeeSettingBool = FALSE;
   
   }
   
     public String eventIdVar{get;set;}
     public list<QR_AttendeeSummary__c> event1234{get;set;}
     public string[] editdiversity{get;set;}
//---------------------------------------------------------------------------------------------EDIT ATTENDEE--------
     public void editAttendee()
    {
    
    try{
     Attachment  att = new Attachment ();
     att =[select id, parentId from Attachment where parentId=:eventName1 limit 1];
     eventIdVar =att.Id; 
     }catch(exception e){}
       system.debug('eventName::::'+eventName1);
        Event = new QR_AttendeeSummary__c ();
        event1234=new list<QR_AttendeeSummary__c>();
 
        event1234= [select id,name,Attendee_FirstName__c,Attendee_status__c ,Attendee_LastName__c,Attendee_Company__c,Attendee_registration_type__c,
                                Attendee_EmailId__c,Attendee_CellPhoneNumber__c,Attendee_BadgePrint__c,Attendee_BusineesEstablished_Date1__c,
                                Attendee_newPrefix__c,Attendee_newSuffix__c,Attendee_Gender__c, Attendee_Designation__c,
                                 Attendee_Age__c, Attendee_HomePhoneNumber__c,  Attendee_BirthDate__c, 
                                 Attendee_HomeAddress__c, New_Business_Description__c, 
                                  Attendee_Business_DnB_Id__c, Attendee_Business_NoOfEmployees__c, Attendee_NewBusinessRevenue__c,
                                   Attendee_BusinessTaxId__c, Attendee_PrimaryBusinessCategory1__c, Attendee_SecondaryBusinessCategory2__c, 
                                   Attendee_WebsiteURL__c, Attendee_ShippingAddress__c,Attendee_ShippingAddress2__c, Attendee_ShippingPOBox__c,
                                    Attendee_BlogURL__c, Attendee_WorkAddress__c, Attendee_WorkPhone__c, Attendee_WorkPOBox__c, 
                                    Attendee_DiversityType1__c, Attendee_NAICS_Code1__c, Attendee_NAICS_Code2__c,Attendee_NAICS_Code3__c,
                                    Attendee_shippingCity__c,Attendee_NewshippingState__c ,
                                    Attendee_WorkAddress1__c,Attendee_Workcity__c,
                                    Attendee_newWorkState__c,Attendee_HomeAddress1__c,
                                    Attendee_HomeCity__c ,Attendee_HomePOBox__c,
                                    Attendee_NewHomeState__c FROM QR_AttendeeSummary__c WHERE id=:eventName1];
    for(QR_AttendeeSummary__c emEvent1 :event1234)
        {
            if(eventName1!= null && eventName1 !='' && eventName1.equals(emEvent1.Id))
            {
                EventReqStringBool=false;
                EventEditpopup= TRUE;
                Event = emEvent1;
                break;
                
            }
            
        }
        
         if(Event.Attendee_Gender__c =='Male')
        {
            Selected= 'TRUE';
        }ELSE
        {
            selected = 'FALSE';
        }
        
        
        System.debug('AGEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE'+ Event.Attendee_age__c );
        ageMod = String.valueOf(Event.Attendee_age__c);
        if(Event.Attendee_age__c != null)
        {
            if(ageMod != '0.0')
            {
                if(ageMod.contains('.0'))
                {
                   ageMod.replaceAll('.0', '');
               }
            }else
            {
                ageMod = '';
            }
        }
        
        
        if(Event.Attendee_NAICS_Code1__c > 10)
        {
            NAICS1Mod = String.valueOf(Event.Attendee_NAICS_Code1__c);
            if(NAICS1Mod.contains('\''))
            {
                NAICS1MOd=NAICS1Mod.replaceAll('\'','');                    
            }
        }
        
        if(Event.Attendee_NAICS_Code2__c > 10)
        {
            NAICS2Mod = String.valueOf(Event.Attendee_NAICS_Code2__c);
            if(NAICS2Mod.contains('\''))
            {
                NAICS2MOd=NAICS2Mod.replaceAll('\'','');                    
            }
        }
        
        
        if(Event.Attendee_NAICS_Code3__c > 10)
        {
            NAICS3Mod = String.valueOf(Event.Attendee_NAICS_Code3__c);
            if(NAICS3Mod.contains('\''))
            {
                NAICS3MOd=NAICS3Mod.replaceAll('\'','');                    
            }
        }
         
         system.debug('THis is my thumbbbbbbbbbb'+ Event.Attendee_registration_type__c );
        if(TatianaRegTypes == true){
        if(Event.Attendee_registration_type__c != NULL)
        { 
         
             if(Event.Attendee_registration_type__c.toLowerCase().contains('full conference'))
             {
             RegValu0=true;
             }
            
           // system.debug('444444444444444444444     '+  Event.Attendee_registration_type__c.toLowerCase().contains('wednesday only'));
            
             if(Event.Attendee_registration_type__c.toLowerCase().contains('wednesday only'))
             {
             RegValu1=true;
             }
           ///  system.debug('444444444444444444444     '+  Event.Attendee_registration_type__c.toLowerCase().contains('Wednesday Only'));
             if(Event.Attendee_registration_type__c.toLowerCase().contains('thursday only'))
             {
             RegValu2=true;
             }
             if(Event.Attendee_registration_type__c.toLowerCase().contains('friday only'))
             {
             RegValu3=true;
             }
             if(Event.Attendee_registration_type__c.toLowerCase().contains('trade expo only'))
             {
             RegValu4=true;
             }
             if(Event.Attendee_registration_type__c.toLowerCase().contains('thursday & friday only'))
             {
             RegValu5=true;
             }
             if(Event.Attendee_registration_type__c.toLowerCase().contains('wednesday & thursday only'))
             {
             RegValu6=true;
             }
             if(Event.Attendee_registration_type__c.toLowerCase().contains('shining star & friday only'))
             {
             RegValu7=true;
             }
         }
         }
         else if(otherthantatianaregtypes == true){
         if(Event.Attendee_registration_type__c != NULL)
        { 
         
             if(Event.Attendee_registration_type__c.toLowerCase().contains('full conference'))
             {
             RegValu8=true;
             }
           
         
             if(Event.Attendee_registration_type__c.toLowerCase().contains('reception'))
             {
             RegValu9=true;
             }
              if(Event.Attendee_registration_type__c.toLowerCase().contains('monday pass'))
            {
            RegValu11=true;
            }
         
             if(Event.Attendee_registration_type__c.toLowerCase().contains('tuesday pass'))
             {
             RegValu10=true;
             }
         
         }
        } 
         
         
        EditDate =String.valueOf(Event.Attendee_BirthDate__c); 
        BEDate=String.valueOf(Event.Attendee_BusineesEstablished_Date1__c);
        
      
        //return null;
        
    }
   
   
   
   
    public Pagereference UpdateAttendee()
    {
        
        try{
        Event.Attendee_FirstName__c=Event.Attendee_FirstName__c;
        Event.Attendee_LastName__c=Event.Attendee_LastName__c;
        Event.Attendee_Company__c=Event.Attendee_Company__c;
        Event.Attendee_EmailId__c=Event.Attendee_EmailId__c;
        Event.Attendee_newPrefix__c =Event.Attendee_newPrefix__c ;
        Event.Attendee_newSuffix__c =Event.Attendee_newSuffix__c ;
        Event.Attendee_Designation__c =Event.Attendee_Designation__c ;
        Event.Attendee_CellPhoneNumber__c =Event.Attendee_CellPhoneNumber__c ;
        
        try{
        Event.Attendee_Age__c =Integer.valueOf(ageMod);
        } catch(Exception e)
        {
            Event.Attendee_Age__c = null;
        }
        
        Event.Attendee_HomePhoneNumber__c =Event.Attendee_HomePhoneNumber__c ;
        Event.Attendee_Gender__c =Event.Attendee_Gender__c;
       // editAttend.Attendee_BirthDate__c =datepic(EditDate);
        Event.Attendee_BirthDate__c = Event.Attendee_BirthDate__c;
        Event.Attendee_HomeAddress__c =Event.Attendee_HomeAddress__c ;
        Event.New_Business_Description__c =Event.New_Business_Description__c ;
      // editAttend.Attendee_BusineesEstablished_Date1__c =datepic(BEDate);
        
        
        Event.Attendee_BusineesEstablished_Date1__c =Event.Attendee_BusineesEstablished_Date1__c;
        Event.Attendee_Business_DnB_Id__c =Event.Attendee_Business_DnB_Id__c ;
        Event.Attendee_Business_NoOfEmployees__c =Event.Attendee_Business_NoOfEmployees__c ;
        Event.Attendee_NewBusinessRevenue__c =Event.Attendee_NewBusinessRevenue__c ;
        Event.Attendee_BusinessTaxId__c =Event.Attendee_BusinessTaxId__c ;
        Event.Attendee_PrimaryBusinessCategory1__c =Event.Attendee_PrimaryBusinessCategory1__c ;
        Event.Attendee_SecondaryBusinessCategory2__c =Event.Attendee_SecondaryBusinessCategory2__c ;
        Event.Attendee_WebsiteURL__c =Event.Attendee_WebsiteURL__c ;
        Event.Attendee_ShippingAddress__c =Event.Attendee_ShippingAddress__c ;
        Event.Attendee_ShippingPOBox__c =Event.Attendee_ShippingPOBox__c ;
        Event.Attendee_BlogURL__c =Event.Attendee_BlogURL__c ;
        Event.Attendee_WorkAddress__c =Event.Attendee_WorkAddress__c ;
        Event.Attendee_WorkPhone__c =Event.Attendee_WorkPhone__c ;
        Event.Attendee_WorkPOBox__c =Event.Attendee_WorkPOBox__c ;
        Event.Attendee_DiversityType1__c =Event.Attendee_DiversityType1__c ;
        
        try{
            Event.Attendee_NAICS_Code1__c =Integer.valueOf(NAICS1Mod);
            } catch(Exception e){}
         try{   
        Event.Attendee_NAICS_Code2__c =Integer.valueOf(NAICS2Mod);
         } catch(Exception e){}
        try{
        Event.Attendee_NAICS_Code3__c =Integer.valueOf(NAICS3Mod);
        } catch(Exception e){}
        Event.Attendee_shippingCity__c =Event.Attendee_shippingCity__c;
        Event.Attendee_NewshippingState__c = Event.Attendee_NewshippingState__c; 
        Event.Attendee_WorkAddress1__c = Event.Attendee_WorkAddress1__c;
        Event.Attendee_Workcity__c = Event.Attendee_Workcity__c;
        Event.Attendee_newWorkState__c = Event.Attendee_newWorkState__c;
        Event.Attendee_HomeAddress1__c = Event.Attendee_HomeAddress1__c;
        Event.Attendee_HomeCity__c =Event.Attendee_HomeCity__c;
        Event.Attendee_HomePOBox__c =Event.Attendee_HomePOBox__c;
        Event.Attendee_NewHomeState__c =Event.Attendee_NewHomeState__c;
        //RegTypeList = new List<String>();    
       Event.Attendee_registration_type__c='';
        if(RegValu0 == True)
        Event.Attendee_registration_type__c=' Full Conference,'; 
        if(RegValu1 == True)
        Event.Attendee_registration_type__c+='Wednesday Only,';   
        if(RegValu2 == True)    
        Event.Attendee_registration_type__c+='Thursday Only,';
         if(RegValu3 == True)    
        Event.Attendee_registration_type__c+=' Friday Only,';
         if(RegValu4 == True)    
        Event.Attendee_registration_type__c+='Trade Expo Only,';
         if(RegValu5 == True)    
        Event.Attendee_registration_type__c+='Thursday & Friday Only,';  
        if(RegValu6 == True)    
        Event.Attendee_registration_type__c+='Wednesday & Thursday Only,';
        if(RegValu7 == True)    
        Event.Attendee_registration_type__c+=' Shining Star & Friday Only,';    
        if(RegValu8 == True)    
        Event.Attendee_registration_type__c+='Full Convention,';
         if(RegValu9 == True)    
        Event.Attendee_registration_type__c+='Reception,';
        if(RegValu10 == True)  
         Event.Attendee_registration_type__c+='Monday Pass,';
        if(RegValu11 == True)  
        Event.Attendee_registration_type__c+='Tuesday Pass,';
               
        if(Event.Attendee_registration_type__c.contains(','))
        {
        Event.Attendee_registration_type__c=Event.Attendee_registration_type__c.substring(0,Event.Attendee_registration_type__c.lastIndexOf(','));
        }
        update Event ;
     
     
      system.debug('hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii'+Event.Attendee_registration_type__c);
       if(eventIdVar != null && attendeeImageEdit != null){
         attachment a = new attachment ();
         a=[select id,parentid from Attachment where Id=:eventIdVar];
       system.debug('valueeeeeeeeeeeeeee of aaaaaaaaaaaaaaaaaaaaaaa'+a);
        delete a;
       }
    system.debug('valueeeeeeeeeeeeeee of attendeeImageEdit '+attendeeImageEdit );
   
    if(attendeeImageEdit != null){
     System.debug('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'+ attendeeImageEdit );
        attachment b = new attachment();      
        b.Name =attendeeNameAfterEdit;
        b.Body =attendeeImageEdit;
        b.parentId =Event.id;
       
       system.debug('valueeeeeeeeeeeeeee of bbbbbbbbbbbbbbbbbbbbb'+b);
          insert b;
    
    }
    
    
     System.debug('5675656757657576575675757567575675675'+Event);
        EventEditpopup= FALSE;
        
       
        
        
        
        Pagereference pg = new Pagereference('/apex/Qr_Booth_attendees');
            pg.setRedirect(true);
            return pg;
       }catch(Exception e){ApexPages.addMessages(e);}
       return null; 
        
    } 
      
    //add attendee
    
      public void NewAttendee()
    {
    
          emailalert=false;
          EventReqStringBool=false;
           if(singleEvent ==null )
             {
              EventReqString = 'Please Creat an Event';
              EventReqStringBool = TRUE;
             }
             else
             {
             system.debug('mmmmmmmmmmmmmmmmmmmmmmmmmmmmmm');
        addattendee = TRUE;
        newAttendee = new QR_AttendeeSummary__c();
        }
    }
    
     public pagereference cancel(){
    EventReqStringBool=false;
        addattendee= FALSE;
        EventEditpopup=FALSE;
       pagereference pg=new pagereference('/apex/Qr_Booth_attendees');
       pg.setredirect(true);
       return pg;
         
    }
     public boolean sta{get;set;}
     public pagereference Saveprint()
     {
     SaveAttendee();
     addattendee=false;
     singledymo=true;
    // pagereference pg=new pagereference('/apex/qr_Dymolabel');
     return null;
     }
      public Pagereference SaveAttendee()
    {
      
        RegTypeList='';
       
        system.debug('++++++++++++++++++++++++++++++++++++++++'+newAttendee.Attendee_NewHomeState__c);
     if(CheckDuplicate((newAttendee.Attendee_EmailId__c).toLowerCase()+newAttendee.Attendee_FirstName__c+newAttendee.Attendee_LastName__c))
     {
        try{
    
   //  newAttendee = new QR_AttendeeSummary__c();
        System.debug('Saveeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
    system.debug('++++++++++++++++++++++++++++++++++++++++'+newAttendee.Attendee_NewHomeState__c);

       newAttendee.Attendee_FirstName__c= newAttendee.Attendee_FirstName__c;
       newAttendee.Attendee_LastName__c=newAttendee.Attendee_LastName__c;
       newAttendee.Attendee_Company__c=newAttendee.Attendee_Company__c;
       newAttendee.Attendee_EmailId__c=newAttendee.Attendee_EmailId__c;
        
        
        newAttendee.Attendee_newPrefix__c =  newAttendee.Attendee_newPrefix__c;
        
        newAttendee.Attendee_newSuffix__c = newAttendee.Attendee_newSuffix__c;
        newAttendee.Attendee_Designation__c = newAttendee.Attendee_Designation__c;
        newAttendee.Attendee_CellPhoneNumber__c = newAttendee.Attendee_CellPhoneNumber__c;
       // try{
        newAttendee.Attendee_Age__c = newAttendee.Attendee_Age__c;
        //}catch(Exception E){}
        newAttendee.Attendee_HomePhoneNumber__c = newAttendee.Attendee_HomePhoneNumber__c;
        newAttendee.Attendee_Gender__c =  newAttendee.Attendee_Gender__c ;
       // gender
        newAttendee.Attendee_BirthDate__c = newAttendee.Attendee_BirthDate__c;
        newAttendee.Attendee_HomeAddress__c = newAttendee.Attendee_HomeAddress__c;
        newAttendee.New_Business_Description__c = newAttendee.New_Business_Description__c;

       newAttendee.Attendee_BusineesEstablished_Date1__c = newAttendee.Attendee_BusineesEstablished_Date1__c;
        newAttendee.Attendee_Business_DnB_Id__c = newAttendee.Attendee_Business_DnB_Id__c;
       // try{
       // if (noOfEmployees != ''){
        newAttendee.Attendee_Business_NoOfEmployees__c = newAttendee.Attendee_Business_NoOfEmployees__c;
        //}
       //}catch(Exception E){}
     //  try{
          // if (Brevenue!= ''){
         //System.debug('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%' + Brevenue );
        newAttendee.Attendee_NewBusinessRevenue__c = newAttendee.Attendee_NewBusinessRevenue__c;
        // System.debug('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^' + newAttendee.Attendee_Business_NoOfEmployees__c);
        
       // }
       // }catch(Exception e){}
        
        newAttendee.Attendee_BusinessTaxId__c = newAttendee.Attendee_BusinessTaxId__c;
       // if(pbcategory!= 'none')
        newAttendee.Attendee_PrimaryBusinessCategory1__c = newAttendee.Attendee_PrimaryBusinessCategory1__c;
        //if(sbcategory!= 'none')
        newAttendee.Attendee_SecondaryBusinessCategory2__c = newAttendee.Attendee_SecondaryBusinessCategory2__c;
        newAttendee.Attendee_WebsiteURL__c = newAttendee.Attendee_WebsiteURL__c ;
        newAttendee.Attendee_ShippingAddress__c = newAttendee.Attendee_ShippingAddress__c;
        newAttendee.Attendee_ShippingPOBox__c = newAttendee.Attendee_ShippingPOBox__c;
        newAttendee.Attendee_BlogURL__c = newAttendee.Attendee_BlogURL__c;
        newAttendee.Attendee_WorkAddress__c = newAttendee.Attendee_WorkAddress__c;
        newAttendee.Attendee_WorkPhone__c = newAttendee.Attendee_WorkPhone__c ;
        newAttendee.Attendee_WorkPOBox__c = newAttendee.Attendee_WorkPOBox__c;
        // if(Diversity!= 'none')
        newAttendee.Attendee_DiversityType1__c = newAttendee.Attendee_DiversityType1__c ;
        newAttendee.Attendee_NAICS_Code1__c = newAttendee.Attendee_NAICS_Code1__c;
        newAttendee.Attendee_NAICS_Code2__c = newAttendee.Attendee_NAICS_Code2__c;
        newAttendee.Attendee_NAICS_Code3__c = newAttendee.Attendee_NAICS_Code3__c;
        
        newAttendee.Attendee_shippingCity__c=newAttendee.Attendee_shippingCity__c;
         system.debug('--------- Selected Value-------'+newAttendee.Attendee_NewshippingState__c);
        system.debug('---------Before Selected Value-------'+newAttendee.Attendee_NewshippingState__c); 
        newAttendee.Attendee_NewshippingState__c=newAttendee.Attendee_NewshippingState__c;
         system.debug('---------After Selected Value-------'+newAttendee.Attendee_NewshippingState__c); 
        newAttendee.Attendee_shippingaddress2__c=newAttendee.Attendee_shippingaddress2__c;
        newAttendee.Attendee_WorkAddress1__c=newAttendee.Attendee_WorkAddress1__c;
        newAttendee.Attendee_Workcity__c=newAttendee.Attendee_Workcity__c;
         // if(wstate!= 'none')
        
        newAttendee.Attendee_newWorkState__c=newAttendee.Attendee_newWorkState__c;
        newAttendee.Attendee_HomeAddress1__c=newAttendee.Attendee_HomeAddress1__c;
       // newAttendee.Attendee_HomeCity__c=Homecity;
     
       newAttendee.Attendee_NewHomeState__c = newAttendee.Attendee_NewHomeState__c;
        newAttendee.Attendee_HomePOBox__c=newAttendee.Attendee_HomePOBox__c;
        
     /*   if(Homestate != 'none')
        newAttendee.Attendee_NewHomeState__c=Homestate;
        
        */
        //RegTypeList = new String();  
        if(TatianaRegTypes == True)  {
   if(RegValu0 == True || RegValu1 == True || RegValu2 == True || RegValu3 == True || RegValu4 == True ||RegValu5 == True || RegValu6 == True ||RegValu7 == True){     
    if(RegValu0 == True)
      RegTypeList += 'Full Conference,';
     
   if(RegValu1 == True)    
    RegTypeList += 'Wednesday Only,';
    
   if(RegValu2 == True)    
    RegTypeList += 'Thursday Only,';
    
    if(RegValu3 == True)    
    RegTypeList += ' Friday Only,';
    
    if(RegValu4 == True)    
    RegTypeList += ' Trade Expo Only,';
    
    if(RegValu5 == True)    
    RegTypeList += 'Thursday & Friday Only,';
    
    if(RegValu6 == True)    
    RegTypeList += 'Wednesday & Thursday Only,';
    
    if(RegValu7 == True)    
    RegTypeList += 'Shining Star & Friday Only,';
    
   
    }
    }
    else if(OtherthanTatianaRegTypes == true )
    {
     if(RegValu8 == True || RegValu9 == True || RegValu10 == True || RegValu11 == True)
     {
     if(RegValu8 == True)
      RegTypeList += 'Full Conference,';
     
   if(RegValu9 == True)    
    RegTypeList += 'Reception,';
    if(RegValu11 == True)    
    RegTypeList += 'Monday Pass,';
    
   if(RegValu10 == True)    
    RegTypeList += 'Tuesday Pass,';  
    
    }
    }
   
       RegTypeList=RegTypeList.substring(0,RegTypeList.lastIndexof(','));
       newattendee.Attendee_registration_type__c = RegTypeList;
        newAttendee.Event_Id__c = singleEvent;
        
        System.debug('============================================================='+ newAttendee);

        insert newAttendee;
        
        
        if(attendeeImage != null){
          attachment a = new attachment();      
          a.Name =attendeeName;
          a.Body =attendeeImage;
          a.parentId =newAttendee.id;
          insert a;
    }
        Pagereference pg = new Pagereference('/apex/Qr_Booth_attendees');
            pg.setRedirect(true);
            return pg;
             }
       catch(Exception e){
        
            //ApexPages.addMessages(e);
        
        }
       }else{
          system.debug('---------------------------------------error------------------');
           duplicateAttendee = 'Attendee is already exiest for this Event';
           duplicateAttendeeBool = TRUE;
       } 
       return null;
   
   
   } 
   
   
  public string  serarchstringvalue{get;set;} 
   
  public pagereference search(){
  emailalert=false;
  emailalertforprofile=false;
  EventReqStringBool=false;
  TotalAttendees = new LIST<LIST<EventWrapper>>();
  integer recCount=0;
  
  attendees1234 = new LIst<QR_AttendeeSummary__c >();
  string ff = serarchstringvalue+'%';
  
   attendees1234 = [select id,name,Attendee_FirstName__c,Attendee_status__c ,Attendee_LastName__c,Attendee_Company__c,Attendee_Registration_type__c,
                            Attendee_EmailId__c,Attendee_CellPhoneNumber__c,Attendee_BadgePrint__c,Attendee_Barcode3__c
                            FROM QR_AttendeeSummary__c where Event_Id__r.Eventadmin_Id__r.User_ID__c=:userid and (Attendee_FirstName__c like :ff+'%' OR Attendee_LastName__c like :ff+'%' OR  Attendee_Company__c like :ff+'%' OR Attendee_EmailId__c like :ff+'%' OR Attendee_CellPhoneNumber__c like :'%'+ff+'%') order by Attendee_FirstName__c,
                                                                           Attendee_BadgePrint__c 
                                                                            ]; 
   
  // Or (Attendee_LastName__c like :ff) Or (Attendee_Company__c like :ff) Or (Attendee_EmailId__c like  :ff)                                                                   
   ew=new List<eventwrapper>();
    for(QR_AttendeeSummary__c s:attendees1234)
  {
     
      s.Attendee_FirstName__c = escapeSpecialCharacters(s.Attendee_FirstName__c);
      s.Attendee_LastName__c = escapeSpecialCharacters(s.Attendee_LastName__c);
      s.Attendee_CellPhoneNumber__c = escapeSpecialCharacters(s.Attendee_CellPhoneNumber__c);
      s.Attendee_EmailId__c = escapeSpecialCharacters(s.Attendee_EmailId__c);
      s.Attendee_Company__c = escapeSpecialCharacters(s.Attendee_Company__c);
      s.Attendee_Registration_type__c = escapeSpecialCharacters(s.Attendee_Registration_type__c);
      
       recCount++;
       ew.add(new eventwrapper(s));
       if(recCount==1000){
       TotalAttendees.add(ew);
       ew = new LIST<EventWrapper>();
       recCount=0;
       }
      
  }
  if(recCount !=0)
  TotalAttendees.add(ew);
  
  
   system.debug('tttttttttttttttttttttttttttttt'+TotalAttendees);      
  return null;
   
   } 
   
   
   // for checking Duplicates with First Name, Last Name, Email id---------------------by Mallik-----------------
   public Boolean CheckDuplicate(String newAttendee)
   {  
       Boolean noDupAttendee;
        
       LIST<QR_AttendeeSummary__c>  eventAttendees = new LIST<QR_AttendeeSummary__c>();
       MAP<String ,QR_AttendeeSummary__c>  myEventAttendeesMap = new MAP<String, QR_AttendeeSummary__c>();
       eventAttendees = [select id, Attendee_EmailId__c,Attendee_FirstName__c,Attendee_LastName__c FROM QR_AttendeeSummary__c WHERE Event_Id__c=: singleEvent];
    
       for(QR_AttendeeSummary__c toMap :eventAttendees)
       {
         myEventAttendeesMap.put(toMap.Attendee_EmailId__c.trim()+toMap.Attendee_FirstName__c+toMap.Attendee_LastName__c , toMap);
       }
      
      if(!myEventAttendeesMap.isEmpty())
      {
          if(myEventAttendeesMap.containsKey(newAttendee))
          {
            noDupAttendee=FALSE;
          }else{
              noDupAttendee = TRUE;
          }
      
      }else
      {
          noDupAttendee= TRUE;
      }
      
      return noDupAttendee; 
   }
   
   
   
   //CODE For Import History----------------------By Mallikkkkk
   public void ShowPreviousList()
    {
       emailalertforprofile=false;
        DataImportBool = TRUE;
        
        ImportHistory= [select id,createddate,Upload_File_Name__c,Total_No_of_Records__c, Import_History__c FROM QR_DataImport_SavePoint__c WHERE QR_Eventadmin__r.User_ID__c =:userInfo.getUserId() ORDER By createddate];
        
        system.debug('&&&&&&&&&&&&&&&&&&&&&&'+ ImportHistory);
    }
    
    public Pagereference deleteDataImportHistory()
    {
    EventReqStringBool=false;
      System.debug('^^^^^^^^^^^^^^'+ApexPages.currentPage().getParameters().get('deleteDataImport') );
      QR_DataImport_SavePoint__c slectToDelete = [select id, Imported_IDs__c FROM QR_DataImport_SavePoint__c WHERE id =:ApexPages.currentPage().getParameters().get('deleteDataImport')];
      
      //string myst = slectToDelete.Imported_IDs__c;
      LIST<String> data = ((String) slectToDelete.Imported_IDs__c).split(',');
      LIST<ID> moveToDeleteIds = new LIST<ID>();
     /* for(String ss: data ){ 
      
          moveToDelete.add((Id)ss);
      
       }*/
        moveToDeleteIds =slectToDelete.Imported_IDs__c.split(',');
        
       LIST<QR_AttendeeSummary__c> moveToDelete = [select id FROM QR_AttendeeSummary__c WHERE id IN: slectToDelete.Imported_IDs__c.split(',')];
       System.debug('################'+ moveToDelete);
       delete moveToDelete;
       delete slectToDelete;
        DataImportBool = FALSE; 
        Pagereference pg = new Pagereference('/apex/Qr_Booth_attendees');
        pg.setRedirect(true);
        return pg;
        
        
    }
   
   public QRCode_Attendee_Settings__c AttendeeSetting{get; set;}
   public Boolean ReqFields{get; set;}
    public Boolean  Prefix{get; set;}
    public Boolean  sufix{get; set;}
    public Boolean  Degi{get; set;}
    public Boolean  mobile{get; set;}
    public Boolean  age{get; set;}
    public Boolean  gen{get; set;}
    public Boolean  dob{get; set;}
    public Boolean  homeinfo{get; set;}
    public Boolean  Shippinginfo{get; set;}
    public Boolean  workinfo{get; set;}
    public Boolean  NAICSCode1{get; set;}
    public Boolean  NAICSCode2{get; set;}
    public Boolean  NAICSCode3{get; set;}
    public Boolean  PBC{get; set;}
    public Boolean  SBC{get; set;}
    public Boolean  NOEmp{get; set;}
    public Boolean  BEDateBool{get; set;}
    public Boolean  BRev{get; set;}
    public Boolean  BTaxID{get; set;}
    public Boolean BDN{get; set;}
    public Boolean webUrl{get; set;}
    public Boolean blogURL{get; set;}
    public Boolean DT{get; set;}
    public Boolean BDesc{get; set;}
    public Boolean NAICSCOdes{get; set;}
    Public Boolean BUsinessBool{get; set;}
    public Boolean AttendeePic{get; set;}
   
   
   public void AttendeeSetting(){
  
       AttendeeSetting = new QRCode_Attendee_Settings__c();
      string sss= UserInfo.getUserName();
// String sss='mallikarjunan+gn@globalnest.com';
       //String sss='durga+eventadmin@globalnest.com';
       //userId ='005A0000002lFGd';
 //userid = UserInfo.getUserId();
 
 try{      
       AttendeeSetting = [select id,QRCode_Selected_Fields__c FROM QRCode_Attendee_Settings__c WHERE QR_Event__r.Eventadmin_Id__r.EventAdmin_EmailId__c=:sss];   
       system.debug('SSSSSSSSSSSSSSSSS'+ AttendeeSetting);
   
       SET<String> selectAttlist = new SET<String>();
        selectAttlist.addAll(new LIST<String>(AttendeeSetting.QRCode_Selected_Fields__c.split(',')));
      
     if(selectAttlist.contains('Attendee_FirstName__c'))
           ReqFields = TRUE; 
     if(selectAttlist.contains('Attendee_NewPrefix__c'))
            Prefix = TRUE;
     if(selectAttlist.contains('Attendee_NewSuffix__c'))
            sufix = TRUE;
     if(selectAttlist.contains('Attendee_Designation__c'))
             Degi= TRUE; 
     if(selectAttlist.contains('Attendee_CellPhoneNumber__c'))
           mobile = TRUE; 
      if(selectAttlist.contains('Attendee_Age__c'))
           age = TRUE; 
      if(selectAttlist.contains('Attendee_Gender__c'))
            gen = TRUE; 
      if(selectAttlist.contains('Attendee_BirthDate__c'))
            dob = TRUE; 
      if(selectAttlist.contains('Attendee_HomeAddress__c'))
           homeInfo  = TRUE; 
      if(selectAttlist.contains('Attendee_ShippingAddress__c'))
           Shippinginfo  = TRUE; 
      if(selectAttlist.contains('Attendee_WorkAddress__c'))
            workInfo = TRUE; 
      if(selectAttlist.contains('Attendee_NAICS_Code1__c'))
            NAICSCode1 = TRUE; 
         else  NAICSCode1 = FALSE;  
      if(selectAttlist.contains('Attendee_NAICS_Code2__c'))
            NAICSCode2 = TRUE;
         else  NAICSCode2 = FALSE;    
      if(selectAttlist.contains('Attendee_NAICS_Code3__c'))
           NAICSCode3  = TRUE;
        else  NAICSCode3 = FALSE;    
      if(selectAttlist.contains('Attendee_PrimaryBusinessCategory1__c'))
            PBC = TRUE; 
         else  PBC = FALSE;   
      if(selectAttlist.contains('Attendee_SecondaryBusinessCategory2__c'))
            SBC = TRUE; 
         else  SBC = FALSE;   
      if(selectAttlist.contains('Attendee_Business_NoOfEmployees__c'))
           NOEmp  = TRUE; 
         else  NOEmp = FALSE;  
      if(selectAttlist.contains('Attendee_BusineesEstablished_Date1__c'))
            BEDateBool = TRUE;
         else  BEDateBool = FALSE;    
      if(selectAttlist.contains('Attendee_BusinessRevenue__c'))
            BRev = TRUE;
         else  BRev = FALSE;    
      if(selectAttlist.contains('Attendee_BusinessTaxId__c'))
           BTaxId  = TRUE; 
        else  BTaxId = FALSE;   
      if(selectAttlist.contains('Attendee_Business_DnB_Id__c'))
           BDN  = TRUE;
        else  BDN= FALSE;    
      if(selectAttlist.contains('Attendee_WebsiteURL__c'))
           webUrl  = TRUE; 
        else  webUrl = FALSE;   
      if(selectAttlist.contains('Attendee_BlogURL__c'))
           blogUrl  = TRUE; 
        else  blogUrl = FALSE;   
      if(selectAttlist.contains('Attendee_DiversityType1__c'))
            DT = TRUE;
         else  DT = FALSE;     
      if(selectAttlist.contains('New_Business_Description__c'))
            BDesc = TRUE; 
        else BDesc = FALSE;     
      if(selectAttlist.contains('AttendeePic'))  
          AttendeePic = TRUE;
         else AttendeePic = FALSE;
          
     NAICSCOdes = (NAICSCode1 || NAICSCode2 || NAICSCode1);       
     
     system.debug('NNNNNNNNNNNNNNNNNNNN'+'   '+ NAICSCOdes);
     
     BUsinessBool =(PBC||SBC||NOEmp||BEDateBool||BRev||BTaxId||BDN||webUrl||blogUrl||BDesc);  
     }
      catch(System.QueryException ex){
   
   
   }     
   }
   
   /**
   public void editAttendeeSetting(){
    EventReqStringBool=false;
       updateAttendeeSettingBool = TRUE;
       
   
   }*/
   
   public Pagereference updateAttendeeSetting(){
    EventReqStringBool=false;
       updateAttendeeSettingBool = FALSE;
       
     String  selectedAttendeeFields = 'Attendee_FirstName__c,Attendee_LastName__c,Attendee_Company__c,Attendee_EmailId__c,';
        if(Prefix)
        selectedAttendeeFields += 'Attendee_NewPrefix__c,';
        if(sufix)
        selectedAttendeeFields += 'Attendee_NewSuffix__c,';
        if(Degi)
        selectedAttendeeFields += 'Attendee_Designation__c,';
        if(mobile)
        selectedAttendeeFields += 'Attendee_CellPhoneNumber__c,';
        if(age)
        selectedAttendeeFields += 'Attendee_Age__c,';
        if(gen)
        selectedAttendeeFields += 'Attendee_Gender__c,';
        if(dob)
        selectedAttendeeFields += 'Attendee_BirthDate__c,';
        if(homeinfo)
        selectedAttendeeFields += 'Attendee_HomePhoneNumber__c,Attendee_HomeAddress__c,Attendee_HomeAddress1__c,Attendee_HomeCity__c,Attendee_HomeState__c,Attendee_HomePOBox__c,';
        if(Shippinginfo)
        selectedAttendeeFields += 'Attendee_ShippingAddress__c,Attendee_ShippingAddress2__c,Attendee_shippingCity__c,Attendee_shippingState__c,Attendee_ShippingPOBox__c,';
        if(workinfo)
        selectedAttendeeFields += 'Attendee_WorkPhone__c,Attendee_WorkAddress__c,Attendee_WorkAddress1__c,Attendee_Workcity__c,Attendee_WorkState__c,Attendee_WorkPOBox__c,';
        if(NAICSCode1)
        selectedAttendeeFields += 'Attendee_NAICS_Code1__c,';
        if(NAICSCode2)
        selectedAttendeeFields += 'Attendee_NAICS_Code2__c,';
        if(NAICSCode3)
        selectedAttendeeFields += 'Attendee_NAICS_Code3__c,';
        if(PBC)
        selectedAttendeeFields += 'Attendee_PrimaryBusinessCategory1__c,';
        if(SBC)
        selectedAttendeeFields += 'Attendee_SecondaryBusinessCategory2__c,';
        if(NOEmp)
        selectedAttendeeFields += 'Attendee_Business_NoOfEmployees__c,';
        if(BEDateBool)
        selectedAttendeeFields += 'Attendee_BusineesEstablished_Date1__c,';
        if(BRev)
        selectedAttendeeFields += 'Attendee_BusinessRevenue__c,';
        if(BTaxID)
        selectedAttendeeFields += 'Attendee_BusinessTaxId__c,';
        if(BDN)
        selectedAttendeeFields += 'Attendee_Business_DnB_Id__c,';
        if(webUrl)
        selectedAttendeeFields += 'Attendee_WebsiteURL__c,';
        if(blogURL)
        selectedAttendeeFields += 'Attendee_BlogURL__c,';
        if(DT)
        selectedAttendeeFields += 'Attendee_DiversityType1__c,';
        if(BDesc)
        selectedAttendeeFields += 'New_Business_Description__c,';
        if(AttendeePic)
        selectedAttendeeFields += 'AttendeePic,';
        
        
        
        
        system.debug('111111111111'+selectedAttendeeFields.length());
        
        system.debug('222222222222'+selectedAttendeeFields.substring(0, selectedAttendeeFields.lastIndexOf(',')).length());
        
        
        QRCode_Attendee_Settings__c attSet = new QRCode_Attendee_Settings__c();
        
        AttendeeSetting.QRCode_Selected_Fields__c = selectedAttendeeFields.substring(0, selectedAttendeeFields.lastIndexOf(','));
        
         upsert AttendeeSetting;
        system.debug('SSSSSSSSSSSSSSSSS'+ AttendeeSetting);
        
        Pagereference pg = new Pagereference('/apex/Qr_Booth_attendees');
        pg.setRedirect(true);
        return pg;
   
   }

    public pagereference emailbadge()
    {
  
    system.debug('eeeeeeeeeeeeeeeeeeeeeeeeee'+eventname1);
    if(eventname1 != '')
        {
         EventReqStringBool = false;
        List<string> listeventname=eventname1.split(',');
        attid=new List<id>();
        for(string  aa: listeventname)
        {
        attid.add((id)aa);
      
        }
       
        
    list<QR_AttendeeSummary__c> emailids=[select id,Attendee_Barcode3__c,Attendee_LastName__c,Attendee_FirstName__c, Attendee_EmailId__c from QR_AttendeeSummary__c where id IN : attid];
 list<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
  
  
   for(QR_AttendeeSummary__c eid: emailids)
 { 
 message= 'Hello'+ eid.Attendee_FirstName__c+',' + +'<br/><br/>'+
           'Thank You for registering of an event ' +'<br/><br/>'+
           'Your Badge for the event has been attached in the mail.Please find the attachment.'+
           
                                   '<br/><br/>'+
                                   'Thank you! <br/> BoothLeads Customer Support';
    pdf=page.qrcode_emailtoattendee; 
    
    string fss =eid.Attendee_Barcode3__c;
    pdf.getParameters().put('id',fss);
    // pdf.setRedirect(true);
     //  b = blob.valueOf('');                                                                                          
      b = pdf.getContent();
      
       system.debug('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'+b);
     Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
      email.setSubject('Your Ticket For Registered Event!');
     String [] toAddresses = new String[] {eid.Attendee_EmailId__c};

     email.setToAddresses(toAddresses);
     email.setHTMLBody(message='Dear'+ eid.Attendee_FirstName__c+',' +'<br/><br/>'+
           'Thank You for registering of an event ' +'<br/><br/>'+
           'Your Badge for the event has been attached in the mail.Please find the attachment.'+
           
                                   '<br/><br/>'+
                                   'Thank you! <br/> BoothLeads Customer Support');
                                                                                            
     Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
     efa.setFileName('MyPDF.pdf');                                                        
     efa.setBody(b);                                                                          
     email.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});
          emails.add(email);                                                                            
    // Messaging.SendEmailResult [] r =
           //  Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
       
    
   
    } 
    Messaging.sendEmail(emails);
    }
     else
        {
          EventReqString = 'Please select an attendee to send an Email';
          EventReqStringBool = TRUE;
        
        }
    return null;
   
   } 

   public list<inneremail> ss {get;set;}
public class inneremail
   {
   public QR_AttendeeSummary__c qq{get;set;}
   public inneremail(QR_AttendeeSummary__c qq)
   {
   this.qq=qq;
   }
   
   }
 //------------------------------------------------------------------Profile update Notification-------------------
 public PageReference emailnotification() {
 emailalert=false;
  EventReqStringBool = False;
 emailalertforprofile=false;
    system.debug('--------------------------------------emailNotification-----------------------'+eventname1);
    if(eventname1 != '')
        {
        system.debug('--------------------------------------emailNotification-----------------------');
        EventReqStringBool = false;
        List<string> listeventname=eventname1.split(',');
        attid=new List<id>();
        for(string  aa: listeventname)
        {
        attid.add((id)aa);
        }
        
    list<QR_AttendeeSummary__c> emailids=[select id,Attendee_EmailId__c,Attendee_FirstName__c,Event_Id__r.id,Event_Id__r.Event_Title__C
                                                      from QR_AttendeeSummary__c where id IN : attid];
    list<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
  
  List<QR_AttendeeSummary__c> ASUpdate=new List<QR_AttendeeSummary__c>();
    for(QR_AttendeeSummary__c eid: emailids)
     {   
     Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
     email.setSubject('Profile Update Request for'+' : '+eid.Event_Id__r.Event_Title__C);
     String [] toAddresses = new String[] {eid.Attendee_EmailId__c};
     email.setToAddresses(toAddresses);
     email.setHTMLBody(message='Dear'+' &nbsp;'+eid.Attendee_FirstName__c +','+'<br/>'+''+'<br/>'+
      +'Welcome to BoothLeads!'+''+'<br/>'+
          'Please Update Your Profile by clicking on the Link at the end of this email.'+'<br/>'+
          'Your updated profile will provide your up to date contact details as well as your business information to the potential customers using boothleads at trade shows.'+'<br/>'+''+'<br/>'+
          'If you have any questions please contact your Event Administrator.'+'<br/>'+''+'<br/>'+
          'Thank you!'+'<br/>'+
          'BoothLeads customer support'+'<br/>'+
         +'<a>'+ 'support@boothleads.com' +'</a>'+''+'<br/>'+''+'<br/>'+''+'<br/>'+
         'Please Update your profile by clicking the below link'+'<br/>'+
          'http://globalnestapps.force.com/AttendeeSelfRegistration?id=' +eid.id+ '&eid=' +eid.Event_Id__r.id+ ''+'<br/>'+
         
          +'Thank you,'+'<br/><br/>');                                                                                                                                                       
    emails.add(email); 
    //eid.IsPrifileUpdate__c=true;                                                                          
   // ASUpdate.add(eid);
    
    }
    Messaging.SendEmailResult[]  r = Messaging.sendEmail(emails);
    boolean check=true;
    for(Messaging.SendEmailResult ms: r){
       check=check && ms.isSuccess();
        
        system.debug('1111111111111111'+ check );
        
    }
    if(check == true)
    {
    emailalertforprofile=true;
    }
    
    //update(ASUpdate);
    }
    else
    {
     EventReqString = 'Please select an attendee to send notification';
              EventReqStringBool = TRUE;
    }
    return null;
       
    }
//-----------------------------------Export--------------------------------------------------
   public string escape(string s){
      
     
      if(s != null && s.contains(',')){
          
         s=s.replaceAll('"','');
          
          s='"'+s+'"';
       } 
            
       return s;
      }
      

   public string NAICScodeexport1{get;set;}
   public string NAICScodeexport2{get;set;}
   public string NAICScodeexport3{get;set;}
    public list<QR_AttendeeSummary__c> expolist{get;set;}
    public pagereference exportattendees()
    {
    EventReqStringBool=false;
    EventReqString='';
    emailalertforprofile=false;
    event1234=new list<QR_AttendeeSummary__c>();
   event1234= [select id,name,Attendee_FirstName__c,Attendee_status__c ,Attendee_LastName__c,Attendee_Company__c,Attendee_registration_type__c,
                                Attendee_EmailId__c,Attendee_CellPhoneNumber__c,Attendee_BadgePrint__c,Attendee_BusineesEstablished_Date1__c,
                                Attendee_newPrefix__c,Attendee_newSuffix__c,Attendee_Gender__c, Attendee_Designation__c,
                                 Attendee_Age__c, Attendee_HomePhoneNumber__c,  Attendee_BirthDate__c, 
                                 Attendee_HomeAddress__c, New_Business_Description__c, 
                                  Attendee_Business_DnB_Id__c, Attendee_Business_NoOfEmployees__c, Attendee_NewBusinessRevenue__c,
                                   Attendee_BusinessTaxId__c, Attendee_PrimaryBusinessCategory1__c, Attendee_SecondaryBusinessCategory2__c, 
                                   Attendee_WebsiteURL__c, Attendee_ShippingAddress__c,Attendee_ShippingAddress2__c, Attendee_ShippingPOBox__c,
                                    Attendee_BlogURL__c, Attendee_WorkAddress__c, Attendee_WorkPhone__c,Attendee_WorkPOBox__c, 
                                    Attendee_DiversityType1__c, Attendee_NAICS_Code1__c, Attendee_NAICS_Code2__c,Attendee_NAICS_Code3__c,
                                    Attendee_shippingCity__c,Attendee_NewshippingState__c ,
                                    Attendee_WorkAddress1__c,Attendee_Workcity__c,
                                    Attendee_newWorkState__c,Attendee_HomeAddress1__c,
                                    Attendee_HomeCity__c ,Attendee_HomePOBox__c,
                                  Attendee_NewHomeState__c FROM QR_AttendeeSummary__c WHERE Event_Id__r.id =: singleevent];
     expolist=new list<QR_AttendeeSummary__c>(); 
       for(QR_AttendeeSummary__c expolist1:event1234)
  {  
  system.debug('--------------------------------------------------'+expolist1.Attendee_WorkPOBox__c);    
   if (expolist1.Attendee_newWorkState__c == 'None'){
       expolist1.Attendee_newWorkState__c = expolist1.Attendee_newWorkState__c.replace('None','');
        
        }
        if (expolist1.Attendee_NewHomeState__c == 'None'){
       expolist1.Attendee_NewHomeState__c = expolist1.Attendee_NewHomeState__c.replace('None','');
        
        }
        if (expolist1.Attendee_NewshippingState__c == 'None'){
       expolist1.Attendee_NewshippingState__c = expolist1.Attendee_NewshippingState__c.replace('None','');
        
        }
        
         if(expolist1.Attendee_NAICS_Code1__c!=null){
         NAICScodeexport1='"=TEXT('+expolist1.Attendee_NAICS_Code1__c+','+'\""000000\"")"';
        }
         if(expolist1.Attendee_NAICS_Code2__c!=null){
         NAICScodeexport2='"=TEXT('+expolist1.Attendee_NAICS_Code2__c+','+'\""000000\"")"';
        }
         if(expolist1.Attendee_NAICS_Code3__c!=null){
         NAICScodeexport3='"=TEXT('+expolist1.Attendee_NAICS_Code3__c+','+'\""000000\"")"';
        }
    if(expolist1.Attendee_ShippingPOBox__c != null){
       if(expolist1.Attendee_ShippingPOBox__c.length()==5){
         expolist1.Attendee_ShippingPOBox__c='"=Text('+expolist1.Attendee_ShippingPOBox__c+','+'\""00000\"")"';
        }
        else
        {
        expolist1.Attendee_ShippingPOBox__c=expolist1.Attendee_ShippingPOBox__c;
        }
        }
       if(expolist1.Attendee_WorkPOBox__c != null){
        if(expolist1.Attendee_WorkPOBox__c.length() == 5){
         expolist1.Attendee_WorkPOBox__c='"=Text('+expolist1.Attendee_WorkPOBox__c+','+'\""00000\"")"';
        }
        else{
        expolist1.Attendee_WorkPOBox__c=expolist1.Attendee_WorkPOBox__c;
        
        } 
        }
        if(expolist1.Attendee_HomePOBox__c != null){
        if(expolist1.Attendee_HomePOBox__c.length() == 5)
        {
        expolist1.Attendee_HomePOBox__c='"=Text('+expolist1.Attendee_HomePOBox__c+','+'\""00000\"")"';
        }
        else{
        expolist1.Attendee_HomePOBox__c=expolist1.Attendee_HomePOBox__c;
        }
        }
      

  expolist1.Attendee_FirstName__c = escape(expolist1.Attendee_FirstName__c);
  expolist1.Attendee_LastName__c = escape(expolist1.Attendee_LastName__c);
  expolist1.Attendee_CellPhoneNumber__c = escape(expolist1.Attendee_CellPhoneNumber__c);
  expolist1.Attendee_EmailId__c = escape(expolist1.Attendee_EmailId__c);
  expolist1.Attendee_Company__c = escape(expolist1.Attendee_Company__c);
   expolist1.Attendee_registration_type__c = escape(expolist1.Attendee_registration_type__c);
   expolist1.Attendee_HomePhoneNumber__c = escape(expolist1.Attendee_HomePhoneNumber__c);
    expolist1.Attendee_Designation__c = escape(expolist1.Attendee_Designation__c);
     expolist1.Attendee_HomeAddress__c = escape(expolist1.Attendee_HomeAddress__c);
      expolist1.Attendee_HomeCity__c = escape(expolist1.Attendee_HomeCity__c);
        expolist1.New_Business_Description__c = escape(expolist1.New_Business_Description__c);
         expolist1.Attendee_BusinessTaxId__c = escape(expolist1.Attendee_BusinessTaxId__c);
          expolist1.Attendee_PrimaryBusinessCategory1__c = escape(expolist1.Attendee_PrimaryBusinessCategory1__c);
           expolist1.Attendee_SecondaryBusinessCategory2__c = escape(expolist1.Attendee_SecondaryBusinessCategory2__c);
            expolist1.Attendee_ShippingAddress__c = escape(expolist1.Attendee_ShippingAddress__c);
             expolist1.Attendee_ShippingAddress2__c = escape(expolist1.Attendee_ShippingAddress2__c);
              expolist1.Attendee_WorkAddress__c = escape(expolist1.Attendee_WorkAddress__c);
               expolist1.Attendee_DiversityType1__c = escape(expolist1.Attendee_DiversityType1__c);
               expolist1.Attendee_HomeAddress1__c = escape(expolist1.Attendee_HomeAddress1__c);
                expolist1.Attendee_Workcity__c = escape(expolist1.Attendee_Workcity__c);
                 //expolist1. Attendee_NewHomeState__c = escape(expolist1.Attendee_NewHomeState__c);
                  expolist1.Attendee_newWorkState__c = escape(expolist1.Attendee_newWorkState__c);
                  expolist1.Attendee_shippingCity__c = escape(expolist1.Attendee_shippingCity__c);
                  expolist1.Attendee_Workcity__c = escape(expolist1.Attendee_Workcity__c);
                  expolist1.Attendee_HomeState__c = NAICScodeexport1;
                  expolist1.Attendee_WorkState__c = NAICScodeexport2;
                  expolist1.Attendee_shippingState__c = NAICScodeexport3;
                  
      expolist.add(expolist1);
   }   
      
       pagereference pg=new pagereference('/apex/qrcode_attendees_Export');
       pg.setredirect(false);
       return pg;
    }
//------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
 //------------------------Help----------------------  
   Public Boolean HelpPopUp{get;set;}
    Public void Help(){
    HelpPopUp = True;
    }
    Public Void CloseHelppopup(){
    HelpPopUp = false;
    }
//--------------------------Test Class-----------------  
  static testMethod void myUnitTest() {

Profile p = [select id FROM profile where name='System Administrator'];
User u = new User(alias = 'test123', email='test123@noemail.com',
emailencodingkey='UTF-8',profileid = p.Id, lastname='Testing', languagelocalekey='en_US',
localesidkey='en_US',country='United States',
timezonesidkey='America/Los_Angeles', username='test123@noemail.com');
insert u;

QR_Eventadmin__c eAdm = new QR_Eventadmin__c(
EventAdmin_FirstName__c='testEvenfirstnametAdmin',EventAdmin_LastName__c='testEvenLastname',EventAdmin_EmailId__c=u.Email,User_ID__c=u.Id);
insert eAdm;

QR_Event__c event = new QR_Event__c(Event_Title__c='testEvent',Event_HostingTimeZone__c='Eastern Time(USA)',End_Date__c=date.valueOf('2012-05-15 00:00:00'),Start_Date__c=date.valueOf('2012-05-11 00:00:00'),Eventadmin_Id__c=eAdm.id);
insert event;



QR_AttendeeSummary__c attendee= new QR_AttendeeSummary__c(Attendee_FirstName__c='mythily',Attendee_LastName__c='Nagandla',  
                                             Attendee_EmailId__c='mythili2.nagandla@gmail.com',Attendee_Company__c='Global Nest',Attendee_BadgePrint__c=true,Event_Id__c=event.id,Attendee_newWorkState__c='None',Attendee_NewHomeState__c='None',Attendee_NewshippingState__c='None',Attendee_NAICS_Code1__c=987654,Attendee_NAICS_Code2__c=123456,Attendee_NAICS_Code3__c=898765,Attendee_WorkPOBox__c='87654',Attendee_HomePOBox__c='65765',Attendee_ShippingPOBox__c='98734');
insert attendee;


QR_AttendeeSummary__c attendeefordelete= new QR_AttendeeSummary__c(Attendee_FirstName__c='mythily',Attendee_LastName__c='Nagandla',  
                                             Attendee_EmailId__c='mythili3.nagandla@gmail.com',Attendee_Company__c='Global Nest',Attendee_BadgePrint__c=true,Event_Id__c=event.id);
insert attendeefordelete;


QR_AttendeeSummary__c attendeedummy= new QR_AttendeeSummary__c(Attendee_FirstName__c='mythily',Attendee_LastName__c='Nagandla',  
                                             Attendee_EmailId__c='mythili4.nagandla@gmail.com',Attendee_Company__c='Global Nest',Attendee_BadgePrint__c=true,Event_Id__c=event.id);
insert attendeedummy;

List<QR_AttendeeSummary__c> listOfEvent = new List<QR_AttendeeSummary__c>();
listOfEvent.add(attendee);

QR_DataImport_SavePoint__c savePoint = new QR_DataImport_SavePoint__c();
savePoint.Upload_File_Name__c ='uploadFile'; 
savePoint.QR_Eventadmin__c = eAdm.id; 
savePoint.Imported_IDs__c =attendeefordelete.id;
insert savePoint; 


QRCode_Attendee_Settings__c attendeeSetting = new QRCode_Attendee_Settings__c();
attendeeSetting.QR_Event__c=event.id; 
attendeeSetting.QRCode_Selected_Fields__c='Attendee_FirstName__c,Attendee_LastName__c,Attendee_Company__c,Attendee_EmailId__c,Attendee_NewPrefix__c,Attendee_NewSuffix__c,Attendee_Designation__c,Attendee_CellPhoneNumber__c,Attendee_Age__c,Attendee_Gender__c,Attendee_BirthDate__c,Attendee_HomePhoneNumber__c,Attendee_HomeAddress__c,Attendee_HomeAddress1__c,Attendee_HomeCity__c,Attendee_HomeState__c,Attendee_HomePOBox__c,Attendee_ShippingAddress__c,Attendee_ShippingAddress2__c,Attendee_shippingCity__c,Attendee_shippingState__c,Attendee_ShippingPOBox__c,Attendee_WorkPhone__c,Attendee_WorkAddress__c,Attendee_WorkAddress1__c,Attendee_Workcity__c,Attendee_WorkState__c,Attendee_WorkPOBox__c,Attendee_NAICS_Code1__c,Attendee_NAICS_Code2__c,Attendee_NAICS_Code3__c,Attendee_PrimaryBusinessCategory1__c,Attendee_SecondaryBusinessCategory2__c,Attendee_Business_NoOfEmployees__c,Attendee_BusineesEstablished_Date1__c,Attendee_BusinessRevenue__c,Attendee_BusinessTaxId__c,Attendee_Business_DnB_Id__c,Attendee_WebsiteURL__c,Attendee_BlogURL__c,Attendee_DiversityType1__c,New_Business_Description__c,AttendeePic';
insert attendeeSetting;
Blob b;
attachment att = new attachment();
att.name='testAttach';
att.Body =b;
att.ParentId=attendee.id;
List<id> listid =new List<id>();
 listid.add(attendee.id);
system.runAs(u){
Boothattendeesprivate testCon = new Boothattendeesprivate();
testCon.userId =u.id;
testCon.eventadmin = eAdm;
testCon.Events();
testCon.CustomerAdminAct();
testCon.Attendees();
testCon.reportact();
testCon.Dashboardaction();
testCon.backaction();
testCon.getfields();
testCon.eventname1=null;
testCon.popup();
testCon.getvalues();
testCon.eventname1 =attendee.id;
testCon.popup();
testCon.selectedvalues ='Avery 5392 Name badges';
testCon.selectedprint();
testCon.selectedvalues='Avery 22806 easy peal square Badges';
testCon.selectedprint();
testCon.selectedvalues ='Please Select a Template';
testCon.selectedprint();
testCon.checkUserId();
testCon.attendeedetail();
testCon.singleEvent =event.id;
testCon.ImportAttendee();
testCon.singleEvent=null;
testCon.ImportAttendee();
testCon.ProfileSettings();
testCon.escapeSpecialCharacters('phani"kumar<c\\h');
testCon.attid=listid;
testCon.genpdf();
testCon.selectedvalues='Dymo 30856(single label)';
testCon.genpdf();
testCon.genpdf();
testCon.selectedvalues='Avery 5392 Name badges';
testCon.genpdf();
testCon.eventName1=attendee.id;
testCon.editAttendee();
testCon.Event = attendee;
testCon.editAttendee();
testCon.eventIdVar=attendee.id;
testCon.UpdateAttendee();
testCon.Event = attendee;
testCon.UpdateAttendee();
testCon.getselect();
testCon.selectedvalues ='Avery 22806 easy peal square Badges';
testCon.genpdf();
testCon.eventName1=attendee.id;
testCon.cus12 =listOfEvent;
testCon.getEventDetails();
testCon.singleEvent =null;
testCon.NewAttendee();
testCon.cancel();
testCon.serarchstringvalue ='mythily';
testCon.search();
testCon.singleEvent =event.id;
testCon.CheckDuplicate(attendee.id);
testCon.ShowPreviousList();
testCon.singledymobadge();

PageReference pp = page.Qr_Booth_attendees;
Test.setCurrentPage(pp);
apexPages.currentPage().getParameters().put('deleteDataImport',savePoint.id);
testCon.deleteDataImportHistory();


testCon.singleEvent =event.id;
QR_AttendeeSummary__c  newAttendee = new QR_AttendeeSummary__c();
 newAttendee.Attendee_EmailId__c='admintest@gmail.com';
 newAttendee.Attendee_LastName__c='Admin';
 newAttendee.Attendee_FirstName__c='BoothLeads';
 testCon.newAttendee = newAttendee;
 testCon.SaveAttendee();
  
testCon.eventName1=attendeefordelete.id;
testCon.deleteAdminRecord();

newAttendee = new QR_AttendeeSummary__c();
 newAttendee.Attendee_EmailId__c='mythili.nagandla@gmail.com';
 newAttendee.Attendee_LastName__c='mythily';
 newAttendee.Attendee_FirstName__c='Nagandla';
 testCon.newAttendee =newAttendee;
 
 testCon.SaveAttendee();
 testCon.AttendeeSetting();
 testCon.updateAttendeeSetting();
 testcon.emailbadge();
 testcon.Help();
 testcon.CloseHelppopup();
  testcon.Saveprint();
  
  
  QRCode_Attendee_Settings__c attendeeSetting12 = new QRCode_Attendee_Settings__c();
attendeeSetting12.QR_Event__c=event.id; 
attendeeSetting12.QRCode_Selected_Fields__c='';
insert attendeeSetting12;

 testCon.AttendeeSetting();
  
  testcon.singleevent=event.Id;
  testcon.exportattendees();
  testcon.eventname1 =attendee.id;
  testcon.emailnotification();
}



}
  
  
  
   
   
    


}