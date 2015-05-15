package com.sunway.cbm.entities.message.req;

import java.util.Map;

/**
 * 文本消息
 * 
 * @author sw
 * 
 */
public class ReqTextMessage extends ReqBaseMessage {

	public ReqTextMessage() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReqTextMessage(Map<String, String> requestMap) {
		super();
		this.setFromUserName(requestMap.get("FromUserName"));
		this.setToUserName(requestMap.get("ToUserName"));
		this.setContent(requestMap.get("Content"));
		// TODO Auto-generated constructor stub
	}

	private String Content;

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		this.Content = content;
	}

}
