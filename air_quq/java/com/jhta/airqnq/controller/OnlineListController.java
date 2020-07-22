package com.jhta.airqnq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.airqnq.pageUtil.PageUtilForMySql;
import com.jhta.airqnq.service.OnlineListServer;
import com.jhta.airqnq.vo.EP_ManagementVo;

@Controller
public class OnlineListController {
	@Autowired private OnlineListServer service;
	
	@RequestMapping("/ep_OnlineList")
	public String Ep_OnlineList(Model model) {
		List<EP_ManagementVo> cooklist=service.onlineCookList(); 
		model.addAttribute("CookList" ,cooklist);//요리
		
		
		List<EP_ManagementVo> sportlist=service.onlineSportList();
		model.addAttribute("sportlist" ,sportlist);//스포츠
		
		
		int regdatelistC=service.OnlineRegdateListC();
		PageUtilForMySql regdatePageUtil=new PageUtilForMySql(1,regdatelistC,5,1);
		
		List<EP_ManagementVo> regdatelist=service.OnlineRegdateList(regdatePageUtil.getStartRow());
		model.addAttribute("regdatelist" ,regdatelist);//신규
		model.addAttribute("regdatePageUtil" ,regdatePageUtil);// 갯수
		
		
		
		return ".ep_SearchList.OnlineAllList";
	}
}
