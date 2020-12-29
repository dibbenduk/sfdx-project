@isTest
public class TestStudentHistoryTrigger {
    @isTest static void TestChangeClass() {
        StudentDataFactory.insertRandomStudents(2);
        List<Student__c> stdToUpdate = [SELECT Class__c
                                        FROM Student__c
                                        WHERE Name 
                                        LIKE 'Student%'];
        
        for(Student__c std: stdToUpdate) {
            std.Class__c = 'Updated Class';
        }

        Update stdToUpdate;            
        
        List<Student_History__c> stdHistory = [SELECT Old_Value__c, New_Value__c
                                               FROM Student_History__c
                                               WHERE Old_Value__c LIKE 'Class%'
                                               AND New_Value__c = 'Updated Class'];
        
        System.debug(stdHistory);
        System.assertEquals(2, stdHistory.size());
        
    }
}