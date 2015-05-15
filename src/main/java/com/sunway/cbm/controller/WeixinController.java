package com.sunway.cbm.controller;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sunway.cbm.entities.message.req.ReqBaseMessage;
import com.sunway.cbm.service.WeixinService;
import com.sunway.cbm.util.SignUtil;
import com.sunway.cbm.util.message.MessageUtil;
import com.sunway.cbm.util.web.ServletUtils;

@Controller
@RequestMapping(value = "/weixin")
public class WeixinController {

	@Autowired
	WeixinService weixinService;

	/**
	 * 确认请求来自微信
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(method = RequestMethod.GET)
	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		// 微信加密签名
		String signature = request.getParameter("signature");
		System.out.println(signature);
		// 时间戳
		String timestamp = request.getParameter("timestamp");
		System.out.println(timestamp);
		// 随机数
		String nonce = request.getParameter("nonce");
		System.out.println(nonce);
		// 随机字符串
		String echostr = request.getParameter("echostr");
		System.out.println(echostr);

		PrintWriter out = null;
		try {
			out = response.getWriter();
			// 通过检验signature对请求进行校验，若校验成功则原样返回echostr，表示接入成功，否则接入失败
			if (SignUtil.checkSignature(signature, timestamp, nonce)) {
				out.print(echostr);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.close();
				out = null;
			}
		}
	}

	/**
	 * 处理来自微信的消息
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(method = RequestMethod.POST)
	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		System.out.println(request);
		// 调用核心业务类接收消息、处理消息
		try {
			// xml请求解析
			Map<String, String> requestMap = MessageUtil.parseXml(request);
			ReqBaseMessage reqBaseMessage = new ReqBaseMessage(requestMap);
			// 消息类型
			String msgType = requestMap.get("MsgType");
			// 文本消息
			if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) {
				String content = requestMap.get("Content").trim().toLowerCase();
				if (content.equals("cd")) {
					ServletUtils.responseXml(response, weixinService.getMainMenuXML(reqBaseMessage));
					return;
				}
			}
			// 图片消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) {
				// respContent = "您发送的是图片消息！";
			}
			// 地理位置消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LOCATION)) {
				// respContent = "您发送的是地理位置消息！";
				// String Location_X = requestMap.get("Location_X");
				// String Location_Y = requestMap.get("Location_Y");
				// respMessageHandler.StartDWDH(reqBaseMessage, response,
				// Location_X, Location_Y);
				// return;
			}
			// 链接消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LINK)) {
				// respContent = "您发送的是链接消息！";
			}
			// 音频消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VOICE)) {
				// respContent = "您发送的是音频消息！";

			}
			// 事件推送
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {
				// 事件类型
				String eventType = requestMap.get("Event");
				// 订阅
				if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {
					weixinService.getWelcomeXML(reqBaseMessage);
					return;
				}
				// 取消订阅
				else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {
					// TODO 取消订阅后用户再收不到公众号发送的消息，因此不需要回复消息
					return;
				}
				// 自定义菜单点击事件
				else if (eventType.equals(MessageUtil.EVENT_TYPE_CLICK)) {
					// TODO 自定义菜单权没有开放，暂不处理该类消息
					// String eventKey = requestMap.get("EventKey");

					// if (eventKey.equals(Constants.KEY_JCDJ)) {// 检查登记
					// respMessageHandler.GoJCDJ(reqBaseMessage, response);
					// }
					return;
				}
			}
			ServletUtils.responseXml(response, weixinService.getNotUnstandInfoResXML(reqBaseMessage));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
