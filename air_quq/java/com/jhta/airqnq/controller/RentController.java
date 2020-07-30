package com.jhta.airqnq.controller;



import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.airqnq.service.RentService;
import com.jhta.airqnq.vo.RentVo;

@Controller
public class RentController {
	@Autowired
	private RentService rentservice;
	
	@RequestMapping(value="/user/apply/rent/insert")
	public String rentinsert(String imp_uid,String merchant_uid,int paid_amount,HttpSession session) {
		
		RentVo vo = (RentVo)session.getAttribute("rentVo");
		
		int menum=(int)session.getAttribute("menum");
		
		vo.setMenum(menum);
		vo.setImp_uid(imp_uid);
		vo.setMerchant_uid(merchant_uid);
		vo.setPay_price(paid_amount);
		
		int n=rentservice.rentinsert(vo);
		
		if(n>0) {
			return ".home";
		}else {
			return ".error";
		}
	}
	
	@RequestMapping(value="/rent/select")
	@ResponseBody
	public RentVo rentselect(int rtnum) {
		 return rentservice.rentselect(rtnum);
	}
	
	@RequestMapping(value="/user/apply/rentVo/Epinsert")
	@ResponseBody
	public String rentVoInsert(Date checkdata, int PriceSpan, int PeopleSpan , int hinum , HttpSession session , int div_type) {
		if(div_type==4) {
			div_type=2;
		}
		
		RentVo vo=new RentVo();
		vo.setStartrent(checkdata);
		vo.setEndrent(checkdata);
		vo.setPay_price(PriceSpan);
		vo.setPerson(PeopleSpan);
		vo.setHinum(hinum);
		vo.setStatus(div_type);
		
		session.setAttribute("rentVo", vo);
		JSONObject json=new JSONObject();
		
		return json.toString() ;
	}
	
}
