package com.jhta.airqnq.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.airqnq.dao.HostInfoDao;
import com.jhta.airqnq.dao.HostInfoImageDao;
import com.jhta.airqnq.vo.HouseImgVo;
import com.jhta.airqnq.vo.HouseInfoVo;

@Service
public class HostInfoService {
	@Autowired
	private HostInfoDao hostInfoDao;
	@Autowired
	private HostInfoImageDao hostInfoImageDao;

	
	public int houseInsert(HouseInfoVo hvo, HouseImgVo ivo) {
		hostInfoDao.insertHouse(hvo);
		hostInfoImageDao.insertHouseImg(ivo);
		
		return 1; //성공시 1리턴
	}
}
