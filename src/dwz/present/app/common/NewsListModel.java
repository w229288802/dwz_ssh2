package dwz.present.app.common;

import java.util.Collection;

import dwz.business.constants.info.NewsType;
import dwz.business.info.News;
import dwz.present.UiModel;

public class NewsListModel extends UiModel {
	private String	type;
	private String	status;
	private Collection<News> newsList;


	public Collection<News> getNewsList() {
		return newsList;
	}

	public void setNewsList(Collection<News> newsList) {
		this.newsList = newsList;
	}
	
	public NewsType [] getNewsTypes() {
		return NewsType.values();
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
