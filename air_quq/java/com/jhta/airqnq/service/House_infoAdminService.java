package com.jhta.airqnq.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.airqnq.dao.House_infoAdminDao;
import com.jhta.airqnq.vo.HouseInfoVo;

@Service
public class House_infoAdminService {
	@Autowired
	private House_infoAdminDao dao;
	
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
}
