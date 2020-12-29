({
    updateColumns : function(component, event, helper) {
        let fields = event.getParam("QueryChange");
        component.set("v.fieldName", fields);
        let dataFields = fields.split(",");
        helper.changeColumns(component, dataFields);        
    },
    
    updateObjectName : function(component, event, helper) {
        let newItem = event.getParam("ObjName");
        component.set("v.objName", newItem);
        
    },
    
    updateTableRecords : function(component, event, helper) {
        //console.log("BUTTON PRESSED");
        let fields = component.get("v.fieldName");
        let objName = component.get("v.objName");
        helper.updateRecords(component, fields, objName);
    }
})