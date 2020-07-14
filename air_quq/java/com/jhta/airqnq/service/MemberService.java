package com.jhta.airqnq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.airqnq.dao.MemberDao;
import com.jhta.airqnq.vo.JoinVo;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;
	
	public List<JoinVo> Memberlist(){
		return dao.Memberlist();
	}
}
