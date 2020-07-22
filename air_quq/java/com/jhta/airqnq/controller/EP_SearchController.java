package com.jhta.airqnq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.airqnq.service.EP_SearchService;

@Controller
public class EP_SearchController {
	@Autowired private EP_SearchService service;
	
	@RequestMapping("/ep_OnlineList")
	public String Ep_OnlineList() {
		return "ep_SearchList.OnlineAllList";
	}
}
