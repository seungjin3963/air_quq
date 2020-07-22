package com.jhta.airqnq.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.airqnq.service.ApplyService;
import com.jhta.airqnq.service.ReviewAndGradeService;
import com.jhta.airqnq.vo.ReviewAndGradeVo;

@Controller
public class ReviewAndGradeController {
	@Autowired
	private ApplyService applyService;

	@Autowired
	private ReviewAndGradeService ragService;

	@GetMapping("/user/apply/list")
	public String list(Model model, HttpSession session) {
		int menum = (int) session.getAttribute("menum");
		model.addAttribute("list", applyService.applyList(menum));
		return ".apply.list";
	}

	@PostMapping("/user/apply/reviewAndGradeSave")
	@ResponseBody
	public String reviewAndGradeSave(HttpSession session, ReviewAndGradeVo vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menum", (int) session.getAttribute("menum"));
		map.put("rtnum", vo.getRtnum());
		map.put("hinum", vo.getHinum());
		map.put("content", vo.getContent());
		map.put("cleanGrade", vo.getCleanGrade());
		map.put("accuracyGrade", vo.getAccuracyGrade());
		map.put("commuGrade", vo.getCommuGrade());
		map.put("positionGrade", vo.getPositionGrade());
		map.put("checkinGrade", vo.getCheckinGrade());
		map.put("satisGrade", vo.getSatisGrade());
		try {
			ragService.reviewAndGradeSave(map);
			return "success";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "error";
		}
	}
	
	@PostMapping("/user/selReviewGrade")
	@ResponseBody
	public ReviewAndGradeVo selReviewGrade(int rtnum, int hinum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rtnum", rtnum);
		map.put("hinum", hinum);
		ReviewAndGradeVo vo = ragService.selReviewGrade(map);
		return vo;
	}
}
