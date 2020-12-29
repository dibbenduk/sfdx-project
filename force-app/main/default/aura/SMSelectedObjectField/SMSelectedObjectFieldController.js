({
    handleChange: function (cmp, event, helper) {
        // This will contain an array of the "value" attribute of the selected options
        let selectedOptionValue = event.getParam("value");
        let selectedFieldList = selectedOptionValue.toString();
        //console.log(selectedFieldList);
        helper.selectQueryEvent(cmp, selectedFieldList);
    },
    
    handleObjectChangeEvent: function(component, event, helper) {        
        //console.log("Event capturing");
        let newItem = event.getParam("ObjName");
        helper.setFieldList(component, newItem);
    }
});