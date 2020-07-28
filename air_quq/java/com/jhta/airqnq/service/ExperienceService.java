package com.jhta.airqnq.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.airqnq.dao.ExperienceDao;
import com.jhta.airqnq.vo.EP_ManagementVo;
import com.jhta.airqnq.vo.ExperienceSearchVo;
import com.jhta.airqnq.vo.ExperienceVo;

@Service
public class ExperienceService {
	@Autowired private ExperienceDao dao;
	
	public List<ExperienceVo> subject(){
		return dao.subject();
	}
	
	public List<ExperienceVo> detailsub(int num){
		return dao.detailsub(num);
	}
	public int selectloginnum(String id) {
		return dao.selectloginnum(id);
	}
	
	public int temporary(int loginnum) { //임시 저장
		return dao.temporary(loginnum);
	}
	public int insertexperience(HashMap<String, Object> map) {
		return dao.insertexperience(map);
	}
	public int inserttype(HashMap<String, Object> map) {//div 설정
		return dao.inserttype(map);
	}
	public int insertloc(HashMap<String, Object> map) {
		return dao.insertloc(map);
	}
	public int insertsunum(HashMap<String, Object> map) {
		return dao.insertsunum(map);
	}
	public int insertintr(HashMap<String, Object> map) {
		return dao.insertintr(map);
	}
	public int insertprogram(HashMap<String, Object> map) {
		return dao.insertprogram(map);
	}
	public int inserttitle(HashMap<String, Object> map) {
		return dao.inserttitle(map);
	}
	public int insertpricetimes(HashMap<String, Object> map) {
		return dao.insertpricetimes(map);
	}
	public int insertmater(HashMap<String, Object> map) {
		return dao.insertmater(map);
	}
	public int ep_delete(int hinum) {
		return dao.ep_delete(hinum);
	}
	public int ep_updatediv(HashMap<String, Object> map) {
		return dao.ep_updatediv(map);
	}
	public int ep_insertsession(HashMap<String, Object> map) {
		return dao.ep_insertsession(map);
	}
	public int epImgFile(HashMap<String, Object> map) {
		return dao.epImgFile(map);
	}
	public int epImgFileUpdate(HashMap<String, Object> map) {
		return dao.epImgFileUpdate(map);
	}
	
	
	
	public int experienceInsert(EP_ManagementVo vo) {
		return dao.experienceInsert(vo);
	}
	public int experienceUpdate(EP_ManagementVo vo) {
		return dao.experienceUpdate(vo);
	}
	
	public int houseInsert(EP_ManagementVo vo) {
		return dao.houseInsert(vo);
	}
	
	
	//체험 검색하는 기능
	public List<ExperienceSearchVo> getExSearchList(HashMap<String, Object> map) {
		return dao.getExSearchList(map);
	}
	
	//검색된 전체글 개수
	public int getExSearchListCount(String loc) {
		return dao.getExSearchListCount(loc);
	}
}
