package com.jhta.airqnq.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EP_SearchDao {
	@Autowired private SqlSessionTemplate sqlsessiontemplate;
}
