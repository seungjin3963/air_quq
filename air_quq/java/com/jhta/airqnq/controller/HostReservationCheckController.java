package com.jhta.airqnq.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.airqnq.service.HostResCheckService;
import com.jhta.airqnq.vo.EP_ManagementVo;

@Controller
public class HostReservationCheckController {
	@Autowired private HostResCheckService service;
	
	
	@RequestMapping("/host/ResCheck")
	public String ResCheck(HttpSession session , Model model) {
		int menum=(int)session.getAttribute("menum");
		
		List<EP_ManagementVo> ResListE=service.ResListE(menum);
		model.addAttribute("ResListE",ResListE);
		
		return ".host.HostReservationCheck";
	}
}
