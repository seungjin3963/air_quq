package com.jhta.airqnq.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.airqnq.dao.MemberDao;
import com.jhta.airqnq.vo.JoinVo;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;
	
	public List<JoinVo> Memberlist(HashMap<String, Object> map){
		return dao.Memberlist(map);
	}
	
	public int MemberCnt(HashMap<String, Object> map) {
		return dao.MemberCnt(map);
	}
	
	public JoinVo MemberOne(int menum) {
		return dao.MemberOne(menum);
	}
	
	public int MemberImgReset(int menum) {
		return dao.MemberImgReset(menum);
	}
	
}
