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
	@Autowired
	private EP_ManagementService service;

	@GetMapping("/ep_management/ep_listg")
	public String ep_management(HttpSession session, Model model) {
		if(session.getAttribute("logind") == null) {
			return ".login";
		}else {
			int menum = (int)session.getAttribute("menum");
			List<EP_ManagementVo> vo = service.ep_insertlist(menum);
			model.addAttribute("vo", vo);
			return ".ep_management.ep_list";
		}
	}

	@PostMapping("/ep_management/ep_list")
	public String ep_management(int hinum, int sessionnum, HttpSession session, Model model) {
		
		EP_ManagementVo vo = service.ep_management(hinum);
		session.setAttribute("ep_type", vo.getDiv_type());
		session.setAttribute("ep_intr", vo.getIntr());
		session.setAttribute("ep_loc", vo.getLoc());
		session.setAttribute("ep_program", vo.getProgram());
		session.setAttribute("ep_mater", vo.getMater());
		session.setAttribute("ep_price", vo.getPrice());
		session.setAttribute("ep_times", vo.getTimes());
		session.setAttribute("ep_title", vo.getTitle());
		session.setAttribute("ep_housenum", hinum);
		session.setAttribute("sessionnum", sessionnum);
		model.addAttribute("ep_num", sessionnum);
		return ".experience.ep_insert.ep_type";
	}
	
	@PostMapping("/ep_management/ep_delete")
	public String ep_managementDelete(int hinum) {
		service.ep_list_delete(hinum);
		return "redirect:/ep_management/ep_listg";
	}
}
















