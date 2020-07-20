package com.jhta.airqnq.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.airqnq.service.HostInfoService;
import com.jhta.airqnq.service.HostService;
import com.jhta.airqnq.vo.ExpInfoVo;
import com.jhta.airqnq.vo.HouseImgVo;
import com.jhta.airqnq.vo.HouseInfoVo;

@Controller
public class HostController {

	@Autowired
	private HostService service;
	
	@Autowired
	private HostInfoService hostService;

	@GetMapping(value = "/host/epOnline/list")
	public String epOnlineList(Model model, HttpSession session) {
		if(session.getAttribute("logind") == null) {
			return ".login";
		}else {
			int menum = (int)session.getAttribute("menum");
			List<ExpInfoVo> list = service.list(menum);
			model.addAttribute("list", list);
			return ".host.epOnline.list";
		}
	}

	@GetMapping(value = "/host/epOnline/modify")
	public String modifyView(Model model, int einum) {
		model.addAttribute("vo", service.getEpOnlineInfo(einum));
		return ".host.epOnline.modify";
	}

	@PostMapping(value = "/host/epOnline/modify")
	public String modify(ExpInfoVo vo) {
		if (service.modify(vo) > 0) {
			return "redirect:/host/epOnline/list";
		} else {
			return ".error";
		}
	}

	@GetMapping(value = "/host/epOnline/delete")
	public String delEpOnline(int einum) {
		try {
			service.delEpOnline(einum);
			return "redirect:/host/epOnline/list";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return ".error";
		}
	}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value = "/host/regist/1")
	public String hostRegist1(String addr, String roomStatus, String clientCount, HttpSession session, int next) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("addr", addr);
		map.put("roomStatus", roomStatus);
		map.put("clientCount", clientCount);

		session.setAttribute("regist1", map);
		session.setAttribute("hostStep", next);
		
		System.out.println("첫번째 단계 : " + addr + ", " + roomStatus + ", " + clientCount);
		
		return ".hostRegist";
	}

	@RequestMapping(value = "/host/regist/2")
	public String hostRegist2(String hostTitle, String hostContent, HttpSession session, int next) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("hostTitle", hostTitle);
		map.put("hostContent", hostContent);
		
		session.setAttribute("regist2", map);
		session.setAttribute("hostStep", next);
		
		System.out.println("두번째 단계 : " + hostTitle + ", " + hostContent);
		
		return ".hostRegist";
	}
	
	@RequestMapping(value = "/host/regist/3")
	public String hostRegist3(String v_grade, String pcount, String bcount, String oclick, String startDay, String endDay, HttpSession session, int next) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("v_grade", v_grade);
		map.put("pcount", pcount);
		map.put("bcount", bcount);
		map.put("oclick", oclick);
		map.put("startDay", startDay);
		map.put("endDay", endDay);
		
		session.setAttribute("regist3", map);
		session.setAttribute("hostStep", next);
		
		System.out.println("세번째 단계 : " + v_grade + ", " + pcount + ", " + bcount + ", " + oclick + ", " + startDay + ", " + endDay);
		return ".hostRegist";
	}
	
	@RequestMapping(value = "/host/regist/4")
	public String hostRegist4(MultipartFile[] file1, String address, String addressDetail, String lat, String lnt, HttpSession session, int next) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("address", address);
		map.put("addressDetail", addressDetail);
		map.put("lat", lat);
		map.put("lnt", lnt);
		System.out.println(file1.length);
		for(MultipartFile f : file1) {
			System.out.println(f.getOriginalFilename());
		}
		
		session.setAttribute("regist4", map);
		session.setAttribute("hostStep", next);
		
		System.out.println("마지막 단계 : " + address + ", " + addressDetail + ", " + lat + ", " + lnt);
		
//		Integer hinum, Integer menum, String title, String content, String addr, String addr_detail,
//		Integer price, Integer max_n, Integer bedroom, String checkinTime, Integer div, String lat, String lnt,
//		Date startdate, Date enddate, String del_yn
		Integer menum = (Integer) session.getAttribute("memun");
		
		HashMap<String, Object> regist1 = (HashMap<String, Object>)session.getAttribute("regist1");
		HashMap<String, Object> regist2 = (HashMap<String, Object>)session.getAttribute("regist2");
		HashMap<String, Object> regist3 = (HashMap<String, Object>)session.getAttribute("regist3");
		
		String title = (String)regist2.get("hostTitle");
		String content = (String)regist2.get("hostContent");
		int price = Integer.parseInt(regist3.get("v_grade").toString().replace(",", ""));
		int max_n = Integer.parseInt(regist3.get("pcount").toString());
		int bedroom = Integer.parseInt(regist3.get("bcount").toString());
		String checkinTime = (String)regist3.get("oclick");
		int div = 1;
		
		
		Date startdate = transformDate((String)regist3.get("startDay"));
		Date enddate = transformDate((String)regist3.get("endDay"));
		String del_yn = "n";
		
		
		HouseInfoVo hvo = new HouseInfoVo(0, menum, title, content, address, addressDetail, price, max_n,
				bedroom, checkinTime, div, lat, lnt, startdate, enddate, del_yn, 0);
		
		//int imgnum, int hinum, String img, String del_yn, int ordernum
		
		//하우스 번호 가져오기
		int hinum = hostService.selectHouseNumber(menum);
		
		//HouseImgVo ivo = new HouseImgVo(0, );
		
		//hostService.houseInsert(hvo, ivo);
		
		
		return "redirect:/";
	}
	
	// 날짜가 yyyymmdd 형식으로 입력되었을 경우 Date로 변경하는 메서드
    public Date transformDate(String date) {
    	SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyymmdd");
        
        // Date로 변경하기 위해서는 날짜 형식을 yyyy-mm-dd로 변경해야 한다.
        SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-mm-dd");
        
        java.util.Date tempDate = null;
        
        try {
            // 현재 yyyymmdd로된 날짜 형식으로 java.util.Date객체를 만든다.
            tempDate = beforeFormat.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        // java.util.Date를 yyyy-mm-dd 형식으로 변경하여 String로 반환한다.
        String transDate = afterFormat.format(tempDate);
        
        // 반환된 String 값을 Date로 변경한다.
        Date d = Date.valueOf(transDate);
        
        return d;

    }
}
