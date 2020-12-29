public class StudentDataFactory {
    public static void insertRandomStudents(Integer noOfStudents) {        
        
        List<Mentor__c> mtr = new List<Mentor__c>();
        List<Student__c> std = new List<Student__c>();
        
        Institute__c inst = new Institute__c(Name = 'First University');     
        insert inst;
        
        for(Integer i=0; i<noOfStudents; i++) {
            Mentor__c m = new Mentor__c(Name = 'Mentor ' + i,
                                        Institute__c = inst.Id,
                                        Designation__c = 'Instructor');
            mtr.add(m);
        }
        insert mtr;
        
        for(Integer i=0; i<noOfStudents; i++) {
            
            Student__c s = new Student__c(Name = 'Student ' + i,
                                          Class__c = 'Class ' + i,
                                          City__c = 'City ' + i,
                                          State__c = 'State ' + i,
                                          Mentor__c = mtr[i].id);
            std.add(s);
        }
        
        insert std;
    }
}