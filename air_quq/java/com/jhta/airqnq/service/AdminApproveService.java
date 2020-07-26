package com.jhta.airqnq.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.airqnq.dao.AdminApproveDao;
import com.jhta.airqnq.vo.EP_ManagementVo;
import com.jhta.airqnq.vo.HouseInfoVo;

@Service
public class AdminApproveService {
	@Autowired private AdminApproveDao dao;
	public List<EP_ManagementVo> approveEp(){
		return dao.approveEp();
	}
	public List<EP_ManagementVo> epappImg(int hinum) {
		return dao.epappImg(hinum);
	}
	public EP_ManagementVo epappinfo(int hinum) {
		return dao.epappinfo(hinum);
	}
	public int epappOk(HashMap<String, Object> map) {
		return dao.epappOk(map);
	}
	public int epappNo(HashMap<String, Object> map) {
		return dao.epappNo(map);
	}
	
	
	
	//숙소 호스트 관리자 등록 기능
	public List<HouseInfoVo> getHostManagerApprovalList(int manager_check){
		return dao.getHostManagerApprovalList(manager_check);
	}
	
	//숙소 호스트 승인
	public int updateManagerApproval(int hinum) {
		return dao.updateManagerApproval(hinum);
	}
	
	//숙소 호스트 거절
	public int updateManagerApprovalFail(int hinum) {
		return dao.updateManagerApprovalFail(hinum);
	}
}
