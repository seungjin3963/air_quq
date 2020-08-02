package com.jhta.airqnq.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.airqnq.vo.Chat_selectVo;
import com.jhta.airqnq.vo.ChattingVo;
import com.jhta.airqnq.vo.ExpInfoVo;
import com.jhta.airqnq.vo.HouseInfoVo;

@Repository
public class HostDao {
	@Autowired
	private SqlSessionTemplate session;

	private final String NAMESPACE = "mybatis.HostMapper";

	public List<ExpInfoVo> list(int menum) {
		return session.selectList(NAMESPACE + ".list", menum);
	}

	public ExpInfoVo getEpOnlineInfo(int hinum) {
		return session.selectOne(NAMESPACE + ".getEpOnlineInfo", hinum);
	}

	public int modify(ExpInfoVo vo) {
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

	public List<HouseInfoVo> houseList(int menum) {
		return session.selectList(NAMESPACE + ".houseList", menum);
	}

	public HouseInfoVo getHouseInfo(int hinum) {
		return session.selectOne(NAMESPACE + ".getHouseInfo", hinum);
	}

	public int houseModify(HouseInfoVo vo) {
		return session.update(NAMESPACE + ".houseModify", vo);
	}

	public int delHouse(int hinum) {
		return session.delete(NAMESPACE + ".delHouse", hinum);
	}

	public List<Chat_selectVo> chat_selectList(int menum) {
		return session.selectList(NAMESPACE + ".chat_selectList", menum);
	}

	public List<ChattingVo> chattingList(int chat_no) {
		return session.selectList(NAMESPACE + ".chattingList", chat_no);
	}
}
