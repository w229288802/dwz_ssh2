package dwz.demo.junit4;

import org.apache.commons.configuration.ConfigurationException;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dwz.framework.config.Configuration;

@RunWith(Suite.class)
@SuiteClasses( { ModuleTestSuite.class })
public class AllTestSuite {

	@BeforeClass
	public static void init() {
		ApplicationContext appContext = new ClassPathXmlApplicationContext(
				"spring_test.cfg.xml");

		Configuration config = new Configuration(appContext);
		try {
			String basePath = System.getProperty("user.dir")
					+ "/application/WEB-INF";
			config.load(basePath + "/home/etc/conf/app-config.xml");
		} catch (ConfigurationException e) {
			e.printStackTrace();
		}

	}

	public static void TestSuite() {
		System.out.println("AllTestSuite Running");
	}
}
