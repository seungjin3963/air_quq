package com.jhta.airqnq.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.EP_ManagementVo;

@Repository
public class OnlineListDao {
	@Autowired private SqlSessionTemplate sqlsessiontemplate;
	
	private final String NAMESPACE ="com.jhta.airqnq.mapper.OnlineListMapper";
	
	public List<EP_ManagementVo> onlineCookList(){
		
		return sqlsessiontemplate.selectList(NAMESPACE + ".OnlineCookList");
	}
	public List<EP_ManagementVo> onlineSportList(){
		
		return sqlsessiontemplate.selectList(NAMESPACE + ".OnlineSportList");
	}
	public List<EP_ManagementVo> OnlineRegdateList(int row){
		
		return sqlsessiontemplate.selectList(NAMESPACE + ".OnlineRegdateList" , row);
	}
	public int OnlineRegdateListC(){
		
		return sqlsessiontemplate.selectOne(NAMESPACE + ".OnlineRegdateListC");
	}
}
