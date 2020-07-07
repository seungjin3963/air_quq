package com.jhta.airqnq.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.ExperienceVo;

@Repository
public class ExperienceDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ExperienceVo> subject(){
		return sqlSessionTemplate.selectList("ep_subject");
	}
	
	public List<ExperienceVo> detailsub(int num){
		return sqlSessionTemplate.selectList("ep_detailsub" , num);
	}
}
