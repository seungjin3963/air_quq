package com.jhta.airqnq.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.airqnq.service.HostService;
import com.jhta.airqnq.vo.HouseInfoVo;

@Controller
public class HostController {
	
	@Autowired
	private HostService service;
	
	@GetMapping(value="/host/epOnline/list")
	public String epOnlineList(Model model, HttpSession session) {
		//int menum = (int)session.getAttribute("menum");
		int menum = 1000;
		List<HouseInfoVo> list = service.list(menum);
		model.addAttribute("list", list);
		return ".host.epOnline.list";
	}
	
	@GetMapping(value="/host/epOnline/modify")
	public String modifyView() {
		return ".host.epOnline.modify";
	}
	
	@PostMapping(value = "/host/regist/")
	public String hostRegist(String addr, String roomStatus, String clientCount) {
		System.out.println("주소" + addr + ", 집상태:" + roomStatus + ", 숙박인원" + clientCount);
		
		return ".hostRegist";
	}
}
