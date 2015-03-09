package dwz.demo.junit4;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)
@SuiteClasses( { ClassTest.class})
public class ModuleTestSuite {
	public void testSuite() {
		System.out.println("Running ModuleTestSuite...");
	}
}
