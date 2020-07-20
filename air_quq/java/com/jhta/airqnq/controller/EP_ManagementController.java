package com.jhta.airqnq.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.airqnq.service.AdminApproveService;
import com.jhta.airqnq.service.EP_ManagementService;
import com.jhta.airqnq.vo.EP_ManagementVo;

@Controller
public class EP_ManagementController {
	@Autowired
	private EP_ManagementService service;

	@Autowired private AdminApproveService imgservice;
	@GetMapping("/ep_management/ep_listg")
	public String ep_management(HttpSession session, Model model) {
		
		if(session.getAttribute("logind") == null) {
			return ".login";
		}else {
			int menum = (int)session.getAttribute("menum");
			List<EP_ManagementVo> vo = service.ep_insertlist(menum);
			List<EP_ManagementVo> imgvo=service.ep_imglimit(menum);
			model.addAttribute("vo", vo);
			model.addAttribute("imgvo", imgvo);
			return ".ep_management.ep_list";
		}
	}

	@PostMapping("/ep_management/ep_list")
	public String ep_management(int hinum, int sessionnum, HttpSession session, Model model , HttpServletResponse response) {
		int num=0;
		EP_ManagementVo vo = service.ep_management(hinum);	
		session.setAttribute("sessionVo", vo);	
		List<EP_ManagementVo> epimglist=service.epimglist(hinum);
		session.setAttribute("epimglist", epimglist);	
		return ".experience.ep_insert.ep_type";
	}
	
	@PostMapping("/ep_management/ep_delete")
	public String ep_managementDelete(int hinum) {
		service.ep_list_delete(hinum);
		return "redirect:/ep_management/ep_listg";
	}
}
















