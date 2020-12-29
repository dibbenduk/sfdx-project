({
    selectQueryEvent : function(component, selectedFieldList) {
        let createEvent = $A.get("e.c:SMUpdateQueryEvent");
        createEvent.setParams({ "QueryChange": selectedFieldList });
        createEvent.fire();  
        //console.log('fieldList fired event');
    },
    
    setFieldList : function(component, newItem) {        
        let action = component.get("c.getObjectFieldList");
        action.setParams({
            "strName": newItem
        });
        //console.log("Params set");
        action.setCallback(this, function(response){
            let state = response.getState();
            if (state === "SUCCESS") {
                let res = response.getReturnValue();
                let items = [];
                for (let i = 0; i < res.length; i++) {
                    let item = {
                        "label": res[i],
                        "value": res[i]
                    };
                    items.push(item);
                }
                component.set("v.ObjFieldList", items);
            } else {
                console.log("Failed with state ObjectList: " + state);
            }
        });
        $A.enqueueAction(action);
        
    }
})