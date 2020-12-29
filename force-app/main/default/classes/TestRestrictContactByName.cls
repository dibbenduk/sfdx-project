@isTest
private class TestRestrictContactByName {
    @isTest static void tryInsertInvalidName() {
        Contact c1 = new Contact(FirstName='John',
                                 LastName='INVALIDNAME');
        
        Test.startTest();
        Database.SaveResult result = Database.insert(c1, false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
    }
}