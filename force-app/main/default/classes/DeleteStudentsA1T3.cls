public with sharing class DeleteStudentsA1T3 implements Database.Batchable<sObject>, Database.Stateful {

    public Integer recordsProcessed = 0;
    public Map<Id, Integer> CreatedById_Records = new Map<Id, Integer>();

    public Database.QueryLocator start(Database.BatchableContext bc) {
           
        String query = 'SELECT Id, Mark_For_Delete__c, createdById ' +
            'FROM Student__c ' +
            'WHERE Mark_For_Delete__c = \'Yes\' ';
        
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc, List<Student__c> stdList){
        
        List<Student__c> stdToDel = new List<Student__c>();
        for(Student__c std : stdList) {
            stdToDel.add(std);
            recordsProcessed = CreatedById_Records.get(std.CreatedById);
            if(recordsProcessed != null) {          //check if it is a new record
                recordsProcessed += 1;
            }
            else {
                recordsProcessed = 1;
            }
            CreatedById_Records.put(std.CreatedById, recordsProcessed);
        }
        
        System.debug(stdToDel);        
        delete stdToDel;
    }
    
    public void finish(Database.BatchableContext bc){
        System.debug('Total records deleted : ' + recordsProcessed);
        Map<Id, User> userEmailMap = new Map<Id, User>([SELECT email FROM User]);
        
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        
        for(Id creatorId : CreatedById_Records.keySet()) {
        	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            List<String> sendToEmail = new List<String>();
            String e = userEmailMap.get(creatorId).email;
            sendToEmail.add(e);
            mail.setToAddresses(sendToEmail);

            mail.setReplyTo('rubick@salesforce.com');
            mail.setSenderDisplayName('SALESFORCE CORP.');
            mail.setSubject('Some Records deleted');
            mail.setHtmlBody(CreatedById_Records.get(creatorId) + ' records are marked for delete. ' + 
                            'This mail is in continuation with previous mail for marked for deletion. ' +
                            'Thanks & Regards,' +
                            'Yours Truly SFDC');
            mails.add(mail);
            System.debug(mail);
        }
        
        Messaging.sendEmail(mails);
        System.debug(mails);
    }
}
