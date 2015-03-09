package dwz.present.app.management;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

import dwz.business.constants.info.NewsSearchFieldsDB;
import dwz.business.constants.info.NewsType;
import dwz.business.info.News;
import dwz.business.info.NewsManager;
import dwz.constants.BeanManagerKey;
import dwz.present.BaseAction;

public class NewsAction extends BaseAction {
	private int newsId;
	private String type;

	private NewsManager manager = bf.getManager(BeanManagerKey.newsManager);
	private News news = manager.newNews();
	private Collection<News> newsList;

	public String add() {

		return INPUT;
	}

	public String insert() {
		manager.createNews(news);

		return ajaxForwardSuccess(getText("msg.operation.success"));
	}

	public String edit() {

		news = manager.getNews(this.getNewsId());

		return INPUT;
	}

	public String update() {

		News m = manager.getNews(newsId);
		m.copyProperties(news);

		manager.updateNews(m);

		return ajaxForwardSuccess(getText("msg.operation.success"));
	}

	public String publish() {
		manager.publishNews(newsId);

		return ajaxForwardSuccess(getText("msg.operation.success"));
	}

	public String disable() {

		manager.disableNews(newsId);

		return ajaxForwardSuccess(getText("msg.operation.success"));
	}

	public String delete() {

		manager.removeNews(newsId);

		return ajaxForwardSuccess(getText("msg.operation.success"));
	}

	public String list() {

		int pageNum = this.getPageNum() > 0 ? this.getPageNum() - 1 : 0;
		int startIndex = pageNum * this.getNumPerPage();

		Map<NewsSearchFieldsDB, String> criterias = new HashMap<NewsSearchFieldsDB, String>();
		if (this.getType() != null && this.getType().length() > 0) {
			criterias.put(NewsSearchFieldsDB.TYPE, this.getType());
		}
//		if (news.getStatus() != null) {
//			criterias.put(NewsSearchFieldsDB.STATUS, news.getStatus()
//					.toString());
//		}

		if (this.getKeywords() != null
				&& this.getKeywords().trim().length() > 0) {
			criterias.put(NewsSearchFieldsDB.KEYWORDS, this.getKeywords()
					.trim());
		}

		setNewsList(manager.searchNewsFromDB(criterias, startIndex,
				getNumPerPage()));
		setTotalCount(manager.searchNewsFromDBNum(criterias));

		if (criterias != null) {
			criterias.clear();
			criterias = null;
		}

		return INPUT;
	}

	public int getNewsId() {
		return newsId;
	}

	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}

	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}

	public Collection<News> getNewsList() {
		return newsList;
	}

	public void setNewsList(Collection<News> newsList) {
		this.newsList = newsList;
	}

	public NewsType[] getNewsTypes() {
		return NewsType.values();
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	
	private Map<String, String> attr = new TreeMap<String, String>();

	public Map<String, String> getAttr() {
		return attr;
	}

	public void setAttr(Map<String, String> attr) {
		this.attr = attr;
	}
	
	private String [] strs = new String [10];

	public String[] getStrs() {
		return strs;
	}

	public void setStrs(String[] strs) {
		this.strs = strs;
	}

}
