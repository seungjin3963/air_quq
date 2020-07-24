package com.jhta.airqnq.controller;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.airqnq.pageUtil.PageUtilForMySql;
import com.jhta.airqnq.service.OnlineListServer;
import com.jhta.airqnq.vo.EP_ManagementVo;

@Controller
public class OnlineListController {
	@Autowired private OnlineListServer service;
	
	@RequestMapping("/ep_OnlineList")
	public String Ep_OnlineList(Model model) {
		
		int CookListC=service.onlineCookListC();
		PageUtilForMySql cookPageUtil=new PageUtilForMySql(1,CookListC,5,1);	
		List<EP_ManagementVo> cooklist=service.onlineCookList(cookPageUtil.getStartRow()); 
		model.addAttribute("CookList" ,cooklist);//요리
		model.addAttribute("cookPageUtil" ,cookPageUtil);//요리
		
		int sportlistC=service.onlineSportListC();
		PageUtilForMySql sportPageUtil=new PageUtilForMySql(1,sportlistC,5,1);	
		List<EP_ManagementVo> sportlist=service.onlineSportList(sportPageUtil.getStartRow());
		model.addAttribute("sportlist" ,sportlist);//스포츠
		model.addAttribute("sportPageUtil" ,sportPageUtil);//스포츠
		
		int regdatelistC=service.OnlineRegdateListC();
		PageUtilForMySql regdatePageUtil=new PageUtilForMySql(1,regdatelistC,5,1);
		List<EP_ManagementVo> regdatelist=service.OnlineRegdateList(regdatePageUtil.getStartRow());
		model.addAttribute("regdatelist" ,regdatelist);//신규
		model.addAttribute("regdatePageUtil" ,regdatePageUtil);// 갯수
		
		int OnlineAllList=service.OnlineAllListC();
		PageUtilForMySql AllListPageUtil=new PageUtilForMySql(1,OnlineAllList,15,1);
		List<EP_ManagementVo> Alllist=service.OnlineAlllList(AllListPageUtil.getStartRow());
		model.addAttribute("Alllist" ,Alllist);//전체
		model.addAttribute("AllListPageUtil" ,AllListPageUtil);// 전체
		return ".ep_SearchList.OnlineAllList";
	}
	
	@RequestMapping(value = "/ep_AllList" ,produces = "application/json;charset=utf-8")
	@ResponseBody
	public String Ep_AllList(int pagenum, int AllListtotal) {
		
		JSONObject json=new JSONObject();
		PageUtilForMySql AllListPageUtil=new PageUtilForMySql(pagenum,AllListtotal,15,1);
		List<EP_ManagementVo> alllist=service.OnlineAlllList(AllListPageUtil.getStartRow());
	
		json.put("alllist", alllist);
		json.put("AllListPageUtil", AllListPageUtil);
		return  json.toString();
		
	}
	
	
	
	
	@RequestMapping(value = "/ep_cook" ,produces = "application/json;charset=utf-8")
	@ResponseBody
	public String Ep_cook(int pagenum, int cooktotalR) {
		
		JSONObject json=new JSONObject();
		PageUtilForMySql cookPageUtil=new PageUtilForMySql(pagenum,cooktotalR,5,1);
		List<EP_ManagementVo> cooklist=service.onlineCookList(cookPageUtil.getStartRow());
				
		json.put("cooklist", cooklist);
		return  json.toString();
		
	}
	
	
	
	
	
	
	
	@RequestMapping(value = "/ep_sport" ,produces = "application/json;charset=utf-8")
	@ResponseBody
	public String Ep_sport(int pagenum, int sporttotalR) {
		
		JSONObject json=new JSONObject();
		PageUtilForMySql sportPageUtil=new PageUtilForMySql(pagenum,sporttotalR,5,1);
		List<EP_ManagementVo> sportlist=service.onlineSportList(sportPageUtil.getStartRow());
			
		json.put("sportlist", sportlist);
		return  json.toString();	
	}
	
	@RequestMapping(value = "/ep_regdate" ,produces = "application/json;charset=utf-8")
	@ResponseBody
	public String Ep_regdate(int pagenum, int regdatetotalR) {
		JSONObject json=new JSONObject();
		
		PageUtilForMySql regdatePageUtil=new PageUtilForMySql(pagenum,regdatetotalR,5,1);
		List<EP_ManagementVo> regdatelist=service.OnlineRegdateList(regdatePageUtil.getStartRow());	
		json.put("regdatelist", regdatelist);
		
		return  json.toString();
		
	}
}
