package com.jhta.airqnq.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.airqnq.service.ApplyService;
import com.jhta.airqnq.service.House_infoAdminService;
import com.jhta.airqnq.service.MemberService;
import com.jhta.airqnq.vo.ApplyVo;
import com.jhta.airqnq.vo.Apply_infoVo;
import com.jhta.airqnq.vo.JoinVo;
import com.jhta.airqnq.vo.MemberVo;

@Controller
public class UserApplyController {

	@Autowired
	private ApplyService service;
	
	@Autowired
	private MemberService memberservice;

	@Autowired
	private House_infoAdminService house_infoService;

	@RequestMapping(value="/user/apply")
	public String userapply(Model model,HttpSession session) {
		int hinum=136;
		Apply_infoVo infovo= house_infoService.HinumSelect(hinum);
		HashMap<String, String> usercheck=new HashMap<String, String>();
		
		
		String start="2020/07/22";
		String end="2020/07/24";
		int memberCNT=5;

		usercheck.put("checkIn", start);
		usercheck.put("checkOut", end);
		usercheck.put("max_n", memberCNT+"");
		
		try {
			
			SimpleDateFormat format=new SimpleDateFormat("yyyy/MM/dd");
			
			Date start2=(Date) format.parse(start);
			Date end2=(Date) format.parse(end);
			
			long timebetween1=end2.getTime()-start2.getTime();
			
			long timebetween2=timebetween1/(24*60*60*1000);
			
			long timebetween3=timebetween2*infovo.getPrice();
			
			ApplyVo vo=new ApplyVo(start, end, memberCNT, (int)timebetween3);
			
			session.setAttribute("applyVo", vo);
			
		} catch (ParseException pe) {
			System.out.println("날짜 오류 :"+pe);
		}
		
		model.addAttribute("infovo", infovo);
		model.addAttribute("usercheck", usercheck);

		return ".apply.userapply";
	}
	
	@GetMapping("/user/apply/memberimg")
	public void memberimg(int menum, HttpServletResponse resp) {
		resp.setContentType("image/jpeg");

		try {
			JoinVo vo = memberservice.MemberOne(menum);
	
			ByteArrayInputStream data =new ByteArrayInputStream(vo.getProfile_img());
		
			ServletOutputStream os=resp.getOutputStream();
			
			int dataReader=0;
			
			while((dataReader=data.read()) != -1) {
				os.write(dataReader);
			}
		} catch (IOException ie) {
			System.out.println(ie.getMessage());
		} catch (NullPointerException np) {}
	}

	@PostMapping(value = "/user/apply/setApply")
	@ResponseBody
	public void totmoney(HttpSession session, ApplyVo vo) {
		session.setAttribute("applyVo", vo);
	}

	@GetMapping(value = "/user/applyCheck")
	public String apply(HttpSession session) {
		MemberVo vo=(MemberVo) session.getAttribute("memberVo");
		
		if(vo != null) {
			return ".apply.applyCheck";
		}else {
			return ".login";
		}
	}

	@GetMapping("/user/applyCheck/getMemberInfo")
	@ResponseBody
	public MemberVo getMemberInfo(HttpSession session) {
		return (MemberVo) session.getAttribute("memberVo");
	}
	
	@PostMapping("/user/apply/cencel")
	@ResponseBody
	public String applyCencel(HttpSession session, int rtnum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menum", session.getAttribute("menum"));
		map.put("rtnum", rtnum);
		try {
			service.applyCencel(map);
			return "success";
		}catch (Exception e) {
			System.out.println(e.getMessage());
			return "error";
		}
	}
}
