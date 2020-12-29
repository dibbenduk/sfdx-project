public class StudentTriggerHandler {
    public static void StudentHistory(List<Student__c> StdNew, List<Student__c> StdOld) {
        
        List<Student_History__c> stdHistory = new List<Student_History__c>();
        SObjectType accountType = Schema.getGlobalDescribe().get('Student__c');
        Map<String,Schema.SObjectField> mfields = accountType.getDescribe().fields.getMap();    
        List<Schema.SObjectField> str = mfields.values();
        
        for(Integer i=0; i<StdNew.size(); i++) {
            for(Integer j=0; j<str.size(); j++) {
                if(StdNew[i].get(str[j]) != StdOld[i].get(str[j])) {
                    
                    Student_History__c std = new Student_History__c();                    
                    std.Name = String.valueOf(str[j]);
                    
                    //Handle insertions for empty/new fields
                    String oldVal = String.valueOf(StdOld[i].get(str[j]));
                    String newVal = String.valueOf(StdNew[i].get(str[j]));
                    if(oldVal == null) {
                        std.Old_Value__c = 'NULL';
                    }
                    else {
                        std.Old_Value__c = oldVal;
                    }
                    if(newVal == null) {
                        std.New_Value__c = 'NULL';
                    }
                    else{
                        std.New_Value__c = newVal;
                    }
                    
                    
                    std.Record_Id__c = StdNew[i].Id;
                    
                    stdHistory.add(std);
                }
            }        
        }        
        System.debug(stdHistory);
        if (stdHistory.size() > 0) {
            insert stdHistory;
        }
    }
}