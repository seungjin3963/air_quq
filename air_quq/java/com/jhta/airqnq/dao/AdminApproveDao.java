package com.jhta.airqnq.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.EP_ManagementVo;
import com.jhta.airqnq.vo.HouseInfoVo;

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
	
	//숙소 호스트 관리자 등록 기능
	public List<HouseInfoVo> getHostManagerApprovalList(int manager_check){
		return sqlSessionTemplate.selectList(NAMESPACE + ".setManagerCheck", manager_check);
	}
	
	//숙소 호스트 승인
	public int updateManagerApproval(int hinum) {
		return sqlSessionTemplate.update(NAMESPACE + ".updateManagerCheck", hinum);
	}
	
	//숙소 호스트 거절
	public int updateManagerApprovalFail(int hinum) {
		return sqlSessionTemplate.update(NAMESPACE + ".updateManagerCheckFail", hinum);
	}
}
