package com.jhta.airqnq.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.airqnq.dao.AdminApproveDao;
import com.jhta.airqnq.vo.EP_ManagementVo;

@Service
public class AdminApproveService {
	@Autowired private AdminApproveDao dao;
	public List<EP_ManagementVo> approveEp(){
		return dao.approveEp();
	}
	public List<EP_ManagementVo> epappImg(int hinum) {
		return dao.epappImg(hinum);
	}
}
