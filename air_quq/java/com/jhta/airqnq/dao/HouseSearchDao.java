package com.jhta.airqnq.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.HouseSearchVo;
@Repository
public class HouseSearchDao {
	@Autowired private SqlSessionTemplate sqlsession;
	private final String NAMESPACE = "com.jhta.airqnq.mapper.HostInfoMapper";
	
	public int getSearchCount(HouseSearchVo vo) {
		return sqlsession.selectOne(NAMESPACE + ".houseSearchCount", vo);
	}
	
	//모든게시글 카운트
	public int getSearchCount() {
		return sqlsession.selectOne(NAMESPACE + ".selectHouseAllCount");
	}
}
