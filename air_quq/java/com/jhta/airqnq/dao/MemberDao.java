package com.jhta.airqnq.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.JoinVo;

@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private final String NAMESPACE = "com.jhta.airqnq.mapper.MemberMapper";
	
	public List<JoinVo> Memberlist(HashMap<String, Object> map){
		return sqlSessionTemplate.selectList(NAMESPACE+".listMember", map);
	}
	
	public int MemberCnt(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectOne(NAMESPACE+".membercnt", map);
	}
	
	public JoinVo MemberOne(int menum) {
		return sqlSessionTemplate.selectOne(NAMESPACE+".memberone", menum);
	}
	
	public int MemberImgReset(int menum) {
		return sqlSessionTemplate.update(NAMESPACE+".memberimgreset", menum);
	}
}
