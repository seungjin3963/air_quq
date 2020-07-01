package com.jhta.airqnq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.airqnq.service.TestService;
import com.jhta.airqnq.vo.TestVo;

@Controller
public class TestController {
	@Autowired
	private TestService service;
	
	@GetMapping("/test")
	public String testSelect(int num, Model model) {
		TestVo vo = service.testSelect(num);
		
		model.addAttribute("test", vo);
		return "test";
	}
}
