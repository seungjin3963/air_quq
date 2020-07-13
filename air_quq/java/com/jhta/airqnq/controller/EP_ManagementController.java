package com.jhta.airqnq.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.airqnq.service.EP_ManagementService;
import com.jhta.airqnq.vo.EP_ManagementVo;

@Controller
public class EP_ManagementController {
	@Autowired private EP_ManagementService service;
	
	@GetMapping("/ep_management/ep_list")
	public String ep_management(HttpSession session , Model model) {
		String id=(String)session.getAttribute("id");
		
		if(id==null) {
			return ".login";
		}else {
			int  loginnum=service.ep_inserting(id);
			List<EP_ManagementVo> vo=service.ep_insertlist(loginnum);
			model.addAttribute("vo" , vo);
			return ".ep_management.ep_list";
			
		}
	}
	
	@PostMapping("/ep_management/ep_list")
	public String ep_management(int hinum) {
		System.out.println(hinum);
		return ".experience.ep_insert.ep_type";
	}
}
