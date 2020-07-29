package com.jhta.airqnq.service;

import java.util.HashMap; 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.airqnq.dao.EpOnlineDao;
import com.jhta.airqnq.vo.AdminInfoVo;
import com.jhta.airqnq.vo.ChatLogVo;
import com.jhta.airqnq.vo.ReviewVo;
import com.jhta.airqnq.vo.SliderVo;

@Service
public class EpOnlineService {
	@Autowired
	private EpOnlineDao dao;
	
	public SliderVo outslider(int hinum){
		return dao.outslider(hinum);
	}
	public List<SliderVo> inslider(int hinum){
		return dao.inslider(hinum);
	}
	public List<SliderVo> inSeoul(){
		return dao.inSeoul();
	}
	public List<SliderVo> within6(){
		return dao.within6();
	}
	public List<SliderVo> cheap(){
		return dao.cheap();
	}
	public List<SliderVo> beststar(){
		return dao.beststar();
	}
	public int findRoom(HashMap<String, Object> hash) {
		return dao.findRoom(hash);
	}
	public ChatLogVo chatlog(int number){
		return dao.chatlog(number);
	}
	public int addChat(HashMap<String, Object> hash) {
		return dao.addChat(hash);
	}
	public int addcontent(HashMap<String, Object> hash){
		return dao.addcontent(hash);
	}
	public List<AdminInfoVo> hostinfo(HashMap<String, Object> hash){
		return dao.hostinfo(hash);
	}
	public List<AdminInfoVo> userinfo(HashMap<String, Object> hash){
		return dao.userinfo(hash);
	}
	
	public int count(HashMap<String, Object> hash) {
		return dao.count(hash);
	}
	
	//랜덤 리스트
	public List<SliderVo> randInfo(){
		return dao.randInfo();
	}
	//리뷰
	public List<ReviewVo> ReviewSelect(int hinum){
		return dao.ReviewSelect(hinum);
	}
	
	
}