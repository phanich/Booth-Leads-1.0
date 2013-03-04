public with sharing class QRcode_Boothadmin_boothCon {


public Pagereference checkUserId()
{
system.debug('hhhhhhhhhhhhhhhhhhhhh'+UserInfo.getUserId());

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



    public PageReference Printaspdf() {
    pagereference pf=page.BL_booth_Qrcode;
     return pf;
    }


    public String code { get; set; }

    public boolean displayPopUpForQRCODE { get; set; }

    public PageReference printqrcode() {
    
    displayPopUpForGridDetail =false; 
     string url= 'https://'+ApexPages.currentPage().getHeaders().get('Host')+'/apex/siteGuestUser?id='+boothdetail.id+'&VId=1';
     

    system.debug('site Urlllllllllllllll  '+url);
    String encoded = EncodingUtil.urlEncode(url, 'UTF-8');   
    code=encoded;
     displayPopUpForQRCODE=true;
    
        return null;
    }


    public PageReference SaveandPrint() {
    savePopupValues();
    boothdetail= new QR_BoothAdmin__c();
    boothdetail= [select id,BoothAdmin_Organization_Name__c,Booth_Contact_Name__c,Booth_Contact_Email__c,Booth_Contact_Phone__c,Booth_RegistrationLink__c,(select Id, Title, IsNote from NotesAndAttachments)    from QR_BoothAdmin__c where id=:addbooth.id];
    printqrcode();
    
        return null;
    }


  
public String eventName { get; set; }
public QR_BoothAdmin__c addBooth{get;set;}
public QR_BoothAdmin__c  boothdetail{get;set;}
public boolean displayPopUpForGridDetail {get;set;}
public List<QR_BoothAdmin__c> boothDisplay{get;set;}
public boolean displayAddButton{get;set;}
public boolean displayPopUpForGrid{get;set;} 
public transient Blob broacher { get; set; }
public String attendeeNameAfterEdit { get; set; }


 public QRcode_Boothadmin_boothCon(){
 getfirstCall();
}


public void getfirstCall(){
boothDisplay  = new List<QR_BoothAdmin__c>();
 displayAddButton  =false;
 addbooth  = new QR_BoothAdmin__c();
 addbooth =[select id,BoothAdmin_Organization_Name__c,Booth_Contact_Name__c,Booth_Contact_Email__c,Booth_Contact_Phone__c,Booth_RegistrationLink__c,(select Id, Title, IsNote from NotesAndAttachments)    from QR_BoothAdmin__c where BoothAdmin_EmailId__c =:userInfo.getuserName()];
 if(addbooth.Booth_Contact_Name__c ==null && addbooth.Booth_Contact_Email__c==null && addbooth.Booth_Contact_Phone__c ==null && addbooth.Booth_RegistrationLink__c==null){
 displayAddButton = true;
 }else{
 boothDisplay.add(addbooth);
}

}



public PageReference closePopupdetail() {
    displayPopUpForGridDetail =false;
     displayPopUpForQRCODE=false;
        return null;
    }


    public PageReference getEventDetails() {
    boothdetail= new QR_BoothAdmin__c();
     displayPopUpForGridDetail =true;
     
    if(eventName !=null && eventName !=''){
    string [] dt = new string[]{};
    dt=eventName.split(',');
    system.debug('hi iiiiiiiiiiiiiiiii  '+dt[1]);    
    boothdetail=[select id,BoothAdmin_Organization_Name__c,Booth_Contact_Name__c,Booth_Contact_Email__c,Booth_Contact_Phone__c,Booth_RegistrationLink__c,PDF_Location__c from QR_BoothAdmin__c where id=:dt[1] limit 1];
    }
     return null;
    }


public PageReference closePopup1() {
displayPopUpForGrid  =false;
        return null;
    }


public PageReference deleteAdminRecord() {

 if(eventName !=null && eventName !=''){
 
 
  addbooth =[select id,BoothAdmin_Organization_Name__c,Booth_Contact_Name__c,Booth_Contact_Email__c,Booth_Contact_Phone__c,Booth_RegistrationLink__c,PDF_Location__c    from QR_BoothAdmin__c where id=:eventName];
  }
   
   List<attachment> a = new List<attachment>();
    a =[select Id from attachment where parentId=:addbooth.id limit 1];
    
    if(a.size()>0){
    
    delete a;
    }
    if(addbooth != null){
    addbooth.PDF_Location__c=null;
    addbooth.Booth_RegistrationLink__c =null;
    addbooth.Booth_Contact_Email__c=null;
    addbooth.Booth_Contact_Phone__c =null;
    addbooth.Booth_Contact_Name__c =null;
    update addbooth;
    }
    
  
 getfirstCall();
 return null;
    }

public void editAttendees() {
  
  addbooth  = new QR_BoothAdmin__c();
    if(eventName !=null || eventName !=''){
   addbooth =[select id,BoothAdmin_Organization_Name__c,Booth_Contact_Name__c,Booth_Contact_Email__c,Booth_Contact_Phone__c,Booth_RegistrationLink__c,PDF_Location__c    from QR_BoothAdmin__c where id=:eventName];
  }
    displayPopUpForGrid  =true;
 }


public PageReference savePopupValues() {

if(addbooth !=null){


/**
List<attachment> attList =[select id,name from attachment where parentId=:addbooth.id and (name='iPhonecontact.ics' or name='Android.Vcf') ];
if(attList.size()>0){
delete attList;
}
system.debug('11111111111111111111111   '+addBooth);

     string trertr ='BEGIN:VCARD\n'+ 'VERSION:3.0\n'+ 'N:'+addbooth.Booth_Contact_Name__c+';;;\n'+'FN:'+addbooth.Booth_Contact_Name__c+'\n'+'EMAIL;type=INTERNET;type=WORK;type=pref:'+addbooth.Booth_Contact_Email__c+'\n'+
     'TEL;type=CELL;type=VOICE;type=pref:'+addbooth.Booth_Contact_Phone__c+'\n'+'ORG:'+addbooth.BoothAdmin_Organization_Name__c+'\n'+
     'END:VCARD';
      Blob androidBlob = Blob.valueOf(trertr);
    attachment androidAttach= new attachment();
    androidAttach.parentId =addbooth.Id;
    androidAttach.body =androidBlob;
     androidAttach.Name ='Android.Vcf';
    insert androidAttach;
system.debug('11111111111111111111111   '+androidAttach);


     string paramvalue = EncodingUtil.base64Encode(androidBlob);
 string s= 'BEGIN:VCALENDAR\n'+
     'VERSION:2.0\n'+
     'BEGIN:VEVENT\n'+
     'DTSTART;TZID=Europe/London:20120708T220000\n'+
     'DTEND;TZID=Europe/London:20120708T230000\n'+
     'SUMMARY:Click to download contact to your address book\n'+
     'DTSTAMP:20120708T203910Z\n'+
     'ATTACH;VALUE=BINARY;ENCODING=BASE64;FMTTYPE=text/directory;\n'+
     ' X-APPLE-FILENAME=iphonecontact.vcf:\n'+' '+paramvalue+'\n'+
     'END:VEVENT\n'+
     'END:VCALENDAR';
      blob iphoneblob = blob.valueOf(s);
      attachment iphoneattach = new attachment();
      iphoneattach.name='iPhonecontact.ics';
      iphoneattach.Body = iphoneblob; 
      iphoneattach.parentId =addbooth.id;
      insert iphoneattach;
 
system.debug('222222222222222222222222222222 '+iphoneattach);
**/
   
if(broacher != null){
system.debug('rkkkkkkkkkkkkkkkkkkkkkkkkkk '+broacher.size());
if(broacher.size()<5200000){
attachment attach = new attachment();
    
  List<attachment> a = new List<attachment>();
  
  a=[select id from attachment where parentId=:addbooth.id];
 system.debug('hyyyyyyyyyyyyyyyyyyyyyyyyy  '+a); 
  if(a.size()>0){
  delete a;
  }
  
 
  attach.Name =attendeeNameAfterEdit;
  attach.ParentId=addbooth.id;
  
  
  attach.body =broacher;
  //attach.contentType='application/pdf/force-download';
 // string paramvalue = EncodingUtil.base64Encode(androidBlob);
  insert attach;
  addbooth.PDF_Location__c=attach.id;
   }
     }
    addbooth.Booth_Contact_Name__c=addbooth.Booth_Contact_Name__c;
    addbooth.Booth_Contact_Email__c=addbooth.Booth_Contact_Email__c;
    addbooth.Booth_Contact_Phone__c =addbooth.Booth_Contact_Phone__c;
    addbooth.Booth_RegistrationLink__c =addbooth.Booth_RegistrationLink__c;
    update addbooth;
    broacher = null;

displayPopUpForGrid =false;
getfirstCall();


 }




  return null;
}


    

    public PageReference addValuestoQrcode() {
    displayPopUpForGrid =true;
     return null;
    }
 


 

    public PageReference boothQrcodetab() {
     
        return  null;
       }



Public Boolean HelpPopUp{get;set;}

public PageReference profileaction() {

    Pagereference pg = new pagereference('/apex/QRcode_BoothAdmin_Profileupdate');
    pg.setredirect(true);
    return pg;
       
    }
    
   Public void Help(){
    HelpPopUp = True;
    }
    Public Void CloseHelppopup(){
    HelpPopUp = false;
    }   
    
    public PageReference EventAction() {
    pagereference pg = new pagereference('/apex/QRCode_BoothadminEventsph');
    pg.setredirect(true);
        return pg;
       
    }
  public PageReference Customeraction() {
    pagereference pg = new pagereference('/apex/QRCode_Boothadmin_Personnelsph');
    pg.setredirect(true);
        return pg;
    }
  public PageReference AttendeesAction() {
    pagereference pg = new pagereference('/apex/Boothadmin_Attendeesph');
    pg.setredirect(true);
        return pg;
        
    }
public PageReference Reportsaction() {
    pagereference pg = new pagereference('/apex/QRcode_Boothadmin_Reportsph');
    pg.setredirect(true);
        return pg;
        
    }
    
    
    
   // --------------------------- Test Class Begin -------------------- --> 
    
    static testMethod void myUnitTest() {
   
    user siteGueUsr =[select id from user where id='00590000000zKNlAAM'];
    
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
    
    
     QR_BoothAdmin__c t = new QR_BoothAdmin__c(BoothAdmin_FirstName__c='testboothadminfirstname',BoothAdmin_Organization_Name__c='testboothadminorganiname',BoothAdmin_LastName__c='testboothlastmname',BoothAdmin_EmailId__c='test123@noemail.com',Event_Id__c=x.id);
      insert t;
    
     QR_BoothAdmin__c t2 = new QR_BoothAdmin__c(BoothAdmin_FirstName__c='testboothadminfirstname',BoothAdmin_Organization_Name__c='testboothadminorganiname',BoothAdmin_LastName__c='testboothlastmname',BoothAdmin_EmailId__c='test1232@noemail.com',Event_Id__c=x.id);
      insert t2;
    
    system.runas(u){
     QRcode_Boothadmin_boothCon Qr = new QRcode_Boothadmin_boothCon();
     Qr.Reportsaction();
     Qr.AttendeesAction();
     Qr.Customeraction();
     Qr.EventAction();
     Qr.CloseHelppopup();
     Qr.Help();
     Qr.profileaction();
     Qr.eventName =t.id;
     Qr.editAttendees();
     Qr.eventName ='phani,'+t.id;
     Qr.getEventDetails();
     Qr.Printaspdf();
     Qr.printqrcode();
     Qr.broacher =blob.valueOf('t1,t2,t3');
     Qr.attendeeNameAfterEdit ='phani';
     Qr.SaveandPrint();
     Qr.closePopupdetail();
     Qr.closePopup1();
     Qr.addValuestoQrcode();
     Qr.boothQrcodetab();
     Qr.eventName =t2.id;
     Qr.deleteAdminRecord();
     
     system.runas(siteGueUsr){
       Qr.checkUserId();
    }
    }
    
    }

}