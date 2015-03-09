package dwz.present.app.common;

import java.util.HashMap;
import java.util.Map;

import dwz.business.constants.info.NewsSearchFieldsDB;
import dwz.business.constants.info.NewsStatus;
import dwz.business.info.NewsManager;
import dwz.business.website.WebsiteManager;
import dwz.constants.BeanManagerKey;
import dwz.present.BaseAction;
import dwz.present.UiModel;

public class IndexAction extends BaseAction {

	private int newsId;
	private int pageId;
	private String type;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getPageId() {
		return pageId;
	}

	public void setPageId(int pageId) {
		this.pageId = pageId;
	}

	public int getNewsId() {
		return newsId;
	}

	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}

	public String index() {
		IndexModel model = new IndexModel();

		setModel(model);
		return INPUT;
	}

	public String page() {
		PageModel model = new PageModel();
		WebsiteManager manager = bf.getManager(BeanManagerKey.websiteManager);
		model.setPage(manager.getPage(pageId));
		setModel(model);

		return INPUT;
	}

	public String news() {
		NewsModel model = new NewsModel();
		NewsManager manager = bf.getManager(BeanManagerKey.newsManager);
		model.setNews(manager.getNewsOnWeb(this.getNewsId()));
		setModel(model);

		return INPUT;
	}

	public String listNews() {
		NewsListModel model = new NewsListModel();
		NewsManager manager = bf.getManager(BeanManagerKey.newsManager);

		int pageNum = this.getPageNum() > 0 ? this.getPageNum() - 1 : 0;
		int startIndex = pageNum * getNumPerPage();

		Map<NewsSearchFieldsDB, String> criterias = new HashMap<NewsSearchFieldsDB, String>();
		if (this.getType() != null && this.getType().trim().length() > 0) {
			criterias.put(NewsSearchFieldsDB.TYPE, this.getType().trim());
		}

		criterias.put(NewsSearchFieldsDB.STATUS, NewsStatus.ACTIVE.toString());

		if (this.getKeywords() != null
				&& this.getKeywords().trim().length() > 0) {
			criterias.put(NewsSearchFieldsDB.KEYWORDS, this.getKeywords()
					.trim());
		}

		model.setNewsList(manager.searchNewsFromDB(criterias, startIndex,
				getNumPerPage()));
		setTotalCount(manager.searchNewsFromDBNum(criterias));

		if (criterias != null) {
			criterias.clear();
			criterias = null;
		}

		setModel(model);
		return INPUT;
	}

	public String login() {
		UiModel model = new UiModel();
		setModel(model);
		return INPUT;
	}
	
}
