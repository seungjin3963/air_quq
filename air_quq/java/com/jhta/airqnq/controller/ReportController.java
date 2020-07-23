package com.jhta.airqnq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.airqnq.service.ReportService;
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
}
