package com.jhta.airqnq.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		System.out.println(pageNum);

		map.put("keyword", keyword);
		map.put("field",field);
		
		int totalRowCount=service.MemberCnt(map);
		
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 10, 2);
		
		map.put("startRow",pu.getStartRow());
		
		map.put("rowblockcount",pu.getRowBlockCount());
		
		List<JoinVo> Memberlist = service.Memberlist(map);
		
		model.addAttribute("pu", pu);
		model.addAttribute("Memberlist", Memberlist);
		
		return ".admin.memberadmin";
	}
}
