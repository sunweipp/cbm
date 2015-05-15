package com.sunway.cbm.entities.message.req;

/**
 * 连接信息
 * 
 * @author liufeng
 * @date 2013-05-19
 */
public class ReqLinkMessage extends ReqBaseMessage {
	private String Title;
	private String Description;
	private String Url;

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public String getUrl() {
		return Url;
	}

	public void setUrl(String url) {
		Url = url;
	}
}

