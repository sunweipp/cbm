package com.sunway.cbm.entities.message.resp;

import java.util.List;

/**
 * 图文消息
 * @author sw
 * @date 2014-3-29
 */
public class RespNewsMessage extends RespBaseMessage {
	// 图文消息个数，限制为10条以内
	private int ArticleCount;
	// 多条图文消息信息，默认第一个item为大图,注意，如果图文数超过10，则将会无响应
	private List<RespArticle> Articles;

	public int getArticleCount() {
		return ArticleCount;
	}

	public void setArticleCount(int articleCount) {
		ArticleCount = articleCount;
	}

	public List<RespArticle> getArticles() {
		return Articles;
	}

	public void setArticles(List<RespArticle> articles) {
		Articles = articles;
	}
}
