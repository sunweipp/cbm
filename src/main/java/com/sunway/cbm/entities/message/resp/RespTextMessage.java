package com.sunway.cbm.entities.message.resp;

/**
 * 文本消息
 * 
 * @author liufeng
 * @date 2013-05-19
 */
public class RespTextMessage extends RespBaseMessage {
	// 内容
	private String Content;

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}
}
