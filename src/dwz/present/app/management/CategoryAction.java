package dwz.present.app.management;

import java.util.Collection;
import java.util.Date;

import dwz.business.inv.Category;
import dwz.business.inv.CategoryManager;
import dwz.constants.BeanManagerKey;
import dwz.framework.core.exception.ValidateFieldsException;
import dwz.present.BaseAction;

public class CategoryAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3499978752327131838L;

	private Collection<Category> categorys;

	private int pageId;

	private CategoryManager manager = bf
			.getManager(BeanManagerKey.categoryManager);

	private Category category = manager.newCategory();

	public String list() {
		categorys = manager.getCategorys();

		return INPUT;
	}

	public String insert() {
		try {
			manager.createCategory(category);
			return ajaxForwardSuccess(getText("msg.operation.success"));
		} catch (ValidateFieldsException e) {
			return ajaxForwardError(e.getLocalizedMessage());
		}

	}

	public String delete() {
		manager.deleteCategory(pageId);
		return ajaxForwardSuccess("");
	}

	public String edit() {
		category = manager.getCategory(pageId);
		return INPUT;
	}

	public String update() {
		Category categoryLoad = manager.getCategory(pageId);

		categoryLoad.copyProperties(category);
		categoryLoad.setUpdateDate(new Date());
		manager.updateCategory(categoryLoad);
		return ajaxForwardSuccess(getText("msg.operation.success"));
	}

	public Collection<Category> getCategorys() {
		return categorys;
	}

	public void setCategorys(Collection<Category> categorys) {
		this.categorys = categorys;
	}

	public int getPageId() {
		return pageId;
	}

	public void setPageId(int pageId) {
		this.pageId = pageId;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

}
