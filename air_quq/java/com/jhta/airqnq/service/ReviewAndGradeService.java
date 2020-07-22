package com.jhta.airqnq.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.airqnq.dao.ReviewAndGradeDao;
import com.jhta.airqnq.vo.ReviewAndGradeVo;

@Service
public class ReviewAndGradeService {
	@Autowired
	private ReviewAndGradeDao dao;

	@Transactional
	public void reviewAndGradeSave(Map<String, Object> map) {
		int renum = dao.selReviewAndGrade(map);
		if(renum == -1) {
			dao.insReview(map);
			dao.insGrade(map);
		}else {
			map.put("renum", renum);
			dao.updReview(map);
			dao.updGrade(map);
		}
	}

	public ReviewAndGradeVo selReviewGrade(Map<String, Object> map) {
		return dao.selReviewGrade(map);
	}
}
