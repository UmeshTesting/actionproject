import org.testng.annotations.Test;

public class SecondTest {

    @Test(groups = "sanity")
    public void ThirdTest()
    {
        System.out.println("I am in group sanity and third test method and second class");
    }

    @Test(groups = "regression")
    public void FourthTest()
    {
        System.out.println("I am in group regression and fourth test method and second class");
    }
}
