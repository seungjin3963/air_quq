package com.jhta.airqnq.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.airqnq.dao.JoinDao;

@Service
public class JoinService {
	
	@Autowired
	private JoinDao dao;
	
	public int idChk(String id) {
		return dao.idChk(id);
	}
}
