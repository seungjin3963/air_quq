package com.jhta.airqnq.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.airqnq.service.HostResCheckService;
import com.jhta.airqnq.vo.EP_ManagementVo;
import com.jhta.airqnq.vo.RentVo;

@Controller
public class HostReservationCheckController {
	@Autowired private HostResCheckService service;
	
	
	@RequestMapping("/host/ResCheck")
	public String ResCheck(HttpSession session , Model model) {
		int menum=(int)session.getAttribute("menum");
		
		List<EP_ManagementVo> ResListE=service.ResListE(menum);
		model.addAttribute("ResListE",ResListE);
		
		List<EP_ManagementVo> ResListH=service.ResListH(menum);
		model.addAttribute("ResListH",ResListH);
		
		return ".host.HostReservationCheck";
	}
	
	@RequestMapping(value = "/host/ResPeople" ,produces = "application/json;charset=utf-8")
	@ResponseBody
	public String ResPeople(int hinum) {
		
		List<RentVo> ResVo=service.ResPeople(hinum);
		
		JSONObject json=new JSONObject();
		json.put("ResVo", ResVo);
		return json.toString();
	}
	@RequestMapping(value = "/host/ResCheckUpate" ,produces = "application/json;charset=utf-8")
	@ResponseBody
	public String ResCheckUpate(int hinum , HttpSession session ) {
		
		int n=service.ResCheckUpdate(hinum);
		int menum=(int)session.getAttribute("menum");
		
		List<EP_ManagementVo> ResListE=service.ResListE(menum);
		
		
		JSONObject json=new JSONObject();
		json.put("ResListE", ResListE);
		return json.toString();
		
		
	}
	
	@RequestMapping(value = "/host/ResCheckUpateHouse" ,produces = "application/json;charset=utf-8")
	@ResponseBody
	public String ResCheckUpateHouse(int hinum , HttpSession session ) {
		
		int n=service.ResCheckUpdate(hinum);
		int menum=(int)session.getAttribute("menum");
		
		List<EP_ManagementVo> ResListH=service.ResListH(menum);
		
		
		JSONObject json=new JSONObject();
		json.put("ResListH", ResListH);
		return json.toString();
		
		
	}
}
