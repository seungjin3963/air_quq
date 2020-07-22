package com.jhta.airqnq.controller;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return ".home";
	}

	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public String error() {
		return ".error";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return ".login";
	}
	
	@RequestMapping(value = "/member/join", method = RequestMethod.GET)
	public String join() {
		return ".join";
	}
	
	@RequestMapping(value = "login/forgotpwd", method = RequestMethod.GET)
	public String loginForgotPassword() {
		return ".loginforgotpw";
	}
	
	@RequestMapping(value = "host/home", method = RequestMethod.GET)
	public String hostHome() {
		return ".hosthome";
	}
	
	@RequestMapping(value="search/host", method=RequestMethod.POST)
	public String hostSearch(String locationAdress, String start_day, String end_day, int people_count, HttpSession session) {
		JSONObject json = new JSONObject();
		json.put("locationAdress", locationAdress);
		json.put("start_day", start_day);
		json.put("end_day", end_day);
		json.put("people_count", people_count);
		
		
		session.setAttribute("hostSearch", json);
		return ".hostsearch";
	}
}
