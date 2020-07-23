package com.jhta.airqnq.dao;

import java.util.HashMap;
import java.util.List;

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
		return session.insert(NAMESPACE + ".hostInsert", vo);
	}
	
	public int selectHouseNumber(int menum) {
		return session.selectOne(NAMESPACE + ".hostNumSelect", menum);
	}
	
	//하우스 정보 리스트 가져오기
	public List<HouseInfoVo> getHouseInfoList(HouseInfoVo vo){
		return session.selectList(NAMESPACE + ".houseGetList", vo);
	}
	
	//하우스 이미지 가져오기
	public String getHouseImg(int hinum) {
		return session.selectOne(NAMESPACE + ".houseGetImg", hinum);
	}
}
