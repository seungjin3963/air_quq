package com.jhta.airqnq.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.airqnq.pageUtil.PageUtilForMySql;
import com.jhta.airqnq.service.AdminApproveService;
import com.jhta.airqnq.vo.EP_ManagementVo;
import com.jhta.airqnq.vo.HouseInfoVo;

@Controller
public class AdminApproveController {
	@Autowired private AdminApproveService service;
	
	@RequestMapping("/admin/approve") // 온라인,체험 승인 기다리는 list
	public String adminapprove(Model model) {
		int eplistC=service.approveEpC();
		PageUtilForMySql experiencePage=new PageUtilForMySql(1,eplistC,5,1);
			
		List<EP_ManagementVo> eplist=service.approveEp(experiencePage.getStartRow());
		model.addAttribute("eplist" , eplist);
		model.addAttribute("experiencePage" ,experiencePage);
		
		
		//숙소 호스트 승인 기능 구현
		int hmlistC=service.approveHmC(0);
		PageUtilForMySql housePage=new PageUtilForMySql(1,hmlistC,5,1);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("manager_check", 0);
		map.put("row", housePage.getStartRow());
		List<HouseInfoVo> hmlist = service.getHostManagerApprovalList(map);
		model.addAttribute("hmlist", hmlist);
		model.addAttribute("housePage" ,housePage);
		
		return ".admin.adminapprove";
	}
	
	//숙소 호스트 승인
	@RequestMapping(value = "/admin/approve/rnjOk")
	public String setRegistAndrejection(int hinum) {
		System.out.println(hinum);
		
		int r = service.updateManagerApproval(hinum);
		if(r>0) {
			return "redirect:/admin/approve";
		} else {
			return ".error";
		}
		
	}
	
	//숙소 호스트 승인 거절
	@RequestMapping(value = "/admin/approve/rnjFail")
	public String setRegistAndrejectionFail(int hinum) {
		System.out.println(hinum);
		
		int r = service.updateManagerApprovalFail(hinum);
		if(r>0) {
			return "redirect:/admin/approve";
		} else {
			return ".error";
		}
		
	}
	
	@RequestMapping(value = "/admin/ep_getinfo" ,produces = "application/json;charset=utf-8")
	@ResponseBody
	public String adminEp_getinfo(int hinum ,HttpSession session ) { //hinum의 정보,이미지 뽑아오기
		String uploadPath=
				session.getServletContext().getRealPath("/resources/img/house_img");
		JSONObject json=new JSONObject();
		List<EP_ManagementVo> list=service.epappImg(hinum);	
		json.put("list", list);
		EP_ManagementVo listinfo=service.epappinfo(hinum);
		
	//	json.put("div_type", listinfo.getDiv_type());
		json.put("title",  listinfo.getTitle());		
		json.put("subname", listinfo.getSubname());		
		json.put("loc", listinfo.getLoc());	
		json.put("intr", listinfo.getIntr());
		json.put("program", listinfo.getProgram());
		json.put("price", listinfo.getPrice());
		json.put("times", listinfo.getTimes());
		json.put("mater", listinfo.getMater());
		return  json.toString();
	}
	
	@RequestMapping(value = "/admin/epapproveOk" ,produces = "application/json;charset=utf-8")
	@ResponseBody
	public String adminepappOk(int hinum ,int epappdivtype) {
		if(epappdivtype==32 || epappdivtype==39) {
			epappdivtype=3;
		}
		if(epappdivtype==42 || epappdivtype==49) {
			epappdivtype=4;
		}
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("hinum", hinum);
		map.put("div_type", epappdivtype);
		JSONObject json=new JSONObject();
		
		int n=service.epappOk(map);
		if(n==1) {
			String value="승인 완료 되었습니다";
			json.put("value", value);
		}else {
			String value="오류!";
			json.put("value", value);
		}
		return json.toString();
	}
	
	@RequestMapping(value = "/admin/epapproveNo" ,produces = "application/json;charset=utf-8")
	@ResponseBody
	public String adminepappNo(int hinum , int epappdivtype , String textAreavalue) {
		
		String value="";
		int divtype=0;
		if(epappdivtype==32) {
			divtype=39;
		}else {
			divtype=49;
		}
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("divtype", divtype);
		map.put("hinum", hinum);
		map.put("text", textAreavalue);
		int n=service.epappNo(map);
		if(n==1) {
			value="반려 되엇습니다";
		}else {
			value="실패 하였습니다.";
		}
		JSONObject json=new JSONObject();
		json.put("value", value);
		return json.toString();
	}
	
	@RequestMapping(value = "/admin/epapprovePage" ,produces = "application/json;charset=utf-8")
	@ResponseBody
	public String epapprovePage(int pageNum , Model model) {
		int eplistC=service.approveEpC();
		PageUtilForMySql experiencePage=new PageUtilForMySql(pageNum,eplistC,5,1);	
		List<EP_ManagementVo> eplist=service.approveEp(experiencePage.getStartRow());	
		JSONObject json=new JSONObject();
		json.put("eplist", eplist);	
		return json.toString();
		
	}
	
	@RequestMapping(value = "/admin/hmapprovePage" ,produces = "application/json;charset=utf-8")
	@ResponseBody
	public String hmapprovePage(int pageNum , Model model) {
		
		JSONObject json=new JSONObject();
		
		//숙소 호스트 승인 기능 구현
		int hmlistC=service.approveHmC(0);
		PageUtilForMySql housePage=new PageUtilForMySql(pageNum,hmlistC,5,1);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("manager_check", 0);
		map.put("row", housePage.getStartRow());
		List<HouseInfoVo> hmlist = service.getHostManagerApprovalList(map);
		json.put("hmlist",hmlist );	
		json.put("housePage",housePage );	
		
		
		return json.toString();
		
	}
	
}
