package com.jhta.airqnq.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.jhta.airqnq.service.EpOnlineService;

@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler{
	//소켓저장리스트
	private List<WebSocketSession> sessionList= new ArrayList<WebSocketSession>();
	
	private static Logger logger =LoggerFactory.getLogger(EchoHandler.class);
	
	@Autowired
	private EpOnlineService service;
	
	//연결직후
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("연결됨");
		sessionList.add(session);
		String enterOne=session.getId();
		logger.info("{} 여기에아이디",session.getId());
		for(WebSocketSession sess:sessionList) {
			sess.sendMessage(new TextMessage("입장하셨습니다"));
		}
		System.out.println("연결되는 메소드 완성");
	}
	
	private WebSocketMessage<?> encodeURI(TextMessage textMessage) {
		return null;
	}

	//메세지 보낸것
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//		System.out.println("메세지 보낸것 메소드");
//		Object newone = (Object)message1;
//		String newwone = (String)newone;
//		String newwwone=newwone.split(",")[0];
//		String mnum=newwone.split(",")[1];
//		String chat_no=newwone.split(",")[2];
//		Object newwwwone=(Object)newwwone;
//		TextMessage message=(TextMessage)newwwwone;
//		int mnum = 0;
//		int chat_no = 0;
//		System.out.println(mnum+", mnum"+message+", message "+chat_no+" chat_no ");
//		HashMap<String, Object> hash = new HashMap<String, Object>();
//		//#{chat_no},#{content},#{mnum}
//		hash.put("chat_no", chat_no);
//		hash.put("content", message);
//		hash.put("mnum", mnum);
		logger.info("{}님이 {}라고 보냄",session.getId(),message.getPayload());
//		service.addcontent(hash);
		//여기에 DB접속해서 몇개의 row있는지 확인 다르면, 알림가게
		//모든 사람에게
		for(WebSocketSession sess:sessionList) {
			sess.sendMessage(new TextMessage(message.getPayload()));
		}
		System.out.println("메세지 보낸것 메소드1");
	}
	
	//종료직후
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("종료직후 메소드");
		sessionList.remove(session);
		String lostone=session.getId();
		logger.info("{} 님퇴장.",session.getId());
		for(WebSocketSession sess:sessionList) {
			sess.sendMessage(new TextMessage("퇴장하셨습니다."));
		}
		System.out.println("종료직후 메소드1");
	}
}
