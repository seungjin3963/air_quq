package com.jhta.airqnq.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.EP_ManagementVo;
import com.jhta.airqnq.vo.ExperienceSearchVo;
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
	public int selectloginnum(String id) {
		return sqlSessionTemplate.selectOne(NAMESPACE+".ep_loginnum" , id);
	}
	
	public int temporary(int loginnum) {	
		sqlSessionTemplate.insert(NAMESPACE+".ep_temporary" , loginnum);
		return sqlSessionTemplate.selectOne(NAMESPACE+".ep_hinum");
	}
	public int insertexperience(HashMap<String,Object> map) {
		return sqlSessionTemplate.insert(NAMESPACE+".insertexperience",map);
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
		sqlSessionTemplate.delete(NAMESPACE+".ep_deletehousimh", hinum);
		sqlSessionTemplate.delete(NAMESPACE+".ep_deleteexper", hinum);
		return sqlSessionTemplate.delete(NAMESPACE+".ep_deletehous", hinum);
	}
	public int ep_updatediv(HashMap<String, Object> map) {
		return sqlSessionTemplate.update(NAMESPACE+".ep_updatediv", map);	
	}
	public int ep_insertsession(HashMap<String, Object> map) {
		return sqlSessionTemplate.update(NAMESPACE+".ep_sessnum", map);
	}
	public int epImgFile(HashMap<String, Object> map) {
		return sqlSessionTemplate.insert(NAMESPACE+".ep_imgfile" ,map);
	}
	public int epImgFileUpdate(HashMap<String, Object> map) {
		return sqlSessionTemplate.update(NAMESPACE+".epImgFileUpdate",map);
	}
	
	
	
	public int experienceInsert(EP_ManagementVo vo) {
		return sqlSessionTemplate.insert(NAMESPACE + ".experienceInsert" , vo);
	}
	public int experienceUpdate(EP_ManagementVo vo) {
		return sqlSessionTemplate.update(NAMESPACE+ ".experienceUpdate" , vo);
	}
	public int houseInsert(EP_ManagementVo vo) {
		return sqlSessionTemplate.insert(NAMESPACE+ ".houseInsert", vo);
	}
	
	
	
	//체험 검색하는 기능
	public List<ExperienceSearchVo> getExSearchList(String loc) {
		return sqlSessionTemplate.selectList(NAMESPACE + ".searchExp", loc);
	}
} 
