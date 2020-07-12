package com.jhta.airqnq.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.airqnq.dao.JoinDao;
import com.jhta.airqnq.dao.LoginDao;
import com.jhta.airqnq.vo.JoinVo;

@Service
public class MemberFunctionService {
	
	@Autowired
	private JoinDao joinDao;
	@Autowired
	private LoginDao loginDao;
	
	public int idChk(String id) {
		return joinDao.idChk(id);
	}
	
	public int insertJoin(JoinVo vo) {
		return joinDao.insertJoin(vo);
	}
	
	public int updateMemberPwd(HashMap<String, Object> map) {
		return joinDao.updateMemberPwd(map);
	}
	
	public int emailChk(String email) {
		return joinDao.emailChk(email);
	}
	
	
	//로그인 체크 기능
	public int loginCheck(HashMap<String, Object> map) {
		return loginDao.loginCheck(map);
	}
	
	public int selectKakaoUser(int id) {
		return joinDao.selectKakaoUser(id);
	}
}
