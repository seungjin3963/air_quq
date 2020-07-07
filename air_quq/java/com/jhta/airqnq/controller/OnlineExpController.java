package com.jhta.airqnq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OnlineExpController {
	@GetMapping(value="/onlineExp/onlineExp")
	public String onlineExp() {
		return "/onlineExp/onlineExp";
	}
}
