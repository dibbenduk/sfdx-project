public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String a) {
        List<List<sObject>> searchList = [FIND :a IN ALL FIELDS
                                         RETURNING
										Contact(LastName),
                                         Lead(LastName)];
        return searchList;
    }
}