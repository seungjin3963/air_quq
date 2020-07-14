package com.jhta.airqnq.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE = "com.jhta.airqnq.mapper.LoginMapper";
	
	public int loginCheck(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectOne(NAMESPACE + ".loginCheck", map);
	}
	
	public int kakaoCheck(String menum) {
		return sqlSessionTemplate.selectOne(NAMESPACE + ".kakaoCheck", menum);
	}
}
