package com.jhta.airqnq.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.GradeOneVo;
import com.jhta.airqnq.vo.ReviewAndGradeVo;
import com.jhta.airqnq.vo.ReviewGradeVo;

@Repository
public class ReviewAndGradeDao {
	@Autowired
	private SqlSessionTemplate session;

	private final String NAMESPACE = "com.jhta.airqnq.mapper.ReviewAndGradeMapper";

	public void insReview(Map<String, Object> map) {
		session.insert(NAMESPACE + ".reviewSave", map);
	}

	public void insGrade(Map<String, Object> map) {
		session.insert(NAMESPACE + ".gradeSave", map);
	}

	public int selReviewAndGrade(Map<String, Object> map) {
		return session.selectOne(NAMESPACE + ".selReviewAndGrade", map);
	}

	public void updReview(Map<String, Object> map) {
		session.update(NAMESPACE + ".updReview", map);
	}

	public void updGrade(Map<String, Object> map) {
		session.update(NAMESPACE + ".updGrade", map);
	}

	public List<GradeOneVo> selReviewGrade(Map<String, Object> map) {
		return session.selectList(NAMESPACE + ".selReviewGrade", map);
	}
	
	/* 승진 */
	public List<ReviewGradeVo> selectreviewandgrade(int hinum){
		return session.selectList(NAMESPACE +".selectreviewandgrade", hinum);
	}
}
