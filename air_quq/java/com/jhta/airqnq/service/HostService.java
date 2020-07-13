package com.jhta.airqnq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.airqnq.dao.HostDao;
import com.jhta.airqnq.vo.HouseInfoVo;

@Service
public class HostService {
	@Autowired
	private HostDao dao;

	public List<HouseInfoVo> list(int menum) {
		return dao.list(menum);
	}
}