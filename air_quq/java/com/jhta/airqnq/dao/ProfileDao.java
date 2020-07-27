package com.jhta.airqnq.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.JoinVo;
import com.jhta.airqnq.vo.MemberVo;

@Repository
public class ProfileDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE = "com.jhta.airqnq.mapper.profileMapper";
	
	//프로필 정보 가져오기
	public MemberVo getProfile(int menum) {
		return sqlSessionTemplate.selectOne(NAMESPACE + ".getProfileInfo", menum);
	}
	
	//프로필 사진정보 가져오기
	public Map<String, Object> getByteImage(int menum) {
	    return sqlSessionTemplate.selectOne(NAMESPACE + ".getProfileImg", menum);
	}
	
	//프로필 정보 업데이트
	public int updateProfile(JoinVo vo) {
		return sqlSessionTemplate.update(NAMESPACE + ".updateProfile", vo);
	}
}
