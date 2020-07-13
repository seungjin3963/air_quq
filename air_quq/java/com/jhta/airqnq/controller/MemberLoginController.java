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
import com.jhta.airqnq.vo.JoinVo;

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
		
		
		if(cnt > 0) {
			session.setAttribute("id", idl);
			session.setAttribute("logind", true);
			return ".home";
		} else {
			session.setAttribute("logind", false);
			return ".login";
		}
	}
	
	@GetMapping("/logout")
	public String logoutPage() {
		String client_id = "f5b5ae84edd2bb27cfdebdebaa48bc3f";
		String logout_redirect_uri = "http://localhost:8090/kakao/logout";
		String path = "https://kauth.kakao.com/oauth/logout?client_id="+ client_id + "&logout_redirect_uri=" + logout_redirect_uri + "&state=?";
		return "redirect:" + path;
	}
	
	
	@GetMapping("/kakao/login")
	public String kakaoLogin(String code, HttpSession session) {
		String access_Token = kakao.getAccessToken(code);
        
        HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>" + userInfo);
        
        if (userInfo.get("nickname") != null) {
        	session.setAttribute("userInfo", userInfo);
        	session.setAttribute("access_Token", access_Token);
        	session.setAttribute("logind", true);
        } else {
        	session.setAttribute("logind", false);
        }
        
        String kakao_id = (String)userInfo.get("kakao_id");
        String email = (String)userInfo.get("email");
        String nickname = (String)userInfo.get("nickname");
        
        
        int n = service.selectKakaoUser(Integer.parseInt(kakao_id));
        
        //카카오 가입안한 서비스 회원일경우 최초로 DB에 등록됨
        if(n==0) {
        	JoinVo vo = new JoinVo(0, kakao_id, "", "", email, "", "", null, 0, 1, nickname);
        	service.insertJoin(vo);
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
