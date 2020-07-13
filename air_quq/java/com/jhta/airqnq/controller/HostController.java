package com.jhta.airqnq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HostController {
	
	@GetMapping(value="/host/epOnlineList")
	public String epOnlineList() {
		return ".host.epOnlineList";
	}
}
