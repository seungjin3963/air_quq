package com.jhta.airqnq.dao;

import java.util.List;

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
	
	public RentVo rentselect(int rtnum) {
		return sqlsessiontemplate.selectOne(NAMESPACE+".rentselect", rtnum);
	}

	public List<RentVo> rentdata() {
		return sqlsessiontemplate.selectList(NAMESPACE+".rentdata");
	}
	
	public List<RentVo> hinumrentselect(int hinum){
		return sqlsessiontemplate.selectList(NAMESPACE+".hinumrentselect", hinum);
	}
	
}
