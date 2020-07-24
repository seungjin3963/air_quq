package com.jhta.airqnq.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.EP_ManagementVo;
import com.jhta.airqnq.vo.RentVo;


@Repository
public class HostResCheckDao {
	@Autowired private SqlSessionTemplate sqlession;
	
	private final String NAMESPACE = "mybatis.HostResCheckMapper";
	
	public List<EP_ManagementVo> ResListE(int menum) {
		return sqlession.selectList(NAMESPACE+".ResListE",menum);
	}
	
	public List<EP_ManagementVo> ResListH(int menum) {
		return sqlession.selectList(NAMESPACE+".ResListH",menum);
	}
	
	public List<RentVo> ResPeople(int hinum){
		return sqlession.selectList(NAMESPACE+".ResPeople" , hinum);
	}
	public int ResCheckUpdate(int hinum) {
		return sqlession.update(NAMESPACE+".ResCheckUpdate" , hinum);
	}
}
