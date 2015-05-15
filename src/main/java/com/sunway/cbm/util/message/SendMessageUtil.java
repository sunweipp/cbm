package com.sunway.cbm.util.message;

import java.util.Date;
import java.util.List;

import com.sunway.cbm.entities.message.resp.RespArticle;
import com.sunway.cbm.entities.message.resp.RespNewsMessage;
import com.sunway.cbm.entities.message.resp.RespTextMessage;

public class SendMessageUtil {
	/**
	 * 图文消息
	 * 
	 * @param toUserName
	 * @param fromUserName
	 * @param articallist
	 * @return
	 */
	public static String getNewMessge(String toUserName, String fromUserName, List<RespArticle> articallist) {
		RespNewsMessage newsMessage = new RespNewsMessage();
		newsMessage.setToUserName(toUserName);
		newsMessage.setFromUserName(fromUserName);
		newsMessage.setCreateTime(new Date().getTime());
		newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
		newsMessage.setFuncFlag(0);
		newsMessage.setArticleCount(articallist.size());
		newsMessage.setArticles(articallist);
		return MessageUtil.newsMessageToXml(newsMessage);
	}

	/**
	 * 文本消息
	 * 
	 * @param toUserName
	 * @param fromUserName
	 * @param articallist
	 * @return
	 */
	public static String getTextMessge(String toUserName, String fromUserName, String content) {
		RespTextMessage textMessage = new RespTextMessage();
		textMessage.setToUserName(toUserName);
		textMessage.setFromUserName(fromUserName);
		textMessage.setCreateTime(new Date().getTime());
		textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
		textMessage.setFuncFlag(0);
		textMessage.setContent(content);
		return MessageUtil.textMessageToXml(textMessage);
	}
}
