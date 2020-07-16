package com.jhta.airqnq.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.airqnq.pageUtil.PageUtil;
import com.jhta.airqnq.service.MemberService;
import com.jhta.airqnq.vo.JoinVo;

@Controller
public class AdminController {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/admin")
	public String admin() {
		return ".admin";
	}
	
	@GetMapping("/admin/member/list")
	public String memberlist(Model model, @RequestParam(value="pageNum",defaultValue = "1")int pageNum,String field,String keyword) {

		HashMap<String, Object> map=new HashMap<String, Object>();
		
		map.put("keyword", keyword);
		map.put("field",field);
		
		int totalRowCount=service.MemberCnt(map);
		
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 10, 2);
		
		map.put("startRow",pu.getStartRow());
		map.put("rowblockcount",pu.getRowBlockCount());
		
		List<JoinVo> Memberlist = service.Memberlist(map);
		
		model.addAttribute("pu", pu);
		model.addAttribute("Memberlist", Memberlist);
		model.addAttribute("keyword", keyword);
		model.addAttribute("field", field);
		return ".admin.memberadmin";
	}
	
	@RequestMapping("/json/memberlistfind")
	@ResponseBody
	public HashMap<String, Object> memberlistfind(@RequestParam(value="pageNum",defaultValue = "1")int pageNum,String field,String keyword) {

		HashMap<String, Object> map=new HashMap<String, Object>();
		HashMap<String, Object> returndata=new HashMap<String, Object>();
		
		map.put("keyword", keyword);
		map.put("field",field);
		
		int totalRowCount=service.MemberCnt(map);
		
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 10, 2);
		
		map.put("startRow",pu.getStartRow());
		map.put("rowblockcount",pu.getRowBlockCount());
		
		List<JoinVo> Memberlist = service.Memberlist(map);
		
		returndata.put("pu", pu);
		returndata.put("Memberlist", Memberlist);
		returndata.put("keyword", keyword);
		returndata.put("field", field);
		return returndata;
	}
	
}
