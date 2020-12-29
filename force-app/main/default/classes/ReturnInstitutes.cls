public class ReturnInstitutes {
    
    public static List<SelectOption> getInstitutes() {
        List<Institute__c> arr = [SELECT Name
                                  FROM Institute__c
                                 ]; 
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('Select Institute','Select Institute'));
        for(Integer i=0; i<arr.size(); ++i) {
            options.add(new SelectOption(arr[i].Name,arr[i].Name));
        }
        return options;
    }
    
    //get set uniName
    public String uniName {get; set;}
    
    //get set mentorName
    public String mentorName;
    
    public void setMentorName(String a) {
        if(a == mentorName) {
            mentorName = null;
        }
        else {
            mentorName = a;
        }
    }
    public String getMentorName() {
        return mentorName;
    }
    
    public void getMentor() {
        
    }     
    
    public List<Mentor__c> getMentorList() {        
        List<Mentor__c> arr = [SELECT Name,Designation__c
                               FROM Mentor__c
                               WHERE Institute__r.Name =: uniName
                              ];
        System.debug(arr);
        return arr;
    }
    
    public List<Student__c> getStudentList() {        
        List<Student__c> arr = [SELECT Name,Class__c,City__c,State__c 
                                FROM Student__c 
                                WHERE Mentor__r.Name =: mentorName 
                               ];
        return arr;
    }
    
}