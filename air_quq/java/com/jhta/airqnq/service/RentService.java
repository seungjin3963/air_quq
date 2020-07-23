package com.jhta.airqnq.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.airqnq.dao.RentDao;
import com.jhta.airqnq.vo.RentVo;

@Service
public class RentService {
	@Autowired
	private RentDao dao;
	
	public int rentinsert(RentVo vo) {
		return dao.rentinsert(vo);
	}
}
