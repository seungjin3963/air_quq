package com.jhta.airqnq.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

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
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value = "/host/regist/1")
	public String hostRegist1(String addr, String roomStatus, String clientCount, HttpSession session, int next) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("addr", addr);
		map.put("roomStatus", roomStatus);
		map.put("clientCount", clientCount);

		session.setAttribute("regist1", map);
		session.setAttribute("hostStep", next);
		
		System.out.println("첫번째 단계 : " + addr + ", " + roomStatus + ", " + clientCount);
		
		return ".hostRegist";
	}

	@RequestMapping(value = "/host/regist/2")
	public String hostRegist2(String hostTitle, String hostContent, HttpSession session, int next) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("hostTitle", hostTitle);
		map.put("hostContent", hostContent);
		
		session.setAttribute("regist2", map);
		session.setAttribute("hostStep", next);
		
		System.out.println("두번째 단계 : " + hostTitle + ", " + hostContent);
		
		return ".hostRegist";
	}
	
	@RequestMapping(value = "/host/regist/3")
	public String hostRegist3(String v_grade, String pcount, String bcount, String oclick, String startDay, String endDay, HttpSession session, int next) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("v_grade", v_grade);
		map.put("pcount", pcount);
		map.put("bcount", bcount);
		map.put("oclick", oclick);
		map.put("startDay", startDay);
		map.put("endDay", endDay);
		
		session.setAttribute("regist3", map);
		session.setAttribute("hostStep", next);
		
		System.out.println("세번째 단계 : " + v_grade + ", " + pcount + ", " + bcount + ", " + oclick + ", " + startDay + ", " + endDay);
		return ".hostRegist";
	}
	
	@RequestMapping(value = "/host/regist/4")
	public String hostRegist4(MultipartFile[] file1, String address, String addressDetail, String lat, String lnt, HttpSession session, int next) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("address", address);
		map.put("addressDetail", addressDetail);
		map.put("lat", lat);
		map.put("lnt", lnt);
		System.out.println(file1.length);
		for(MultipartFile f : file1) {
			System.out.println(f.getOriginalFilename());
		}
		
		session.setAttribute("regist4", map);
		session.setAttribute("hostStep", next);
		
		System.out.println("마지막 단계 : " + address + ", " + addressDetail + ", " + lat + ", " + lnt);
		
		return "redirect:/";
	}
}
