public class NewCaseListController {
    public List<Case> getNewCases() {
        List<Case> arr = [Select Id, CaseNumber
                          from Case
                          where status = 'New'];
        return arr;
    }
}