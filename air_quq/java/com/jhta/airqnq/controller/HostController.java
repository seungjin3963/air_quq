package com.jhta.airqnq.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.airqnq.service.HostService;
import com.jhta.airqnq.vo.HouseInfoVo;

@Controller
public class HostController {
	
	@Autowired
	private HostService service;
	
	@GetMapping(value="/host/epOnlineList")
	public String epOnlineList(Model model, HttpSession session) {
		//int menum = (int)session.getAttribute("menum");
		int menum = 1000;
		List<HouseInfoVo> list = service.list(menum);
		model.addAttribute("list", list);
		return ".host.epOnlineList";
	}
}
