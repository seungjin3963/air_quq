package com.jhta.airqnq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.airqnq.dao.HostDao;
import com.jhta.airqnq.vo.Chat_selectVo;
import com.jhta.airqnq.vo.ChattingVo;
import com.jhta.airqnq.vo.ExpInfoVo;
import com.jhta.airqnq.vo.HouseInfoVo;

@Service
public class HostService {
	@Autowired
	private HostDao dao;

	public List<ExpInfoVo> list(int menum) {
		return dao.list(menum);
	}

	public ExpInfoVo getEpOnlineInfo(int hinum) {
		return dao.getEpOnlineInfo(hinum);
	}

	public int modify(ExpInfoVo vo) {
		return dao.modify(vo);
	}

	@Transactional
	public void delEpOnline(int hinum) {
		dao.delConven(hinum);
		dao.delReview(hinum);
		dao.delBasket(hinum);
		dao.delHouseImg(hinum);
		dao.delExpInfo(hinum);
		dao.delEpOnline(hinum);
	}

	public List<HouseInfoVo> houseList(int menum) {
		return dao.houseList(menum);
	}

	public HouseInfoVo getHouseInfo(int hinum) {
		return dao.getHouseInfo(hinum);
	}

	public int houseModify(HouseInfoVo vo) {
		return dao.houseModify(vo);
	}

	public int delHouse(int hinum) {
		return dao.delHouse(hinum);
	}

	public List<Chat_selectVo> chat_selectList(int menum) {
		return dao.chat_selectList(menum);
	}

	public List<ChattingVo> chattingList(int chat_no) {
		return dao.chattingList(chat_no);
	}
}
