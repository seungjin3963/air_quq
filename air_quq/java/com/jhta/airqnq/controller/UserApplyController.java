package com.jhta.airqnq.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.airqnq.service.ApplyService;
import com.jhta.airqnq.service.House_infoAdminService;
import com.jhta.airqnq.vo.ApplyVo;
import com.jhta.airqnq.vo.Apply_infoVo;
import com.jhta.airqnq.vo.MemberVo;

@Controller
public class UserApplyController {

	@Autowired
	private ApplyService service;

	@Autowired
	private House_infoAdminService house_infoService;

	@RequestMapping("/user/apply")
	public String userapply(Model model,int hinum) {
		
		Apply_infoVo infovo= house_infoService.HinumSelect(hinum);
		
		model.addAttribute("infovo", infovo);

		return ".apply.userapply";
	}

	@PostMapping(value = "/user/apply/setApply")
	@ResponseBody
	public void totmoney(HttpSession session, ApplyVo vo) {
		session.setAttribute("applyVo", vo);
	}

	@GetMapping(value = "/user/applyCheck")
	public String apply() {
		return ".apply.applyCheck";
	}

	@GetMapping("/user/applyCheck/getMemberInfo")
	@ResponseBody
	public MemberVo getMemberInfo(HttpSession session) {
		return (MemberVo) session.getAttribute("memberVo");
	}
	
	@PostMapping("/user/apply/cencel")
	@ResponseBody
	public String applyCencel(HttpSession session, int rtnum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menum", session.getAttribute("menum"));
		map.put("rtnum", rtnum);
		try {
			service.applyCencel(map);
			return "success";
		}catch (Exception e) {
			System.out.println(e.getMessage());
			return "error";
		}
	}
}
