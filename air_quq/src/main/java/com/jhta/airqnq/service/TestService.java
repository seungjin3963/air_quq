package com.jhta.airqnq.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.airqnq.dao.TestDao;
import com.jhta.airqnq.vo.TestVo;

@Service
public class TestService {
	@Autowired
	private TestDao dao;
	
	public TestVo testSelect(int num) {
		return dao.testSelect(num);
	}
}
