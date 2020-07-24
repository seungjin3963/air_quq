package com.jhta.airqnq.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.EP_ManagementVo;

@Repository
public class AdminApproveDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="mybatis.EP_ManagementMapper"; /* 영노  // 체험 관리mapper*/
	public List<EP_ManagementVo> approveEp(){
		return sqlSessionTemplate.selectList(NAMESPACE+".approvelist");
	}
	public List<EP_ManagementVo> epappImg(int hinum) {
		return sqlSessionTemplate.selectList(NAMESPACE+".apappimg" , hinum);
	}
	public EP_ManagementVo epappinfo(int hinum) {
		return sqlSessionTemplate.selectOne(NAMESPACE+".epappinfo" , hinum);
	}
	public int epappOk(HashMap<String, Object> map) {
		return sqlSessionTemplate.update(NAMESPACE+".epappOk" , map);
	}
	public int epappNo(HashMap<String, Object> map) {
		return sqlSessionTemplate.update(NAMESPACE+".epappNo" , map);
	}
}
