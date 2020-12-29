({
    objChanged: function(component, newObj) {
        //let createEvent = component.getEvent("ObjChange");
        let createEvent = $A.get("e.c:SelectObjectFromObjectList");
        createEvent.setParams({ "ObjName": newObj });
        createEvent.fire();
        //console.log("Event Fired " + newObj);
    }
});