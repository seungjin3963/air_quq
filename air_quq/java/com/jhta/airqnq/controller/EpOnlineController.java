package com.jhta.airqnq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EpOnlineController {
	@RequestMapping("/online/home")
	public String goHome() {
		return  ".epOnline.home";
	}
	
	@GetMapping(value="/epOnline/epOnline")
	public String epOnLine() {
		return ".epOnline.epOnline";
	}
}
