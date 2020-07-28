package com.jhta.airqnq.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.airqnq.service.EpOnlineService;

@Controller
public class DmController {
	@Autowired
	private EpOnlineService service;
	
	@RequestMapping(value = "/echo/addcontent")
	@ResponseBody
	public void addContent(String content,HttpSession session,int mnum,int chat_no,int hinum) {
		HashMap<String,Object> hash = new HashMap<String, Object>();
		hash.put("hinum",hinum);
		hash.put("chat_no",chat_no);
		hash.put("content",content);
		hash.put("mnum",mnum);
		service.addcontent(hash);
	}
}