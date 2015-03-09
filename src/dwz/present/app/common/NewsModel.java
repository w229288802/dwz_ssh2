package dwz.present.app.common;

import dwz.business.constants.info.NewsType;
import dwz.business.info.News;
import dwz.present.UiModel;

public class NewsModel extends UiModel {
	private News news;

	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}
}
