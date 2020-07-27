package com.jhta.airqnq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.airqnq.service.ApplyService;
import com.jhta.airqnq.service.ReviewAndGradeService;
import com.jhta.airqnq.vo.GradeOneVo;
import com.jhta.airqnq.vo.RentListVo;
import com.jhta.airqnq.vo.ReviewAndGradeVo;

@Controller
public class ReviewAndGradeController {
	@Autowired
	private ApplyService applyService;

	@Autowired
	private ReviewAndGradeService ragService;

	@GetMapping("/user/apply/list")
	public String list() {
		return ".apply.list";
	}

	@GetMapping("/user/apply/getApplyExpList")
	@ResponseBody
	public List<RentListVo> getApplyExpList(HttpSession session) {
		int menum = (int) session.getAttribute("menum");
		return applyService.applyExpList(menum);
	}
	
	@GetMapping("/user/apply/getApplyHouseList")
	@ResponseBody
	public List<RentListVo> getApplyHouseList(HttpSession session) {
		int menum = (int) session.getAttribute("menum");
		return applyService.applyList(menum);
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
	public List<GradeOneVo> selReviewGrade(int rtnum, int hinum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rtnum", rtnum);
		map.put("hinum", hinum);
		List<GradeOneVo> gradeList = ragService.selReviewGrade(map);
		return gradeList;
	}
}
