package dwz;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dwz.business.content.ContentTestSuite;
import dwz.constants.BeanManagerKey;
import dwz.framework.config.Configuration;
import dwz.framework.context.AppContext;
import dwz.framework.context.AppContextHolder;
import dwz.framework.context.DefaultAppContext;
import dwz.framework.core.factory.BusinessFactory;
import dwz.framework.user.User;
import dwz.framework.user.UserManager;

@RunWith(Suite.class)
@SuiteClasses( { ContentTestSuite.class })
public class AllTestSuite {
	public static boolean isModuleDebug = true;

	@BeforeClass
	public static void init() {
		try {
			System.out.println("Initializing running ...");

			ApplicationContext appContext = new ClassPathXmlApplicationContext(
					"spring_test.cfg.xml");

			Configuration config = new Configuration(appContext);
			try {
				String basePath = System.getProperty("user.dir")
						+ "/application/WEB-INF";
				config.load(basePath + "/home/etc/conf/app-config.xml");
			} catch (Throwable e) {
				e.printStackTrace();
			}

			User user = null;
			try {
				UserManager uMgr = BusinessFactory.getFactory().getManager(
						BeanManagerKey.userManager);
				user = uMgr.getUserByName("admin");
			} catch (Exception e) {
				e.printStackTrace();
			}

			AppContext context = AppContextHolder.getContext();
			if (context == null) {
				context = new DefaultAppContext(user);
				AppContextHolder.setContext(context);
			} else {
				context.setUser(user);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@AfterClass
	public static void destroy() {
		System.out.println("destroying running ...");
		BusinessFactory factory = BusinessFactory.getFactory();
		Configuration config = factory.retrieveConfiguration();
		config.clear();
	}
}
