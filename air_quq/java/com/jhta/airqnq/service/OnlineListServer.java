package com.jhta.airqnq.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.airqnq.dao.OnlineListDao;
import com.jhta.airqnq.vo.EP_ManagementVo;
import com.jhta.airqnq.vo.basketVo;

@Service
public class OnlineListServer {
	@Autowired private OnlineListDao dao;
	
	public List<EP_ManagementVo> OnlineAlllList(int row){ // 요리
		return dao.OnlineAlllList( row);
	}
	public int OnlineAllListC(){ // 전체
		return dao.OnlineAllListC();
	}
	
	
	
	
	public List<EP_ManagementVo> onlineCookList(int row){ // 요리
		return dao.onlineCookList( row);
	}
	public int onlineCookListC(){ // 요리
		return dao.onlineCookListC();
	}
	
	public List<EP_ManagementVo> onlineSportList(int row){ // 스포츠
		return dao.onlineSportList(row);
	}
	public int onlineSportListC(){ // 스포츠
		return dao.onlineSportListC();
	}
	
	
	
	public List<EP_ManagementVo> OnlineRegdateList(int row){ // 최근 가입
		return dao.OnlineRegdateList(row);
	}
	public int OnlineRegdateListC(){ // 최근 가입 갯수
		return dao.OnlineRegdateListC();
	}
	
	
	//찜onlineMyPickDelete
	public int onlineMyPickInsert(HashMap<String, Object> map) {
		return dao.onlineMyPickInsert(map);
	}
	public int onlineMyPickDelete(HashMap<String, Object> map) {
		return dao.onlineMyPickDelete(map);
	}
	//찜 리스트
	public List<basketVo> basketlist(int menum){
		return dao.basketlist(menum);
	}
	
	
	public List<EP_ManagementVo> Picklist(int menum) {
		return dao.Picklist(menum);
	}
}
