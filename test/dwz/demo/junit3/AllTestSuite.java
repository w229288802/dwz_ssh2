package dwz.demo.junit3;

import junit.extensions.TestSetup;
import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

import org.apache.commons.configuration.ConfigurationException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dwz.framework.config.Configuration;

public class AllTestSuite extends TestCase {

	public static Test suite() {
		TestSuite suite = new TestSuite();
		// suite.addTestSuite(SdiTestSuite.class);
		// suite.addTestSuite(SdiTestSuite.class);
		TestSetup wrapper = new TestSetup(suite) {
			public void setUp() {
				System.out.println("AllTest setUp...");
				init();
			}
		};
		return wrapper;

	}

	public static void init() {
		try {
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

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
