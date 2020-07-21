package com.jhta.airqnq.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.RentVo;

@Repository
public class ApplyDao {
	@Autowired
	private SqlSessionTemplate session;

	private final String NAMESPACE = "com.jhta.airqnq.mapper.RentMapper";

	public List<RentVo> applyList(int menum) {
		return session.selectList(NAMESPACE + ".list", menum);
	}
}
