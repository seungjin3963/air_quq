package com.jhta.airqnq.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.airqnq.service.JoinService;
import com.jhta.airqnq.vo.JoinVo;

@Controller
public class JoinController {
	@Autowired
	JoinService service;
	
	@RequestMapping(value = "/idchk", method = RequestMethod.GET)
	@ResponseBody
	public String selectId(String id) {
		System.out.println(id);
		String chkid = "";
		
		int cnt = service.idChk(id);
		if(cnt == 0) {
			chkid = "false";
		} else {
			chkid = "true";
		}
		
		return chkid;
	}
	
	@PostMapping("/upload/memberjoin")
	public String memberJoinOk(HttpSession session, MultipartFile file1,
			String id, String addr, String email, String phone, String pwd) {
		
		try {
			byte[] profile_img = file1.getBytes();
			
			//DB에 값넣기
			JoinVo vo = new JoinVo(0, id, pwd, addr, email, phone, "0", profile_img);
			
			int n = service.insertJoin(vo);
			if(n<0 || n==0) return null;
			
		} catch(IOException e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/";
	}
}
