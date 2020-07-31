package com.jhta.airqnq.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.EP_ManagementVo;
import com.jhta.airqnq.vo.basketVo;

@Repository
public class OnlineListDao {
	@Autowired private SqlSessionTemplate sqlsessiontemplate;
	
	private final String NAMESPACE ="com.jhta.airqnq.mapper.OnlineListMapper";
	
	public List<EP_ManagementVo> OnlineAlllList(int row){	
		return sqlsessiontemplate.selectList(NAMESPACE + ".OnlineAlllList" , row);
	}
	public int OnlineAllListC(){
		return sqlsessiontemplate.selectOne(NAMESPACE + ".OnlineAllListC");
	}
	
	
	
	public List<EP_ManagementVo> onlineCookList(int row){	
		return sqlsessiontemplate.selectList(NAMESPACE + ".OnlineCookList" , row);
	}
	public int onlineCookListC(){
		return sqlsessiontemplate.selectOne(NAMESPACE + ".onlineCookListC");
	}
	
	public List<EP_ManagementVo> onlineSportList(int row){
		return sqlsessiontemplate.selectList(NAMESPACE + ".OnlineSportList" , row);
	}
	public int onlineSportListC(){
		return sqlsessiontemplate.selectOne(NAMESPACE + ".OnlineSportListC");
	}
	
	
	public List<EP_ManagementVo> OnlineRegdateList(int row){	
		return sqlsessiontemplate.selectList(NAMESPACE + ".OnlineRegdateList" , row);
	}
	public int OnlineRegdateListC(){	
		return sqlsessiontemplate.selectOne(NAMESPACE + ".OnlineRegdateListC");
	}
	
	
	public int onlineMyPickInsert(HashMap<String, Object> map) {
		return sqlsessiontemplate.insert(NAMESPACE + ".onlineMyPickInsert" , map);
	}
	public int onlineMyPickDelete(HashMap<String, Object> map) {
		return sqlsessiontemplate.insert(NAMESPACE + ".onlineMyPickDelete" , map);
	}
	public List<basketVo> basketlist(int menum){
		return sqlsessiontemplate.selectList(NAMESPACE + ".basketlist" ,menum);
	}
	
	public List<EP_ManagementVo> Picklist(int menum) {
		return sqlsessiontemplate.selectList(NAMESPACE + ".Picklist" , menum);
	}
	
	
}
