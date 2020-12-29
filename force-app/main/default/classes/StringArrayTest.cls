public class StringArrayTest {
    public static List<String> generateStringArray(Integer a) {
        List<String> arr = new List<String>();
        for(Integer i=0; i<a; i++) {
        	arr.add('Test '+i);       
        }
        return arr;
    }
}