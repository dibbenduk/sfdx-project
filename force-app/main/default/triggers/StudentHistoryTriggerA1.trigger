trigger StudentHistoryTriggerA1 on Student__c (before update) {
    
    List<Student__c> StdNew = Trigger.New;
    List<Student__c> StdOld = Trigger.Old;
	System.debug(stdNew);
	System.debug(stdOld);    
    StudentTriggerHandler.StudentHistory(StdNew, StdOld);
    
}