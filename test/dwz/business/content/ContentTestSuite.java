package dwz.business.content;

import org.junit.BeforeClass;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

import dwz.AllTestSuite;

@RunWith(Suite.class)
@SuiteClasses( { ContentManagerTest.class })
public class ContentTestSuite {
	@BeforeClass
	public static void init() {
		System.out.println("ContentTestSuite...");
		if (AllTestSuite.isModuleDebug)
			AllTestSuite.init();
	}

}
