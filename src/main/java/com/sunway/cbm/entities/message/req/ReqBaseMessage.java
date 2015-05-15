package com.sunway.cbm.entities.message.req;

import java.util.Map;

/**
 * 消息基类
 * 
 * @author Administrator
 * 
 */
public class ReqBaseMessage {

	private String ToUserName;
	private String FromUserName;
	private long Createtime;
	private String MsgType;
	private long MsgId;
	
	public ReqBaseMessage(Map<String, String> requestMap) {
		super();
		this.setFromUserName(requestMap.get("FromUserName"));
		this.setToUserName(requestMap.get("ToUserName"));
		// TODO Auto-generated constructor stub
	}

	public ReqBaseMessage() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getToUserName() {
		return ToUserName;
	}

	public void setToUserName(String toUserName) {
		ToUserName = toUserName;
	}

	public String getFromUserName() {
		return FromUserName;
	}

	public void setFromUserName(String fromUserName) {
		FromUserName = fromUserName;
	}

	public long getCreatetime() {
		return Createtime;
	}

	public void setCreatetime(long createtime) {
		Createtime = createtime;
	}

	public String getMsgType() {
		return MsgType;
	}

	public void setMsgType(String msgType) {
		MsgType = msgType;
	}

	public long getMsgId() {
		return MsgId;
	}

	public void setMsgId(long msgId) {
		MsgId = msgId;
	}

}
