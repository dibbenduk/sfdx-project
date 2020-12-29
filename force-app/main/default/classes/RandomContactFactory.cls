public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer noOfContacts, String lastNameOfContacts) {
        
        List<Contact> conts = new List<Contact>();
        
        for(Integer i=0; i<noOfContacts; i++) {
            Contact ct = new Contact(FirstName = 'Player ' + i,
                                     LastName = lastNameOfContacts);
            conts.add(ct);
        }
        
        return conts;
    }
}