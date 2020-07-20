package com.jhta.airqnq.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.HouseInfoVo;

@Repository
public class HostInfoDao {
	@Autowired
	private SqlSessionTemplate session;
	
	private final String NAMESPACE = "com.jhta.airqnq.mapper.HostInfoMapper";
	
	public int insertHouse(HouseInfoVo vo) {
		return session.insert(NAMESPACE + ".hostInsert");
	}
}
