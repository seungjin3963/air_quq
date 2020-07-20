package com.jhta.airqnq.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.HouseImgVo;

@Repository
public class HostInfoImageDao {
	@Autowired
	private SqlSessionTemplate session;
	
	private final String NAMESPACE = "com.jhta.airqnq.mapper.HostInfoMapper";
	
	public int insertHouseImg(HouseImgVo vo) {
		return session.insert(NAMESPACE + ".hostImgInsert", vo);
	}
}
