package com.jhta.airqnq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.airqnq.dao.HostResCheckDao;
import com.jhta.airqnq.vo.EP_ManagementVo;
import com.jhta.airqnq.vo.RentVo;

@Service
public class HostResCheckService {
	@Autowired private HostResCheckDao dao;
	
	public List<EP_ManagementVo> ResListE(int menum){
		return dao.ResListE(menum);
	}
	
	public List<EP_ManagementVo> ResListH(int menum){
		return dao.ResListH(menum);
	}
	
	public List<RentVo> ResPeople(int hinum) {
		return dao.ResPeople(hinum);
	}
	
	public int ResCheckUpdate(int hinum) {
		return dao.ResCheckUpdate(hinum);
	}
}
