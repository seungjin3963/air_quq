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

	
	public int insertHouse(HouseInfoVo hvo, HouseImgVo ivo) {
		hostInfoDao.insertHouse(hvo);
		hostInfoImageDao.insertHouseImg(ivo);
		
		return 1; //성공시 1리턴
	}
	
	//하우스번호구하기
	public int selectHouseNumber(int menum) {
		return hostInfoDao.selectHouseNumber(menum);
	}
	
	public int insertHouseImg(HouseImgVo vo) {
		return hostInfoImageDao.insertHouseImg(vo);
	}
	
	public int insertHouse(HouseInfoVo vo) {
		return hostInfoDao.insertHouse(vo);
	}
}
