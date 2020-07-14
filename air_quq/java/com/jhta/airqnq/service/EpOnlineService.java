package com.jhta.airqnq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.airqnq.dao.EpOnlineDao;
import com.jhta.airqnq.vo.SliderVo;

@Service
public class EpOnlineService {
	@Autowired
	private EpOnlineDao dao;
	
	public List<SliderVo> outslider(){
		return dao.outslider();
	}
	public List<SliderVo> inslider(int einum){
		return dao.inslider(einum);
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
}
