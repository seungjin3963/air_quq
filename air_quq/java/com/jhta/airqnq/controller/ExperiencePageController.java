package com.jhta.airqnq.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.airqnq.service.ExperienceService;
import com.jhta.airqnq.vo.ExperienceInfoVo;
import com.jhta.airqnq.vo.ExperienceVo;

@Controller
public class ExperiencePageController {
	@Autowired
	private ExperienceService service;

	@RequestMapping("/experience/myexperience") // 등록 전 화면
	public String experiencePage() {
		return ".experience.myexperience";
	}


	
	@RequestMapping("/experience/ep_insert/ep_type") //////// 페이지 이동
	public String experienceInsertType(int num, Model model, String value) {

		if (num == 1) {		
			return ".experience.ep_insert.ep_type";		
		} else if (num == 2) {		
			return ".experience.ep_insert.ep_location";		
		} else if (num == 3) { ////////////////////// 
			List<ExperienceVo> list = service.subject();
			model.addAttribute("list", list);
			model.addAttribute("category", "모든 주제");
			model.addAttribute("sub", "subject");
			return ".experience.ep_insert.ep_subject";
		} else if (num == 4) {
			return ".experience.ep_insert.ep_introduce";
		} else if (num == 5) {
			return ".experience.ep_insert.ep_program";
		} else if (num == 6) {
			return ".experience.ep_insert.ep_materials";
		} else if (num == 7) {
			return ".experience.ep_insert.ep_title";
		} else if (num == 8) {
			return ".experience.ep_insert.ep_insertimg";
		}
		return null;
	}

	@RequestMapping("/experince/ep_insert/subject") // 소주제 뽑아오기
	public String experinceSubject(int num, Model model, String name) {
		List<ExperienceVo> list = service.detailsub(num);

		model.addAttribute("list", list);
		model.addAttribute("category", name);
		model.addAttribute("sub", "detailsub");
		return ".experience.ep_insert.ep_subject";
	}

}
