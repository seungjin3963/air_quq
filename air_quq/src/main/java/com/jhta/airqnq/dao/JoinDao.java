package com.jhta.airqnq.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JoinDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
}
