package com.jhta.airqnq.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.airqnq.dao.ProfileDao;
import com.jhta.airqnq.vo.MemberVo;

@Service
public class ProfileService {
	@Autowired
	private ProfileDao dao;
	
	//프로필 정보 가져오기
	public MemberVo getProfile(int menum) {
		return dao.getProfile(menum);
	}
	
	//프로필 사진정보 가져오기
	public Map<String, Object> getByteImage(int menum) {
	    return dao.getByteImage(menum);
	}
	
	//프로필 정보 업데이트
	public int updateProfile(MemberVo vo) {
		return dao.updateProfile(vo);
	}
}
