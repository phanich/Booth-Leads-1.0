public with sharing class AttendeeSelfRegistrationCon {


// DIversity Type
public pagereference eventinfo(){



     return null;
}
public pagereference eventschedule(){
     return null;
}

 public Boolean welcomeNote{get;set;}
 Public String SelectStates{get;set;}
 Public List<selectOption> states{get;set;}
 Public List<selectOption> Options {get;set;}
 Public List<String> Selvalue {get;set;}
 
 public String Prefix {get;set;}

 public String FirstName{get;set;}
 
  public String LastName{get;set;}
 
 
 
    Public Boolean Select0{get;set;}
    Public Boolean Select1{get;set;}
    Public Boolean Select2{get;set;}
    Public Boolean Select3{get;set;}
    Public Boolean Select4{get;set;}
    Public Boolean Select5{get;set;}
    Public Boolean Select6{get;set;}
    Public Boolean Select7{get;set;}
    Public Boolean Select8{get;set;}
    Public Boolean Select9{get;set;}
    Public Boolean Select10{get;set;} 
    Public Boolean Select11{get;set;}
    Public Boolean Select12{get;set;}
    Public Boolean Select13{get;set;}
    Public Boolean Select14{get;set;}   
    
    Public Boolean RegValu0{get;set;}
    Public Boolean RegValu1{get;set;}    
    Public Boolean RegValu2{get;set;}
    Public List<String> RegTypeList{get;set;}
    Public String RegTypeValues{get;set;}
    
    public boolean eventInfo{get;set;}
    
    public boolean eventSchedule{get;set;}
    
    Public string selectedvaluesfordiversity{get;set;}

    public String NaicsCode1{get;set;}
    
    public String NaicsCode2{get;set;}
    
    public String NaicsCode3{get;set;}
     
    public QR_AttendeeSummary__c AtSummary{get;set;}
    
      public QR_AttendeeSummary__c AtSummary1{get;set;}
 
    public boolean out_variable{get;set;}
 
    public id  attid = apexpages.currentpage().getParameters().get('id');
 
    public id Eventid = apexpages.currentpage().getParameters().get('eid');
 
  
 
 
 public QR_event__c eventInformation{get;set;}
 
 

    public AttendeeSelfRegistrationCon(ApexPages.StandardController controller) {

    AtSummary = (QR_AttendeeSummary__c)controller.getRecord();
    
    AtSummary1 = [select Attendee_NAICS_Code1__c,Attendee_NAICS_Code2__c,Attendee_NAICS_Code3__c from QR_AttendeeSummary__c where id=:attid];
    
    NaicsCode1 = String.ValueOf(AtSummary1.Attendee_NAICS_Code1__c);
    NaicsCode2 = String.ValueOf(AtSummary1.Attendee_NAICS_Code2__c);
    NaicsCode3 = String.ValueOf(AtSummary1.Attendee_NAICS_Code3__c);
    
    System.debug('@@@@@AtSummaryFirst'+AtSummary );
 


    if(AtSummary.Attendee_Registration_type__c != NULL){
       if(AtSummary.Attendee_Registration_type__c.contains('Full Convention'))
       RegValu0 = True;
       if(AtSummary.Attendee_Registration_type__c.contains('Reception'))
       RegValu1 = True;
       if(AtSummary.Attendee_Registration_type__c.contains('Tuesday Pass'))
       RegValu2 = True;
      }

   System.debug('@@@@@Eventid'+Eventid);
   
 eventInformation = [Select id,End_Date__c,End_Time__c,Event_HostedByEventBrite__c,Event_HostingAddress1__c,Event_HostingAddress2__c,Event_HostingCity__c,Event_HostingLocation__c,
            Event_HostingNewState__c,Event_HostingOrganization__c,Event_HostingTimeZone__c,Event_PhoneNumber__c,Event_POBox__c,Event_NewPrimaryCategory__c,Event_Newsecondarycategory__c,Event_Status1__c,Event_Title__c,Event_WebsiteURL__c,Event_ZipCode__c,Eventadmin_Id__c,Event_FaxNumber__c,NewEvent_Details__c,Start_Date__c,Start_Time__c
                        from  QR_event__c where id =:Eventid];
    
    
    
    
    welcomeNote = true;
    
    out_variable = false;
    
    eventInfo = false;
   
    eventSchedule = false;
    
    
    System.debug('@@@@@AtSummary'+AtSummary );
   
    
        Options= new List<selectoption>();
        Options.add(new SelectOption('None','--None--'));
        Options.add(new SelectOption('AL','Alabama'));
        Options.add(new SelectOption('AK', 'Alaska'));
        Options.add(new SelectOption('AZ','Arizona'));
        Options.add(new SelectOption('AR','Arkansas'));
        Options.add(new SelectOption('CA','California'));
        Options.add(new SelectOption('CO','Colorado'));
        Options.add(new SelectOption('CT','Connecticut'));
        Options.add(new SelectOption('DE','Delaware'));
        Options.add(new SelectOption('DC','District of Columbia'));
        Options.add(new SelectOption('FL','Florida'));
        Options.add(new SelectOption('GA','Georgia'));
        Options.add(new SelectOption('HI','Hawaii'));
        Options.add(new SelectOption('ID','Idaho'));
        Options.add(new SelectOption('IL','Illinois'));
        Options.add(new SelectOption('IN','Indiana'));
        Options.add(new SelectOption('IA','Iowa'));
        Options.add(new SelectOption('KS','Kansas'));
        Options.add(new SelectOption('KY','Kentucky'));
        Options.add(new SelectOption('LA','Louisiana'));
        Options.add(new SelectOption('ME','Maine'));
        Options.add(new SelectOption('MD','Maryland'));
        Options.add(new SelectOption('MA','Massachusetts'));
        Options.add(new SelectOption('MI','Michigan'));
        Options.add(new SelectOption('MN','Minnesota'));
        Options.add(new SelectOption('MS','Mississippi'));
        Options.add(new SelectOption('MO','Missouri'));
        Options.add(new SelectOption('MT','Montana'));
        Options.add(new SelectOption('NE','Nebraska'));
        Options.add(new SelectOption('NV','Nevada'));
        Options.add(new SelectOption('NH','New Hampshire'));
        Options.add(new SelectOption('NJ','New Jersey'));
        Options.add(new SelectOption('NM','New Mexico'));
        Options.add(new SelectOption('NY','New York'));
        Options.add(new SelectOption('NC','North Carolina'));
        Options.add(new SelectOption('ND','North Dakota'));
        Options.add(new SelectOption('OH','Ohio'));
        Options.add(new SelectOption('OK','Oklahoma'));
        Options.add(new SelectOption('OR','Oregon'));
        Options.add(new SelectOption('PA','Pennsylvania'));
        Options.add(new SelectOption('RI','Rhode Island'));
        Options.add(new SelectOption('SC','South Carolina'));
        Options.add(new SelectOption('SD','South Dakota'));
        Options.add(new SelectOption('TN','Tennessee'));
        Options.add(new SelectOption('TX','Texas'));
        Options.add(new SelectOption('UT','Utah'));
        Options.add(new SelectOption('VT','Vermont'));
        Options.add(new SelectOption('VA','Virginia'));
        Options.add(new SelectOption('WA','Washington'));
        Options.add(new SelectOption('WV','West Virginia'));
        Options.add(new SelectOption('WI','Wisconsin'));
        Options.add(new SelectOption('WY','Wyoming'));

    }


  public pagereference submit(){
  
  
  
        RegTypeList = new List<String>();    
        if(RegValu0 == True)
        RegTypeList.add('Full Convention');
        if(RegValu1 == True)    
        RegTypeList.add('Tuesday Pass');
        if(RegValu2 == True)    
        RegTypeList.add('Reception');
    
         RegTypevalues= '';
        for(String R: RegTypeList)
        {
        RegTypevalues+=R+',';
        
        }   
  
    AtSummary.Attendee_Registration_type__c = RegTypevalues;
    
      System.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@@NaicsCode1'+NaicsCode1);
      System.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@@NaicsCode2'+NaicsCode2);
      System.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@@NaicsCode3'+NaicsCode3);
      
     if(NaicsCode1 ==''){
    AtSummary.Attendee_NAICS_Code1__c =null;
    
    }
  
    if(NaicsCode2 == ''){
    AtSummary.Attendee_NAICS_Code2__c =null;
    }
    
    if(NaicsCode3 == ''){
    AtSummary.Attendee_NAICS_Code3__c = null;
    } 
    
    if(NaicsCode1 !=''){
    AtSummary.Attendee_NAICS_Code1__c = integer.ValueOf(NaicsCode1);
    
    }
    if(NaicsCode2 != ''){
    AtSummary.Attendee_NAICS_Code2__c = integer.ValueOf(NaicsCode2);
    }
    
    if(NaicsCode3 != ''){
    AtSummary.Attendee_NAICS_Code3__c = integer.ValueOf(NaicsCode3);
    }
   System.debug('@@@@@AtSummaryTest1'+AtSummary );
   
   try{
  update AtSummary;
  System.debug('@@@@@AtSummaryTest2'+AtSummary );
      }
      
    catch(exception ex){
       ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,ex.getMessage());
           ApexPages.addMessage(myMsg);
         out_variable = false;
          return null;
    
    }    
    out_variable = true;
    
    
  return null;
  
  }


public pagereference cancel(){




pagereference pf = new pagereference('http://www.boothleads.com');

pf.setRedirect(true);

return pf;


}


public pagereference Check(){


pagereference pf = new pagereference('http://www.boothleads.com');

pf.setRedirect(true);

return pf;




return null;
}



public pagereference EventClose(){

 eventInfo = false; 

return null;

}

public pagereference EventClose2(){

 eventSchedule = false; 

return null;

}

public pagereference UpdateProfile(){

welcomeNote = false;
return null;





}

public pagereference UpdateProfile1(){
pagereference pf = new pagereference('http://www.boothleads.com');

pf.setRedirect(true);

return pf;

}
public pagereference eventDetails(){

eventInfo = true; 

return null;

}


 static testmethod void testsolution(){

 QR_AttendeeSummary__c QRA = new QR_AttendeeSummary__c();
 
   
    
    QRA.Attendee_FirstName__c = 'Venkaetsh';
    
    QRA.Attendee_LastName__c ='Puppala';
    
    QRA.Attendee_EmailId__c ='venkaetsh@globalnest.com';  
  
    QRA.Attendee_Company__c ='Globalnest LLC'; 
    
    QRA.Attendee_NAICS_Code1__c = 123456;
    
    QRA.Attendee_NAICS_Code2__c = 123456;
    
     QRA.Attendee_NAICS_Code3__c = 123456;
    

    insert QRA; 
    
    
    QR_Event__c QRE= new QR_Event__c();
    
   QRE.Start_Date__c = date.today();

   QRE.End_Date__c =  date.today();
   
  QRE.Event_HostingTimeZone__c='Central Time(USA)';
   
   QRE.Event_Title__c = 'TestMethod Event';
     
    insert QRE;
    
    apexpages.currentpage().getparameters().put('eid' , QRE.id);
    
     apexpages.currentpage().getparameters().put('id' , QRA.id);
    
   ApexPages.StandardController  controller = new ApexPages.StandardController (QRA); 
   
    
    
    
    AttendeeSelfRegistrationCon  bsExt = new AttendeeSelfRegistrationCon(controller);
    
    Test.setCurrentPageReference(new PageReference('AttendeeSelfRegistration')); 
   
   System.currentPageReference().getParameters().put('id', QRA.id);
   
    System.currentPageReference().getParameters().put('eid', QRE.id);
    
    
    
    bsExt.submit();
    
      bsExt.eventDetails();
        bsExt.UpdateProfile();
          bsExt.EventClose2();
            bsExt.EventClose();
              bsExt.Check();
                bsExt.cancel();
                  bsExt.eventschedule();
                   bsExt.eventinfo();


}


}