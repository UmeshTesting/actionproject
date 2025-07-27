import org.testng.annotations.*;
public class FirstTest {

    @Test(groups = "sanity")
    public void FirstTest()
    {
        System.out.println("I am in group sanity and first test method and FirstClass");
    }

    @Test(groups = "regression")
    public void SecondTest()
    {
        System.out.println("I am in group regression and second test method and firstclass");
    }
}
