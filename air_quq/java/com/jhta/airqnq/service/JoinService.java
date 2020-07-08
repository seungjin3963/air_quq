package com.jhta.airqnq.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.airqnq.dao.JoinDao;
import com.jhta.airqnq.vo.JoinVo;

@Service
public class JoinService {
	
	@Autowired
	private JoinDao dao;
	
	public int idChk(String id) {
		return dao.idChk(id);
	}
	
	public int insertJoin(JoinVo vo) {
		return dao.insertJoin(vo);
	}
	
	public int updateMemberPwd(HashMap<String, Object> map) {
		return dao.updateMemberPwd(map);
	}
	
	public int emailChk(String email) {
		return dao.emailChk(email);
	}
}
