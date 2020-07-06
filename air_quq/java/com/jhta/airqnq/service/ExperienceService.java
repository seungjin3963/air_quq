package com.jhta.airqnq.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.airqnq.dao.ExperienceDao;

@Service
public class ExperienceService {
	@Autowired private ExperienceDao dao;
}
