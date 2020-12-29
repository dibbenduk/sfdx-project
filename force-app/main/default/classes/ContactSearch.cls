public class ContactSearch {
    public static List<Contact> searchForContacts(String a, String b) {
		List<Contact> con = [Select 
                               Id,
                               Name
                               from Contact
                               where LastName=:a
                               and MailingPostalCode=:b];
        return con;       
        
    }
}