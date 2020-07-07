package com.jhta.airqnq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ExpOnlineController {
	@GetMapping(value="/expOnline/expOnline")
	public String onlineExp() {
		return "/expOnline/expOnline";
	}
}
