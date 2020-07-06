package com.jhta.airqnq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.airqnq.service.ExperienceService;

@Controller
public class ExperiencePageController {
	@Autowired private ExperienceService service;
	
	@RequestMapping("/experience/myexperience")
	public String experiencePage() {
		return ".experience.myexperience";
	}
	
	@RequestMapping("/experience/ep_insert")
	public String experienceInsertPage() {
		return ".experience.ep_insert";
	}
	@RequestMapping("/experience/ep_insert/ep_type")
	public String experienceInsertType() {
		return ".experience.ep_insert.ep_type";
	}
}
