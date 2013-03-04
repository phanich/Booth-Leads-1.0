public with sharing class siteGuestUserCon {

  
 public  string email {get;set;}
 public string companyName{get;set;}
 public boolean displayPopUppdf { get; set; }
 public String attId { get; set; }
 public QR_BoothAdmin__c booth{get;set;}
 public attachment att{get;set;}
 public boolean displayPopUp { get; set; }
 public string emailOfuser{get;set;}
 public string rere{get;set;}



public PageReference cancel() {
    displayPopUp =false;
        return null;
    }




public string strBlank{get;set;}
public PageReference Redirect() {
string sLink = '';
system.debug('hiiiiiiiiiiii '+booth);
 system.debug('hiiiiiiiiiiii 22 '+booth.Booth_RegistrationLink__c);
 sLink  = booth.Booth_RegistrationLink__c;
string linkValue;
system.debug('hiiiiiiiiiiii 44 '+sLink);
if(sLink  != null){
strBlank='_blank';
if(sLink.contains('http://')){
linkValue = sLink;
}else{
linkValue ='http://'+sLink;

}
PageReference pageRef = new PageReference(linkValue);
pageRef.setRedirect(true);

return pageRef ;
}else{
return null;
}


}



Public Pagereference login(){ 

 string boothvId =ApexPages.currentPage().getParameters().get('VId');
  
 if(boothvId =='1'){
 string boothId =ApexPages.currentPage().getParameters().get('Id');
 system.debug('hiiiiiiiiiiii 1111111111 '+boothId);
 
         string password = 'global281';
          string Loginname = 'support@boothleads.com';
          string sss ='/apex/siteGuestUser?id='+boothId+'&VId=2';
          return Site.login(loginname, password, sss);
          }        
         else{ 
         QueryContactInformation();
              return null;
     }

      return null;
}


public string iphonedownload {get;set;}
public string anDroidDownload{get;set;}
public string browcherDownload{get;set;}

public void QueryContactInformation(){
booth  = new QR_BoothAdmin__c();
  string boothId =ApexPages.currentPage().getParameters().get('Id');
  booth = [select BoothAdmin_EmailId__c,id,BoothAdmin_Organization_Name__c,Booth_Contact_Name__c,Booth_Contact_Email__c,Booth_Contact_Phone__c,Booth_RegistrationLink__c from QR_BoothAdmin__c where id=:boothId];
 
 
 att = [select id,Name,ContentType from attachment where parentId=:booth.Id limit 1];
 attId=att.id;
 string content =att.ContentType;
 system.debug('888888888888888888888888888 '+content);
  companyName =booth.BoothAdmin_Organization_Name__c; 
 }


    public PageReference PopupDisplay() {
    displayPopUp =true;
  
        return null;
    }


    public PageReference emailCFV() {
    rere='';
   emailOfuser = Apexpages.currentPage().getParameters().get('one');
     
    String userAgent = ApexPages.currentPage().getHeaders().get('User-Agent');
     Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
    
    system.debug('pppppppppppppppp '+emailOfuser );
    
    
    if (userAgent.contains('iPhone')){
    system.debug('11111111111111111 ');
        rere = 'iPhone-Safari';
    }else if (userAgent.contains('Android')){
     system.debug('22222222222222');
       rere= 'Android';
    }else if (userAgent.contains('BlackBerry')){
     system.debug('33333333333333333');
         rere='BlackBerry';
    }else if (userAgent.contains('Safari')){
          system.debug('44444444444444444444');
         rere='Safari';
         }else if (userAgent.contains('Chrome')){
          system.debug('5555555555555555555555');
         rere='Chrome';
         }else if (userAgent.contains('mozila')){
          system.debug('6666666666666666666666666');
         rere='Firefox';
         }
    
    
   system.debug('tyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy '+rere);
  if (rere =='iPhone-Safari' || rere =='Safari'){
    
     string trertr ='BEGIN:VCARD\n'+ 'VERSION:3.0\n'+ 'N:'+ booth.Booth_Contact_Name__c+';;;\n'+'FN:'+ booth.Booth_Contact_Name__c+'\n'+'EMAIL;type=INTERNET;type=WORK;type=pref:'+booth.Booth_Contact_Email__c+'\n'+
     'TEL;type=CELL;type=VOICE;type=pref:'+booth.Booth_Contact_Phone__c +'\n'+'ORG:'+booth.BoothAdmin_Organization_Name__c+'\n'+
     'END:VCARD';
     Blob beforeblob = Blob.valueOf(trertr);
     string paramvalue = EncodingUtil.base64Encode(beforeblob);
     
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
      blob b = blob.valueOf(s);
      attach.setFileName('iPhonecontact.ics');
      //attach.setContentType('application/pdf');
      attach.setInline(false);
      attach.Body = b; 
       
    }else{
    
   
    string trertr ='BEGIN:VCARD\n'+ 'VERSION:3.0\n'+ 'N:'+booth.Booth_Contact_Name__c+';;;\n'+'FN:'+booth.Booth_Contact_Name__c+'\n'+'EMAIL;type=INTERNET;type=WORK;type=pref:'+booth.Booth_Contact_Email__c+'\n'+
     'TEL;type=CELL;type=VOICE;type=pref:'+booth.Booth_Contact_Phone__c +'\n'+'ORG:'+booth.BoothAdmin_Organization_Name__c+'\n'+
     'END:VCARD';
     Blob beforeblob = Blob.valueOf(trertr);
    
      attach.setFileName('Android.Vcf');
      attach.setInline(false);
      attach.Body = beforeblob ;
    }
 
 
String emailMessage =  'Dear Attendee,' +'<br/><br/>'+'Attached is the contact information as you have requested by scanning the booth QRCode at booth '+companyName+'.'+ '<br/><br/>'+'Thank you,'+ 
'<br /><br />'+'BoothLeads Customer Support' +'<br />'+'support@boothleads.com';
     


  
    
 Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    mail.setUseSignature(false);
    mail.setToAddresses(new String[] { emailOfuser });
    mail.setSubject(companyName +' Contact Info');
    mail.setHtmlBody(emailMessage);
    mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attach }); 
   Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
   
  displayPopUp=false;  
        return null;
    }
}