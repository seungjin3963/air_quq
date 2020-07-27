package com.jhta.airqnq.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.airqnq.dao.House_infoAdminDao;
import com.jhta.airqnq.vo.Apply_infoVo;
import com.jhta.airqnq.vo.EP_ManagementVo;
import com.jhta.airqnq.vo.HouseInfoVo;

@Service
public class House_infoAdminService {
	@Autowired
	private House_infoAdminDao dao;
	public List<EP_ManagementVo> ExperienceSelect(){ // 영노
		return dao.ExperienceSelect();
	}
	public int ExperienceCnt(HashMap<String, Object> map) {
		return dao.ExperienceCnt(map);
	}
	
	
	public List<HouseInfoVo> HouseSelect(HashMap<String, Object> map){
		return dao.HouseSelect(map);
	}
	
	public int HouseCnt(HashMap<String, Object> map) {
		return dao.HouseCnt(map);
	}
	
	public HouseInfoVo HostOne(int hinum) {
		return dao.HostOne(hinum);
	}
	
	public String HouseImgOne(HashMap<String, Object> map) {
		return dao.HouseImgOne(map);
	}

	public List<String> HouseImglist(HashMap<String, Object> map) {
		return dao.HouseImglist(map);
	}
	
	public Apply_infoVo HinumSelect(int hinum) {
		return dao.HinumSelect(hinum);
	}
	
	public List<HouseInfoVo> Okhouseinfo(){
		return dao.Okhouseinfo();
	}
}
