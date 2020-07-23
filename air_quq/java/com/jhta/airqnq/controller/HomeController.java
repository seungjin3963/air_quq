package com.jhta.airqnq.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.airqnq.service.HostInfoService;
import com.jhta.airqnq.vo.HouseInfoVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController{
	@Autowired
	private HostInfoService hostService;
	
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
	public String hostSearch(String locationAdress, Date start_day, Date end_day, int people_count, HttpSession session) {
		

		HouseInfoVo vo = new HouseInfoVo(0, 0, "", "", locationAdress, "", 0, people_count, 0, "", 1, "","", start_day, end_day, "n", 1);
		List<HouseInfoVo> list = getHouseInfo(vo);
		
		
		for(HouseInfoVo hvo : list) {
			String path = hostService.getHouseImg(hvo.getHinum());
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put(hvo.getHinum().toString(), path);
			session.setAttribute("img", map);
		}
		
		session.setAttribute("hostSearch", list);
		return ".hostsearch";
	}
	
	public List<HouseInfoVo> getHouseInfo(HouseInfoVo vo){
		return hostService.getHouseInfoList(vo);
	}
}
