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
import com.jhta.airqnq.vo.MainHouseInfoVo;

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
		
		//테스트위해서 매니져체크 0으로줬음
		HouseInfoVo vo = new HouseInfoVo(0, 0, "", "", locationAdress, "", 0, people_count, 0, "", 1, "","", start_day, end_day, "n", 0);
		List<MainHouseInfoVo> list = getHouseInfo(vo);
		
		session.setAttribute("hostSearch", list);
		session.setAttribute("start_day", start_day);
		session.setAttribute("end_day", end_day);
		session.setAttribute("people_count", people_count);
		
		return ".hostsearch";
	}
	
	public List<MainHouseInfoVo> getHouseInfo(HouseInfoVo vo){
		return hostService.getMainHouseInfoList(vo);
	}
}
