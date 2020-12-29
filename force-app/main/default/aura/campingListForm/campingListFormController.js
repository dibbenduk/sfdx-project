({	
  clickCreateItem: function(component, event, helper) {
    let validItem = component
      .find("campingItemForm")
      .reduce(function(validSoFar, inputCmp) {
        // Displays error messages for invalid fields
        inputCmp.showHelpMessageIfInvalid();
        return validSoFar && inputCmp.get("v.validity").valid;
      }, true);
    // If we pass error checking, do some real work
    if (validItem) {
      // Create the new expense
      let newItem = component.get("v.newItem");
      helper.createItem(component, newItem);
    }
  }
})