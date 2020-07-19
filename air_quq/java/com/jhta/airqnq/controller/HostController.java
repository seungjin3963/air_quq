package com.jhta.airqnq.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.airqnq.service.HostService;
import com.jhta.airqnq.vo.ExpInfoVo;

@Controller
public class HostController {

	@Autowired
	private HostService service;

	@GetMapping(value = "/host/epOnline/list")
	public String epOnlineList(Model model, HttpSession session) {
		if(session.getAttribute("logind") == null) {
			return ".login";
		}else {
			int menum = (int)session.getAttribute("menum");
			List<ExpInfoVo> list = service.list(menum);
			model.addAttribute("list", list);
			return ".host.epOnline.list";
		}
	}

	@GetMapping(value = "/host/epOnline/modify")
	public String modifyView(Model model, int einum) {
		model.addAttribute("vo", service.getEpOnlineInfo(einum));
		return ".host.epOnline.modify";
	}

	@PostMapping(value = "/host/epOnline/modify")
	public String modify(ExpInfoVo vo) {
		if (service.modify(vo) > 0) {
			return "redirect:/host/epOnline/list";
		} else {
			return ".error";
		}
	}

	@GetMapping(value = "/host/epOnline/delete")
	public String delEpOnline(int einum) {
		try {
			service.delEpOnline(einum);
			return "redirect:/host/epOnline/list";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return ".error";
		}
	}

	@RequestMapping(value = "/host/regist/1")
	public String hostRegist1(String addr, String roomStatus, String clientCount, HttpSession session, int next) {
		session.setAttribute("hostStep", next);
		return ".hostRegist";
	}

	@RequestMapping(value = "/host/regist/2")
	public String hostRegist2(String hostTitle, String hostContent, HttpSession session, int next) {
		session.setAttribute("hostStep", next);
		return ".hostRegist";
	}
}
