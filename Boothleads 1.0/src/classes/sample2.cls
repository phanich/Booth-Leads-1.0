public with sharing class sample2 {
public string x{get;set;}
public boolean logo{get;set;}
public attachment attach{get;set;}
public QR_AttendeeSummary__c details{get;set;}

public sample2(){
x =ApexPages.currentPage().getParameters().get('id');
details=[select Attendee_LastName__c,Attendee_FirstName__c,
         Event_Id__r.Event_Title__c ,Attendee_Company__c,
         Event_Id__r.Start_Date__c,Event_Id__r.Start_Time__c,
         Event_Id__r.End_Date__c, Event_Id__r.End_Time__c,
         (select parentid,name from attachments)
         from QR_AttendeeSummary__c where Attendee_Barcode3__c =:x];

   try{
          attach=[select parentid,name from attachment where parentid =:details.Event_Id__r.id];
          logo=true;
          }
          catch(exception e){
          logo=false;
          }
}






static testMethod void emailtes(){
Profile p = [select id,name FROM profile where name='Standard User'];

User us = new User(alias = 'test123', email='test123@noemail.com',
emailencodingkey='UTF-8',profileid = p.Id, lastname='Testing', languagelocalekey='en_US',
localesidkey='en_US',country='United States',
timezonesidkey='America/Los_Angeles', username='test123@noemail.com');
insert us;
QR_AttendeeSummary__c att=new   QR_AttendeeSummary__c(Attendee_LastName__c='nagandla',Attendee_FirstName__c='munny',
                                            Attendee_Company__c='Globalnest',Attendee_EmailId__c='mythili.nagandla@gmail.com');
    insert att;                                        
  string ff = att.id;
 QR_AttendeeSummary__c attendee = new QR_AttendeeSummary__c();
  attendee  = [select Attendee_LastName__c,Attendee_FirstName__c,Name,Attendee_Barcode3__c,
         Event_Id__r.Event_Title__c ,Attendee_Company__c,
         Event_Id__r.Start_Date__c,Event_Id__r.Start_Time__c,
         Event_Id__r.End_Date__c, Event_Id__r.End_Time__c,
         (select parentid,name from attachments)
         from QR_AttendeeSummary__c where id=:ff  limit 1];
  
  system.debug('hyyyyyyyyyyyyyyyyy'+attendee.name);
  system.debug('byyyyyyyyyyyyyyyyy'+attendee.Attendee_Barcode3__c);
  
   pagereference pg =page.qrcode_emailtoattendee;
  test.setCurrentpage(pg);
  ApexPages.currentPage().getParameters().put('id',attendee.Name);
  sample2 estesting=new sample2();


}
}