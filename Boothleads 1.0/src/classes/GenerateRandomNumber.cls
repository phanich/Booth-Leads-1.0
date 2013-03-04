Public Class GenerateRandomNumber{

    private MAP<String, QR_BoothPersonnel__c> myBoothPersonnelRandomNumber{get; set;}
    

    public String GenerateRandomNumber(){
        
        
        myBoothPersonnelRandomNumber = new MAP<String, QR_BoothPersonnel__c>();
     
     LIST<QR_BoothPersonnel__c> beforeCheckBoothPersonnelRN = new LIST<QR_BoothPersonnel__c>([SELECT ID, NAME,BoothPersonnel_EmailId__c, Random_Number__c FROM QR_BoothPersonnel__c WHERE Random_Number__c != null]);
    
     for(QR_BoothPersonnel__c Ind: beforeCheckBoothPersonnelRN){
          
          system.debug('11111111111111111111111   '+ Ind.Random_Number__c );
          
         if(!myBoothPersonnelRandomNumber.containsKey(Ind.Random_Number__c)){
             myBoothPersonnelRandomNumber.put(Ind.Random_Number__c, Ind);
            } 
         else{}
      } 
        
        
       String cryptoString;
        
        Boolean checkAlreadyExiest = FALSE;
        do{
           cryptoString = String.ValueOf(crypto.getRandomLong()).subString(2,6);
           
           system.debug('2222222222222222222   '+cryptoString );
            system.debug('333333333333333333   '+myBoothPersonnelRandomNumber.containsKey(cryptoString));
           if(!myBoothPersonnelRandomNumber.containsKey(cryptoString))
                      checkAlreadyExiest = FALSE;  
           else
                checkAlreadyExiest = TRUE;
                   
         }While(checkAlreadyExiest);  
          
    return cryptoString;
    
    
    
    }
    static testMethod void myUnitTest() {
    
    QR_BoothPersonnel__c boothPersonal = new QR_BoothPersonnel__c(BoothPersonnel_FirstName__c='firstName',BoothPersonnel_LastName__c='lastName',BoothPersonnel_EmailId__c='testBoothpersonal@gmail.com',Random_Number__c='1001');
   insert boothPersonal;
    
    GenerateRandomNumber rt = new GenerateRandomNumber();
    rt.GenerateRandomNumber();
    
    }



}