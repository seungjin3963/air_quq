package com.jhta.airqnq.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.jhta.airqnq.service.AdminApproveService;
import com.jhta.airqnq.vo.EP_ManagementVo;

@Controller
public class AdminApproveController {
	@Autowired private AdminApproveService service;
	
	@RequestMapping("/admin/approve") // 온라인,체험 승인 기다리는 list
	public String adminapprove(Model model) {
		List<EP_ManagementVo> eplist=service.approveEp();
		model.addAttribute("eplist" , eplist);
		return ".admin.adminapprove";
	}
	
	@RequestMapping("/admin/ep_getinfo")
	@ResponseBody
	public String adminEp_getinfo(int hinum ,HttpSession session) { //hinum의 정보,이미지 뽑아오기
		String uploadPath=
				session.getServletContext().getRealPath("/resources/img/house_img");
		
		List<EP_ManagementVo> list=service.epappImg(hinum);	
		System.out.println(list+"  확인");
		JSONObject json=new JSONObject();
		json.put("uploadPath", uploadPath);
		json.put("list", list);
		
		
		return  json.toString();
	}
}
