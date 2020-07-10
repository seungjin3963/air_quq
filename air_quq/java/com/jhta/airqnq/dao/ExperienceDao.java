package com.jhta.airqnq.dao;

import java.util.ArrayList;
import java.util.HashMap;
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
	private final String NAMESPACE="mybatis.experienceMapper";
	public List<ExperienceVo> subject(){
		return sqlSessionTemplate.selectList(NAMESPACE+".ep_subject");
	}
	public List<ExperienceVo> detailsub(int num){
		return sqlSessionTemplate.selectList(NAMESPACE+".ep_detailsub" , num);
	}
	public int temporary(int loginnum) {	
		sqlSessionTemplate.insert(NAMESPACE+".ep_temporary" , loginnum);
		return sqlSessionTemplate.selectOne(NAMESPACE+".ep_hinum");
	}
	public int insertexperience(int hinum) {
		return sqlSessionTemplate.insert(NAMESPACE+".insertexperience",hinum);
	}
	public int inserttype(HashMap<String, Object> map) {
		return sqlSessionTemplate.update(NAMESPACE+".ep_type", map);
	}
	public int insertloc(HashMap<String, Object> map) {
		return sqlSessionTemplate.update(NAMESPACE+".ep_loc", map);
	}
	public int insertsunum(HashMap<String, Object> map) {
		return sqlSessionTemplate.update(NAMESPACE+".ep_sub", map);
	}
	public int insertintr(HashMap<String, Object> map) {
		return sqlSessionTemplate.update(NAMESPACE+".ep_intr" ,map);
	}
	public int insertprogram(HashMap<String , Object> map) {
		return sqlSessionTemplate.update(NAMESPACE+".ep_program" , map);
	}
	public int inserttitle(HashMap<String, Object> map ) {
		return sqlSessionTemplate.update(NAMESPACE+".ep_title" , map);
	}
	public int insertpricetimes(HashMap<String, Object> map) {
		return sqlSessionTemplate.update(NAMESPACE+".ep_pricetimes" , map);
	}
	public int insertmater(HashMap<String, Object> map) {
		return sqlSessionTemplate.update(NAMESPACE+".ep_mater", map);
	}
	public int ep_delete(int hinum) {
		 sqlSessionTemplate.delete(NAMESPACE+".ep_deleteexper", hinum);
		return sqlSessionTemplate.delete(NAMESPACE+".ep_deletehous", hinum);
	}
	public int ep_updatediv(int hinum) {
		return sqlSessionTemplate.update(NAMESPACE+".ep_updatediv", hinum);	
	}
	public int ep_insertsession(HashMap<String, Object> map) {
		return sqlSessionTemplate.update(NAMESPACE+".ep_sessnum", map);
	}
} 
