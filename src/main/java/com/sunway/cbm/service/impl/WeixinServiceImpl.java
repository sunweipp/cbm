package com.sunway.cbm.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.springframework.stereotype.Service;

import com.sunway.cbm.entities.message.req.ReqBaseMessage;
import com.sunway.cbm.entities.message.resp.RespArticle;
import com.sunway.cbm.service.WeixinService;
import com.sunway.cbm.util.Constants;
import com.sunway.cbm.util.message.SendMessageUtil;

@Service
public class WeixinServiceImpl implements WeixinService {
	
	public static final Logger logger =org.slf4j.LoggerFactory.getLogger(WeixinServiceImpl.class);

	@Override
	public String getMainMenuXML(ReqBaseMessage reqMessage) {
		String fromUserName =  reqMessage.getToUserName();
		String toUserName =reqMessage.getFromUserName();
		List<RespArticle> articallist = new ArrayList<RespArticle>();
		RespArticle article = new RespArticle();
		article.setUrl(Constants.WEB_APP_URL);
		article.setPicUrl(Constants.WEB_APP_URL + "/images/welcome.jpg");
		article.setTitle("这是最便捷的生鲜体验");
		article.setDescription("点击进入微商城");
		articallist.add(article);
		RespArticle article2 = new RespArticle();
		article2.setUrl(Constants.WEB_APP_URL);
		article2.setPicUrl(Constants.WEB_APP_URL + "/images/logo.jpg");
		article2.setTitle("关于我们");
		articallist.add(article2);
		return SendMessageUtil.getNewMessge(toUserName, fromUserName, articallist);
	}

	@Override
	public String getWelcomeXML(ReqBaseMessage reqMessage) {
		String fromUserName = reqMessage.getToUserName();
		String toUserName = reqMessage.getFromUserName();
		String content="欢迎来到菜保姆，很高兴为您服务，输入cd来看下我们都有些什么吧";  
		return SendMessageUtil.getTextMessge(toUserName, fromUserName, content);
	}

	@Override
	public String getNotUnstandInfoResXML(ReqBaseMessage reqMessage) {
		String fromUserName = reqMessage.getToUserName();
		String toUserName = reqMessage.getFromUserName();
		String content="对不起，我们不是特别明白你想说的内容，您可以输入cd看看我们都有些什么服务";  
		return SendMessageUtil.getTextMessge(toUserName, fromUserName, content);
	}

}
