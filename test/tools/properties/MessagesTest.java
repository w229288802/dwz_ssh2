package tools.properties;

import java.util.Calendar;
import java.util.Locale;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MessagesTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		ApplicationContext appContext = new ClassPathXmlApplicationContext(
				"spring_test.cfg.xml");

		Object[] arg = new Object[] { "Erica", Calendar.getInstance().getTime() };
		System.out.println("zh Message is ===> " + appContext.getMessage("userinfo", arg, Locale.CHINA));// 

		System.out.println("en Message is ===> " + appContext.getMessage("userinfo", arg, Locale.US));// 

		System.out.println("default Message is ===> " + appContext.getMessage("userinfo", arg, null));// 
		System.out.println("default Message is ===> " + appContext.getMessage("userinfo", null, null));// 

	}

}
