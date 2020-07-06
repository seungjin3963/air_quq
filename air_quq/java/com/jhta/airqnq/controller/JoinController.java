package com.jhta.airqnq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.airqnq.service.JoinService;

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
	public String memberJoinOk() {
		//System.out.println("test");
		
		return "";
	}
}
