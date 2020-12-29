trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    
    List<Task> taskList = new List<Task>();
    
    for(Opportunity opp: Trigger.New) {
        if(opp.StageName == 'Closed Won') {
            tasklist.add(new task(Subject='Follow Up Test Task',
                                  WhatId=opp.Id));
        }
    }
    
    if(taskList.size() > 0){
        insert taskList; 
    }
    
}