package com.jhta.airqnq.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewAndGradeDao {
	@Autowired
	private SqlSessionTemplate session;
	
	private final String NAMESPACE = "com.jhta.airqnq.mapper.ReviewAndGradeMapper";

	public void reviewSave(Map<String, Object> map) {
		session.insert(NAMESPACE + ".reviewSave", map);
	}

	public void gradeSave(Map<String, Object> map) {
		session.insert(NAMESPACE + ".gradeSave", map);
	}
}
