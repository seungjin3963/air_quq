package com.jhta.airqnq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.airqnq.dao.HostInfoDao;
import com.jhta.airqnq.dao.HostInfoImageDao;
import com.jhta.airqnq.dao.HouseSearchDao;
import com.jhta.airqnq.vo.HouseImgVo;
import com.jhta.airqnq.vo.HouseInfoVo;
import com.jhta.airqnq.vo.HouseSearchVo;
import com.jhta.airqnq.vo.MainHouseInfoVo;

@Service
public class HostInfoService {
	@Autowired
	private HostInfoDao hostInfoDao;
	@Autowired
	private HostInfoImageDao hostInfoImageDao;
	@Autowired
	private HouseSearchDao houstSearchDao;
	
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
	
	//하우스 정보 리스트 가져오기
	public List<HouseInfoVo> getHouseInfoList(HouseInfoVo vo){
		return hostInfoDao.getHouseInfoList(vo);
	}

	//하우스 이미지 가져오기
	public String getHouseImg(int hinum) {
		return hostInfoDao.getHouseImg(hinum);
	}
	
	public List<MainHouseInfoVo> getMainHouseInfoList(HouseSearchVo vo){
		return hostInfoDao.getMainHouseInfoList(vo);
	}
	
	//검색된 하우스 전체 글개수
	public int getSearchCount(HouseSearchVo vo) {
		return houstSearchDao.getSearchCount(vo);
	}
}
