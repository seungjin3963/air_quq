package com.jhta.airqnq.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.RentVo;

@Repository
public class RentDao {
	@Autowired
	private SqlSessionTemplate sqlsessiontemplate;
	
	private final String NAMESPACE="com.jhta.airqnq.mapper.RentMapper";
	
	public int rentinsert(RentVo vo) {
		return sqlsessiontemplate.insert(NAMESPACE+".rentinsert", vo);
	}
}
