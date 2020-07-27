package com.jhta.airqnq.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.RentListVo;

@Repository
public class ApplyDao {
	@Autowired
	private SqlSessionTemplate session;

	private final String NAMESPACE = "com.jhta.airqnq.mapper.RentMapper";

	public List<RentListVo> applyList(int menum) {
		return session.selectList(NAMESPACE + ".list", menum);
	}

	public void delGrade(Map<String, Object> map) {
		session.update(NAMESPACE + ".delGrade", map);
	}

	public void delReview(Map<String, Object> map) {
		session.update(NAMESPACE + ".delReview", map);
	}

	public void delRent(Map<String, Object> map) {
		session.update(NAMESPACE + ".delRent", map);
	}

	public List<RentListVo> applyExpList(int menum) {
		return session.selectList(NAMESPACE + ".applyExpList", menum);
	}
}
