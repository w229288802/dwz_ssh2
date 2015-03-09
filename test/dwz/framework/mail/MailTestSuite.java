package dwz.framework.mail;

import org.junit.BeforeClass;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

import dwz.AllTestSuite;

@RunWith(Suite.class)
@SuiteClasses( { MailManagerTest.class })
public class MailTestSuite {
	@BeforeClass
	public static void init() {
		System.out.println("MailTestSuite...");
		if (AllTestSuite.isModuleDebug)
			AllTestSuite.init();
	}
}
