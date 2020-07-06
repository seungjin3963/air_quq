package com.jhta.airqnq.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.TestVo;

@Repository
public class TestDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public TestVo testSelect(int num) {
		return sqlSessionTemplate.selectOne("com.jhta.airqnq.mapper.TestMapper.select", num);
	}
}
