package com.jhta.airqnq.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.HouseInfoVo;

@Repository
public class HostDao {
	@Autowired
	private SqlSessionTemplate session;

	private final String NAMESPACE = "mybatis.hostMapper";

	public List<HouseInfoVo> list(int menum) {
		return session.selectList(NAMESPACE + ".list", menum);
	}

	public HouseInfoVo getEpOnlineInfo(int hinum) {
		return session.selectOne(NAMESPACE + ".getEpOnlineInfo", hinum);
	}

	public int modify(HouseInfoVo vo) {
		return session.update(NAMESPACE + ".modify", vo);
	}
	
	public void delEpOnline(int hinum) {
		session.delete(NAMESPACE + ".delEpOnline", hinum);
	}

	public void delConven(int hinum) {
		session.delete(NAMESPACE + ".delConven", hinum);
	}

	public void delReview(int hinum) {
		session.delete(NAMESPACE + ".delReview", hinum);
	}

	public void delBasket(int hinum) {
		session.delete(NAMESPACE + ".delBasket", hinum);
	}

	public void delHouseImg(int hinum) {
		session.delete(NAMESPACE + ".delHouseImg", hinum);
	}

	public void delExpInfo(int hinum) {
		session.delete(NAMESPACE + ".delExpInfo", hinum);
	}
}
