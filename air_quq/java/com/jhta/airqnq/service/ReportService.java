package com.jhta.airqnq.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.airqnq.dao.ReportDao;
import com.jhta.airqnq.vo.ReportTypeVo;

@Service
public class ReportService {
	@Autowired
	private ReportDao dao;

	public List<ReportTypeVo> selType() {
		return dao.selType();
	}

	public int save(Map<String, Object> map) {
		return dao.save(map);
	}
}
