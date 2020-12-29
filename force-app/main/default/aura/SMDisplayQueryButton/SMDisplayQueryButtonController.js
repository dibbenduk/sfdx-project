({
	fireButtonClick : function(component, event, helper) {
		let createEvent = $A.get("e.c:SMDisplayRecordsEvent");
        //createEvent.setParams({ "TableRecords": "gg" });
        createEvent.fire();
	}
})