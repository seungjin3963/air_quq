package com.jhta.airqnq.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.ReportTypeVo;

@Repository
public class ReportDao {
	@Autowired
	private SqlSessionTemplate session;

	private final String NAMESPACE = "com.jhta.airqnq.mapper.ReportMapper";
	
	public List<ReportTypeVo> selType() {
		return session.selectList(NAMESPACE + ".selType");
	}

	public int save(Map<String, Object> map) {
		return session.insert(NAMESPACE + ".save", map);
	}
}
