({
    createItem: function(component, item) {
        let action = component.get("c.saveItem");
        action.setParams({
            "campingItem": item
        });
        action.setCallback(this, function(response){
            let state = response.getState();
            if (state === "SUCCESS") {
                let theItems = component.get("v.items")
                theItems.push(response.getReturnValue());
                component.set("v.items", theItems);                
            }
        });
        $A.enqueueAction(action);
    },
})