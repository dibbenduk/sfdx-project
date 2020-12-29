@isTest
public class TestVerifyDate {
    @isTest static void greaterThan30Date2() {
        date d1 = date.newInstance(1990, 8, 21);
        date d2 = date.newInstance(1990, 11, 21);
        Date val1 = VerifyDate.CheckDates(d1, d2);
        System.assertEquals(date.valueOf('1990-8-31'), val1);
    }
    
    @isTest static void within30Date2() {
        date d1 = date.newInstance(1990, 8, 1);
        date d2 = date.newInstance(1990, 8, 28);
        Date val1 = VerifyDate.CheckDates(d1, d2);
        System.assertEquals(d2, val1);
    }
    
    @isTest static void SmallerDate2() {
        date d1 = date.newInstance(1990, 8, 14);
        date d2 = date.newInstance(1990, 8, 5);
        Date val1 = VerifyDate.CheckDates(d1, d2);
        System.assertEquals(date.valueOf('1990-8-31'), val1);
    }
}