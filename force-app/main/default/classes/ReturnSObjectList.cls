public with sharing class ReturnSObjectList {    
    @AuraEnabled(cacheable=true)
    public static List<String> getObjectList() {        
        List<string> SObjectList = new List<string>();
        //List<SelectOption> options = new List<SelectOption>();
        
        for(Schema.SObjectType objTyp : Schema.getGlobalDescribe().Values()){
            String name = objTyp.getDescribe().getName();
            // Exclude all the unwanted Sobjects e.g. History, Share etc..
            
            if((!name.containsignorecase('history') && !name.containsignorecase('tag')&&
                !name.containsignorecase('share') && !name.containsignorecase('feed')) || 
               name.toLowerCase().right(3) ==  '__c' ){      
                   
                   SobjectList.add(name);
                   //options.add(new SelectOption(name, name));
                   //System.debug( 'Name : ' + name);
               }            
        }
        SObjectList.sort();
        return SObjectList;        
    }
    
    @AuraEnabled(cacheable=true)
    public static List<String> getObjectFieldList(String strName) { 
        
        SObjectType objName = Schema.getGlobalDescribe().get(strName);
        
        Map<String, Schema.SObjectField> fieldMap = objName.getDescribe().fields.getMap();
        List<String> fieldList = new List<String>();
        
        for(Schema.SObjectField field: fieldMap.values()) {
            fieldList.add(field.getDescribe().getName());
        }
        System.debug('FieldList returned');
        System.debug(fieldList);
        return fieldList;
    }
    
    @AuraEnabled(cacheable=true)
    public static List<SObject> getRecords(String que) {
        List<SObject> a = Database.query(que);
        System.debug(a);
        return a;
    }
}