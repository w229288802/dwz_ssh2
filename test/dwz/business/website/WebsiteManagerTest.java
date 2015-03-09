package dwz.business.website;

import static org.junit.Assert.fail;

import org.junit.Test;

import dwz.BaseTestCase;
import dwz.constants.BeanManagerKey;
import dwz.framework.core.exception.ValidateFieldsException;

public class WebsiteManagerTest extends BaseTestCase {

	@Test
	public void testCreatePage() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdatePage() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeletePage() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetPage() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetPages() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetTemplates() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetTemplateByName() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetDefaultTemplate() {
		WebsiteManager manager = bf.getManager(BeanManagerKey.websiteManager);
		Template t = manager.getDefaultTemplate();
		System.out.println("DefaultTemplate:\n"
				+ t.getDefaultLayout().getName());
		System.out.println(t.getDefaultLayout().getName());
		System.out.println(t.getDefaultTheme().getName());
	}

	@Test
	public void testGetWebsite() {
		fail("Not yet implemented");
	}

	@Test
	public void testSaveWebsite() {
		WebsiteManager manager = bf.getManager(BeanManagerKey.websiteManager);
		Website website = manager.getWebsite();
		try {
			manager.saveWebsite(website);
		} catch (ValidateFieldsException e) {
			fail(e.toString());
		}
	}

}
