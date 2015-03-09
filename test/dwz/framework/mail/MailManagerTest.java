package dwz.framework.mail;

import org.junit.Test;

import dwz.constants.BeanManagerKey;
import dwz.constants.MailTemplateKey;
import dwz.framework.config.Configuration;
import dwz.framework.core.factory.BusinessFactory;

public class MailManagerTest {

	@Test
	public void testSendMail() {
		System.out.println("testSendMail...");
		MailManager eManager = BusinessFactory.getFactory().getManager(BeanManagerKey.mailManager);
		Configuration config = BusinessFactory.getFactory().retrieveConfiguration();
		try {
			String systemEmail = config.getString("app.system.email");
			Mail mail = eManager.newMail(true);

			mail.setFrom(systemEmail);
			mail.addTo("zhanghuihua@sohu.com","张慧华");

			mail.addContent("company", config.getString("app.company.name"));
			mail.addContent("url", config.getWWWServer());

			eManager.sendMail(mail, MailTemplateKey.registerConfirm);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
