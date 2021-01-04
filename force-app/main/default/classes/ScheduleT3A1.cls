public with sharing class ScheduleT3A1 implements Schedulable {
    
    public void execute(SchedulableContext ctx) {
        
        MarkForDeleteA1T3 myBatchObject = new MarkForDeleteA1T3();
        Id batchId = Database.executeBatch(myBatchObject);
        System.debug(batchId);
        
    }

}
