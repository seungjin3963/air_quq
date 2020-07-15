package com.jhta.airqnq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminapproveController {
	@RequestMapping("/admin/approve")
	public String adminapprove() {

		return ".admin.adminapprove";
	}
}
