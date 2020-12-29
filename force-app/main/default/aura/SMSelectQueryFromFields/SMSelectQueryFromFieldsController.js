({
    updateSelectQuery : function(component, event, helper) {
        let fields = event.getParam("QueryChange");
        let objName = component.get("v.objName");
        let newQuery = `SELECT ${fields} FROM ${objName}`;
        //console.log(newQuery);
        component.set("v.selectQueryAtr", newQuery);
    },
    
    updateObjectName : function(component, event, helper) {
    	let newItem = event.getParam("ObjName");
        let newVal = "SELECT - FROM " + newItem;
        component.set("v.selectQueryAtr", newVal);
        component.set("v.objName", newItem);
    }
})