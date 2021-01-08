({
    handleChange: function (cmp, event, helper) {
        // This will contain an array of the "value" attribute of the selected options
        let selectedOptionValue = event.getParam("value");
        let selectedFieldList = selectedOptionValue.toString();
        //console.log(selectedFieldList);
        helper.selectQueryEvent(cmp, selectedFieldList);
    },
    
    handleObjectChangeEvent: function(component, event, helper) {        
        //console.log("clog " + component.find("dualList").get("v.value"));
        component.find("dualList").set("v.value",[]);
        //component.set("v.ObjFieldList", []);
        let newItem = event.getParam("ObjName");
        helper.setFieldList(component, newItem);
    }
});