package com.jhta.airqnq.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.airqnq.dao.ReviewAndGradeDao;

@Service
public class ReviewAndGradeService {
	@Autowired
	private ReviewAndGradeDao dao;

	@Transactional
	public void reviewAndGradeSave(Map<String, Object> map) {
		dao.reviewSave(map);
		dao.gradeSave(map);
	}
}
