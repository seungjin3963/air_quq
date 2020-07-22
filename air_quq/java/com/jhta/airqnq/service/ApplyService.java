package com.jhta.airqnq.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.airqnq.dao.ApplyDao;
import com.jhta.airqnq.vo.RentListVo;

@Service
public class ApplyService {
	@Autowired
	private ApplyDao dao;

	public List<RentListVo> applyList(int menum) {
		return dao.applyList(menum);
	}

	@Transactional
	public void applyCencel(Map<String, Object> map) {
		dao.delGrade(map);
		dao.delReview(map);
		dao.delRent(map);
	}
}
