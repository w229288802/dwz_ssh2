package dwz.present.app.management;

import dwz.business.website.Website;
import dwz.business.website.WebsiteManager;
import dwz.constants.BeanManagerKey;
import dwz.framework.core.exception.ValidateFieldsException;
import dwz.present.BaseAction;

public class WebsiteAction extends BaseAction {
	private WebsiteManager manager = bf
			.getManager(BeanManagerKey.websiteManager);
	private Website website = manager.getWebsite();

	public String update() {
		try {
			manager.saveWebsite(website);
		} catch (ValidateFieldsException e) {
			return ajaxForwardError(e.getLocalizedMessage());
		}
		return ajaxForwardSuccess(getText("msg.operation.success"));
	}

	public Website getWebsite() {
		return website;
	}

	public void setWebsite(Website website) {
		this.website = website;
	}

}
