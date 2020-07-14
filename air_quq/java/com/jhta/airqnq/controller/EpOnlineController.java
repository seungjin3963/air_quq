package com.jhta.airqnq.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.airqnq.service.EpOnlineService;
import com.jhta.airqnq.vo.SliderVo;

@Controller
public class EpOnlineController {
	
	@Autowired
	private EpOnlineService service;
	
	
	@RequestMapping("/online/home")
	public String goHome(Model model) {
		//여기서 각각 리스트 매퍼연결해서 어떤거 가져와야하는지 검색조건(유명셰프,6시간이내,서울인기체험,새로등록된체험(3시간이내),저렴한 가격,베스트체험(별높은 순),전체)
		HashMap<String, SliderVo> imglist= new HashMap<String,SliderVo>();
		imglist.put("outslider", (SliderVo)service.outslider());
		model.addAttribute("list1", imglist);
		return  ".epOnline.layout";
	}
	
	@RequestMapping("/online/details")
	public String goDetails(int einum,Model model) {
		Map<String, SliderVo> details= new HashMap<String,SliderVo>();
		System.out.println(service.inslider(einum));
		details.put("details",(SliderVo)service.inslider(einum));
		model.addAttribute("list2",details);
		return ".epOnline.details.detail";
	}
	
	@GetMapping(value="/epOnline/epOnline")
	public String epOnLine() {
		return ".epOnline.epOnline";
	}
	
	@GetMapping(value="/epOnline/modify")
	public String modify(){
		return "";
	}
}


