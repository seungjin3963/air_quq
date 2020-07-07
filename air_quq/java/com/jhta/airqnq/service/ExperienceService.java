package com.jhta.airqnq.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.airqnq.dao.ExperienceDao;
import com.jhta.airqnq.vo.ExperienceVo;

@Service
public class ExperienceService {
	@Autowired private ExperienceDao dao;
	
	public List<ExperienceVo> subject(){
		return dao.subject();
	}
	
	public List<ExperienceVo> detailsub(int num){
		return dao.detailsub(num);
	}
}
