package com.jhta.airqnq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.airqnq.service.ReportService;
import com.jhta.airqnq.vo.Apply_infoVo;
import com.jhta.airqnq.vo.ReportTypeVo;

@Controller
public class ReportController {
	@Autowired
	private ReportService service;

	@GetMapping("/report/selType")
	@ResponseBody
	public List<ReportTypeVo> selType() {
		return service.selType();
	}

	@PostMapping("/report/save")
	@ResponseBody
	public String save(HttpSession session, int hinum, String content) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menum", (int) session.getAttribute("menum"));
		map.put("hinum", hinum);
		map.put("content", content);
		if (service.save(map) > 0) {
			return "success";
		} else {
			return "/error";
		}
	}
}
