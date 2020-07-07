package com.jhta.airqnq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserApplyController {
	
	@GetMapping("/user/apply")
	public String userapply() {
		return ".apply.userapply";
	}
}
