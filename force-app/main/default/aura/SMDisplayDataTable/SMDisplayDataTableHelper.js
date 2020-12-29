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
                //console.log(res);
                //let vals = [{label: 'Id', fieldName: 'Id', type: 'text'}];
                let vals = [];
                for(let x in res[0]) {
                    let val = {
                        label : x,
                        fieldName : x
                    }
                    vals.push(val);
                }
                component.set('v.columns', vals);
                
                /*let items = [];
                for (let i = 0; i < res.length; i++) {
                   let item = {};
                    let ctr = 0;
                    for ( let x in res[i]) {
                        console.log(ctr++);
                        item.x = res[i][x];
                    }
                    
                    items.push(res[i]);
                    console.log(res[i]);
                }
                console.log(items);*/
                component.set("v.columns", vals);
                component.set("v.data", res);
            } else {
                console.log("Failed with state ObjectList: " + state);
            }
        });
        $A.enqueueAction(action);
    }
})