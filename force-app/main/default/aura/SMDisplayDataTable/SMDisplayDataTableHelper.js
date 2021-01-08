({
    changeColumns : function(component, dataFields) {
        let items = [];
        console.log(dataFields);
        for(let i=0; i<dataFields.length; i++) {
            
            let item = {
                label: dataFields[i],
                fieldName: dataFields[i]
            };
            items.push(item);
        }
        component.set('v.columns', items);
        
    },
    
    updateRecords : function(component, fields, objName) {
        let action = component.get("c.getRecords");
        let que = `SELECT ${fields} from ${objName}`;
        action.setParams({
            "que": que
        });        
        action.setCallback(this, function(response){
            let state = response.getState();
            if (state === "SUCCESS") {
                let res = response.getReturnValue();                
                component.set("v.data", res);
            } else {
                console.log("Failed with state ObjectList: " + state);
            }
        });
        $A.enqueueAction(action);
    }
})