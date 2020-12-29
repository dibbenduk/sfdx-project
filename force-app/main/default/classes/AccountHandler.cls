public class AccountHandler {
    public static Account insertNewAccount(String name) {
        Account a = new Account();
        a.name = name;
        try {
			insert a;
            return a;
        } catch(Exception e) {
			System.debug('Error: ' + e);
            return null;
        }
    }
}