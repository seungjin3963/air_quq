package com.jhta.airqnq.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.JoinVo;

@Repository
public class JoinDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE = "com.jhta.airqnq.mapper.JoinMapper";
	
	public int idChk(String id) {
		return sqlSessionTemplate.selectOne(NAMESPACE + ".selectId", id);
	}
	
	public int insertJoin(JoinVo vo) {
		return sqlSessionTemplate.insert(NAMESPACE + ".insertMember", vo);
	}
	
	public int updateMemberPwd(HashMap<String, Object> map) {
		return sqlSessionTemplate.update(NAMESPACE + ".updateMember", map);
	}
	
	public int emailChk(String email) {
		return sqlSessionTemplate.selectOne(NAMESPACE + ".selectEmail", email);
	}
	
	public int selectKakaoUser(int id) {
		return sqlSessionTemplate.selectOne(NAMESPACE + ".kakaoSelectUser", id);
	}
}
