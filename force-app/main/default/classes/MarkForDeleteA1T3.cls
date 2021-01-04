public with sharing class MarkForDeleteA1T3 implements Database.Batchable<sObject>, Database.Stateful{
    
    public Integer recordsProcessed;
    public Map<Id, Integer> CreatedById_Records = new Map<Id, Integer>();
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        date d = date.today() - 2;
        //String dt = String.valueOf(d);
        
        String query = 'SELECT Id, Is_Registration_Completed__c, CreatedOn__c, Mark_For_Delete__c, CreatedById ' +
            'FROM Student__c ' +
            'WHERE Is_Registration_Completed__c = false ' +
            'AND createdOn__c <= :d ';
        
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc, List<Student__c> stdList){
        
        List<Student__c> stdToUpdate = new List<Student__c>();
        for(Student__c std : stdList) {
            std.Mark_For_Delete__c = 'Yes';
            stdToUpdate.add(std);
            recordsProcessed = CreatedById_Records.get(std.CreatedById);
            if(recordsProcessed != null) {           //check if it is a new record
                recordsProcessed += 1;
            }
            else {
                recordsProcessed = 1;
            }
            CreatedById_Records.put(std.CreatedById, recordsProcessed);
        }
        
        System.debug(stdToUpdate);        
        update stdToUpdate;
    }
    
    public void finish(Database.BatchableContext bc){
        System.debug('Total records processed : ' + recordsProcessed);
        Map<Id, User> userEmailMap = new Map<Id, User>([SELECT email FROM User]);
        
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        
        for(Id creatorId : CreatedById_Records.keySet()) {
        	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            
            List<String> sendToEmail = new List<String>();
            String e = userEmailMap.get(creatorId).email;
            sendToEmail.add(e);
            mail.setToAddresses(sendToEmail);

            mail.setReplyTo('rubick@valve.com');
            mail.setSenderDisplayName('VALVE CORPORATION');
            mail.setSubject('Some records are marked for delete');
            mail.setHtmlBody(CreatedById_Records.get(creatorId) + ' records are marked for delete');
            mails.add(mail);
            System.debug(mail);
        }
        
        Messaging.sendEmail(mails);
        System.debug(mails);
    }
}