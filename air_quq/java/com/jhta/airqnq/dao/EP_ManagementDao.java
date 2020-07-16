package com.jhta.airqnq.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.EP_ManagementVo;

@Repository
public class EP_ManagementDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="mybatis.EP_ManagementMapper";
	public int ep_inserting(String id){
		return sqlSessionTemplate.selectOne(NAMESPACE+".ep_inserting", id);
	}
	public List<EP_ManagementVo> ep_insertlist(int loginnum) {
		return sqlSessionTemplate.selectList(NAMESPACE+".ep_insertlist" , loginnum);
	}
	public EP_ManagementVo ep_management(int hinum) {
		return sqlSessionTemplate.selectOne(NAMESPACE+".ep_management" , hinum);
	}
	public int ep_list_delete(int hinum) {
		 sqlSessionTemplate.delete(NAMESPACE+".ep_list_delete" , hinum);
		return sqlSessionTemplate.delete(NAMESPACE+".ep_list_delete1" , hinum);
	}
	
	
	
}
