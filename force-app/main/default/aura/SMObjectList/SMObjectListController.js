({
    doInit: function(component, event, helper) {
        // Create the action
        let action = component.get("c.getObjectList");
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.ObjList", response.getReturnValue());
            } else {
                console.log("Failed with state ObjectList: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    },
    
    handleObjChange: function(component, event, helper) {
     	
      let objName = component.find('select').get('v.value');
      console.log(objName);
      helper.objChanged(component, objName);
    
  }
});