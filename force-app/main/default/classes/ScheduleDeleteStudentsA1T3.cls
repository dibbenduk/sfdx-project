public with sharing class ScheduleDeleteStudentsA1T3 implements Schedulable {
    
    public void execute(SchedulableContext ctx) {
        
        DeleteStudentsA1T3 myBatchObject = new DeleteStudentsA1T3();
        Id batchId = Database.executeBatch(myBatchObject);
        System.debug(batchId);
        
    }
}
