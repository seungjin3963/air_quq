package com.jhta.airqnq.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.airqnq.service.MemberFunctionService;
import com.jhta.airqnq.vo.JoinVo;

@Controller
public class MemberLoginController {
	@Autowired
	private MemberFunctionService service;
	
	@PostMapping("/member/login")
	public String login(String idl, String pwdl, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println("id:"+idl+", pwd:"+pwdl);
		map.put("id", idl);
		map.put("pwd", pwdl);
		int cnt = service.loginCheck(map);
		
		System.out.println(cnt);
		
		if(cnt > 0) {
			System.out.println("조회된 아이디 있음");
			model.addAttribute("logind", true);
			return ".home";
		} else {
			model.addAttribute("logind", false);
			return ".login";
		}
	}
	
	@GetMapping("/kakao/login")
	public String kakaoLogin() {
		System.out.println("카카오 로그인");
		return "";
	}
}
