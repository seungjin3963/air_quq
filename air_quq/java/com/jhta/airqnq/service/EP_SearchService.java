package com.jhta.airqnq.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.airqnq.dao.EP_SearchDao;

@Service
public class EP_SearchService {
	@Autowired private EP_SearchDao dao;
}
