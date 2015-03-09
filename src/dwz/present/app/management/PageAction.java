package dwz.present.app.management;

import java.util.Collection;

import dwz.business.constants.website.PageTarget;
import dwz.business.website.Page;
import dwz.business.website.WebsiteManager;
import dwz.constants.BeanManagerKey;
import dwz.framework.core.exception.ValidateFieldsException;
import dwz.present.BaseAction;

public class PageAction extends BaseAction {

	private PageTarget[] pageTargets = PageTarget.values();
	private String[] pageTarget;
	private int pageId;

	private Collection<Page> pages;
	private WebsiteManager manager = bf
			.getManager(BeanManagerKey.websiteManager);
	private Page page = manager.newPage("new Page");

	public String insert() {
		try {
			page.setTarget(pageTarget);
			manager.createPage(page);
			return ajaxForwardSuccess(getText("msg.operation.success"));
		} catch (ValidateFieldsException e) {
			return ajaxForwardError(e.getLocalizedMessage());
		}

	}

	public String edit() {
		page = manager.getPage(pageId);

		return INPUT;
	}

	public String update() {
		Page pageLoad = manager.getPage(pageId);

		pageLoad.copyProperties(page);

		pageLoad.setTarget(pageTarget);
		manager.updatePage(pageLoad);
		return ajaxForwardSuccess(getText("msg.operation.success"));
	}

	public String delete() {
		manager.deletePage(pageId);
		return ajaxForwardSuccess("");
	}

	public String list() {
		pages = manager.getPages();
		return INPUT;
	}

	public int getPageId() {
		return pageId;
	}

	public void setPageId(int pageId) {
		this.pageId = pageId;
	}

	public PageTarget[] getPageTargets() {
		return pageTargets;
	}

	public void setPageTargets(PageTarget[] pageTargets) {
		this.pageTargets = pageTargets;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public String[] getPageTarget() {
		return pageTarget;
	}

	public void setPageTarget(String[] pageTarget) {
		this.pageTarget = pageTarget;
	}

	public Collection<Page> getPages() {
		return pages;
	}

	public void setPages(Collection<Page> pages) {
		this.pages = pages;
	}

}
