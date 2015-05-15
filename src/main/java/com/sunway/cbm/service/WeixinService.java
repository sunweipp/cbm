package com.sunway.cbm.service;

import com.sunway.cbm.entities.message.req.ReqBaseMessage;

public interface WeixinService {
	/**
	 * 获得主菜单XML字符串
	 * 
	 * @param reqMessage
	 * @return 主菜单XML
	 */
	String getMainMenuXML(ReqBaseMessage reqMessage);

	/**
	 * 获取欢迎信息
	 * 
	 * @param reqMessage
	 * @return
	 */
	String getWelcomeXML(ReqBaseMessage reqMessage);

	/**
	 * 获取未理解消息的返回xml
	 * @param reqMessage
	 * @return
	 */
	String getNotUnstandInfoResXML(ReqBaseMessage reqMessage);

}
