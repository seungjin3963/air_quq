package com.jhta.airqnq.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.airqnq.service.ApplyService;
import com.jhta.airqnq.vo.ApplyVo;
import com.jhta.airqnq.vo.MemberVo;

@Controller
public class UserApplyController {

	@Autowired
	private ApplyService service;

	@GetMapping("/user/apply")
	public String userapply(Model model) {
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
}
