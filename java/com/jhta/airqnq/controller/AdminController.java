package com.jhta.airqnq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.airqnq.service.MemberService;
import com.jhta.airqnq.vo.JoinVo;

@Controller
public class AdminController {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/admin")
	public String admin() {
		return ".admin";
	}
	
	@GetMapping("/admin/member/list")
	public String memberlist(Model model) {
		List<JoinVo> Memberlist = service.Memberlist();
		
		model.addAttribute("Memberlist", Memberlist);
		
		return ".admin.memberadmin";
	}
}
