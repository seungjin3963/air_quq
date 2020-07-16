package com.jhta.airqnq.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.jhta.airqnq.service.EpOnlineService;

@Controller
public class DmController {
	@Autowired
	private EpOnlineService service;
	
	@RequestMapping(value = "/echo/addcontent")
	@ResponseBody
	public void addContent(String content,HttpSession session) {
		System.out.println("들어옴 ");
		HashMap<String,Object> hash = new HashMap<String, Object>();
		session.getAttribute("chat_no");
		hash.put("chat_no",session.getAttribute("chat_no"));
		hash.put("content",content);
		hash.put("mnum",session.getAttribute("menum"));
		service.addcontent(hash);
	}
}
