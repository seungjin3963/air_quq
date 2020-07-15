package com.jhta.airqnq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.airqnq.dao.HostDao;
import com.jhta.airqnq.vo.HouseInfoVo;

@Service
public class HostService {
	@Autowired
	private HostDao dao;

	public List<HouseInfoVo> list(int menum) {
		return dao.list(menum);
	}

	public HouseInfoVo getEpOnlineInfo(int hinum) {
		return dao.getEpOnlineInfo(hinum);
	}

	public int modify(HouseInfoVo vo) {
		return dao.modify(vo);
	}

	@Transactional
	public void delEpOnline(int hinum) {
		dao.delConven(hinum);
		dao.delReview(hinum);
		dao.delBasket(hinum);
		dao.delHouseImg(hinum);
		dao.delEpOnline(hinum);
	}
}
