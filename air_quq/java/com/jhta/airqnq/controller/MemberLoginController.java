package com.jhta.airqnq.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.airqnq.service.KakaoAPI;
import com.jhta.airqnq.service.MemberFunctionService;

@Controller
public class MemberLoginController {
	@Autowired
	private MemberFunctionService service;
	
	@Autowired
    private KakaoAPI kakao;
	
	@PostMapping("/member/login")
	public String login(String idl, String pwdl, Model model,HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println("id:"+idl+", pwd:"+pwdl);
		map.put("id", idl);
		map.put("pwd", pwdl);
		int cnt = service.loginCheck(map);
		
		System.out.println(cnt);
		
		if(cnt > 0) {
<<<<<<< HEAD
=======
			System.out.println("조회된 아이디 있음");
			session.setAttribute("id", idl);
>>>>>>> 756c6a136a21e621ee495e82e84b215e7bcaa99e
			model.addAttribute("logind", true);
			return ".home";
		} else {
			model.addAttribute("logind", false);
			return ".login";
		}
	}
	
	@GetMapping("/kakao/login")
	public String kakaoLogin(String code, HttpSession session) {
		String access_Token = kakao.getAccessToken(code);
        
        HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
        
        
        //    클라이언트의 이메일이 존재할 때 모델에 해당 이메일과 토큰 등록
        if (userInfo.get("nickname") != null) {
        	session.setAttribute("userInfo", userInfo);
        	session.setAttribute("access_Token", access_Token);
        	session.setAttribute("logind", true);
        } else {
        	session.setAttribute("logind", false);
        }
        
		return ".home";
	}
	
	@RequestMapping(value="/kakao/logout")
	public String logout(HttpSession session) {
		System.out.println("로그아웃");
		
	    session.removeAttribute("access_Token");
	    session.removeAttribute("userInfo");
	    session.removeAttribute("logind");
	    return ".home";
	}

}
