package com.jhta.airqnq.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExperienceDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
}
