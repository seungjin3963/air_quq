package com.jhta.airqnq.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.SliderVo;

@Repository
public class EpOnlineDao {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	private final String NAMESPACE ="com.jhta.mybatis.mapper.epOnlineMapper";
	
	public List<SliderVo> outslider(){
		return sql.selectList(NAMESPACE+".outslider");
	}
	public List<SliderVo> inslider(int hinum){
		return sql.selectList(NAMESPACE+".inslider",hinum);
	}

}
