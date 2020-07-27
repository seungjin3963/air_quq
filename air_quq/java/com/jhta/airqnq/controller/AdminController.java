package com.jhta.airqnq.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.airqnq.pageUtil.PageUtil;
import com.jhta.airqnq.service.House_infoAdminService;
import com.jhta.airqnq.service.MemberService;
import com.jhta.airqnq.service.RentService;
import com.jhta.airqnq.vo.EP_ManagementVo;
import com.jhta.airqnq.vo.HouseInfoVo;
import com.jhta.airqnq.vo.JoinVo;
import com.jhta.airqnq.vo.RentVo;

@Controller
public class AdminController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private House_infoAdminService host_infoService;
	
	@Autowired
	private RentService rentservice;
	
	/* 관리자 회원관리 */
	@GetMapping("/admin")
	public String admin() {
		return ".admin";
	}
	
	@GetMapping("/admin/member/list")
	public String memberlist(Model model, @RequestParam(value="pageNum",defaultValue = "1")int pageNum,String field,String keyword) {

		HashMap<String, Object> map=new HashMap<String, Object>();
		
		map.put("keyword", keyword);
		map.put("field",field);
		
		int totalRowCount=service.MemberCnt(map);
		
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 10, 2);
		
		map.put("startRow",pu.getStartRow());
		map.put("rowblockcount",pu.getRowBlockCount());
		
		List<JoinVo> Memberlist = service.Memberlist(map);
		
		model.addAttribute("pu", pu);
		model.addAttribute("Memberlist", Memberlist);
		model.addAttribute("keyword", keyword);
		model.addAttribute("field", field);
		return ".admin.memberadmin";
	}
	
	@RequestMapping(value="/json/memberlistfind", produces ="application/json;charset=utf-8")
	@ResponseBody
	public HashMap<String, Object> memberlistfind(@RequestParam(value="pageNum",defaultValue = "1")int pageNum,String field,String keyword) {

		HashMap<String, Object> map=new HashMap<String, Object>();
		HashMap<String, Object> returndata=new HashMap<String, Object>();
		
		map.put("keyword", keyword);
		map.put("field",field);
		
		int totalRowCount=service.MemberCnt(map);
		
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 10, 2);
		
		map.put("startRow",pu.getStartRow());
		map.put("rowblockcount",pu.getRowBlockCount());
		
		List<JoinVo> Memberlist = service.Memberlist(map);
		
		returndata.put("pu", pu);
		returndata.put("Memberlist", Memberlist);
		returndata.put("keyword", keyword);
		returndata.put("field", field);
		return returndata;
	}
	
	@GetMapping(value="/json/memberone", produces ="application/json;charset=utf-8")
	@ResponseBody
	public JoinVo memberone(int menum) {
		JoinVo vo = service.MemberOne(menum);
		return vo;
	}
	
	@GetMapping("/memberimg")
	public void memberimg(int menum, HttpServletResponse resp) {
		resp.setContentType("image/jpeg");

		try {
			JoinVo vo = service.MemberOne(menum);
	
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
	
	@GetMapping("/admin/memberimgreset")
	public String memberupdate(int menum) {
		
		int n=service.MemberImgReset(menum);
		
		if(menum == 0) {
			return "redirect:/admin/member/list";
		}
		
		if(n>0) {
			return "redirect:/admin/member/list";
		}else {
			return ".error";
		}
	}
	
	/* 관리자 호스트 하우스 목록 회원관리 */
	@RequestMapping("/admin/house_info/list")
	public String houseSelect(Model model,@RequestParam(value="pageNum",defaultValue = "1")int pageNum, String keyword,String field) {
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		map.put("keyword", keyword);
		map.put("field",field);
		int totalRowCount=host_infoService.HouseCnt(map);
		
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 10, 2);
		
		map.put("startRow", pu.getStartRow());
		map.put("rowblockcount", pu.getRowBlockCount());
				
		List<HouseInfoVo> house_infolist = host_infoService.HouseSelect(map);
		
		model.addAttribute("pu", pu);
		model.addAttribute("list", house_infolist);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		
		return ".admin.house_infoAdmin";
	}
	// 영노
	/* 관리자 호스트 체험 목록 회원관리 */
	@RequestMapping("/admin/ep_info/list")
	public String experienceSelect(Model model,@RequestParam(value="pageNum",defaultValue = "1")int pageNum, String keyword,String field) {
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		map.put("keyword", keyword);
		map.put("field",field);
		int totalRowCount=host_infoService.ExperienceCnt(map);
		
		
		
		List<EP_ManagementVo> experience_infolist=host_infoService.ExperienceSelect(); 
		model.addAttribute("experience_infolist",experience_infolist);
		//System.out.println(experience_infolist);
		return ".admin.experience_infoAdmin";
		
	}
	
	
	
	
	@GetMapping("/json/houseone")
	@ResponseBody
	public HashMap<String, Object> houseOneSelect(int hinum,HttpSession session){
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		HashMap<String, Object> returndata=new HashMap<String, Object>();

		String path=session.getServletContext().getRealPath("/resources/img/house_img");
		
		map.put("hinum",hinum);
		map.put("ordernum", 1);
		
		HouseInfoVo vo=host_infoService.HostOne(hinum);
		
		String houseimg=path+File.separator+host_infoService.HouseImgOne(map);
		
		returndata.put("vo",vo);
		returndata.put("houseimg",houseimg);
		
		return returndata;
	}
	
	/* 데이터 통계 */	
	@GetMapping("/admin/hoststatistics")	
	public String hoststatistics(Model model) {	
		List<HouseInfoVo> houselist = host_infoService.Okhouseinfo();	
		List<RentVo> rentlist= rentservice.rentdata();	
			
		String hostcnttot=null;	
		String rentcnttot=null;	
		String houseprice=null;	
		String pricerange=null;	
		int hostcnt=0;	
		int rentcnt=0;	
		int pricecnt=0;	
			
		int maxprice=houselist.get(0).getPrice();	
			
		ArrayList<Integer> pricelist=new ArrayList<Integer>();	
		ArrayList<Integer> ranglist=new ArrayList<Integer>();	
			
		for (int i = 1; i < 13; i++) {	
			hostcnt=0;	
			rentcnt=0;	
			for(HouseInfoVo vo: houselist) {	
				if(vo.getStartdate() == null) {	
						
				}else {	
				SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd"); 	
				String startdate=sd.format(vo.getStartdate());	
				if(startdate.substring(5, 7).contains(i+"")) hostcnt++;	
				}	
			}	
				
			for(RentVo vo : rentlist) {	
				SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd"); 	
				String startdate=sd.format(vo.getStartrent());	
				if(startdate.substring(5, 7).contains(i+"")) rentcnt++;	
			}	
			if(i == 1) {	
				hostcnttot=hostcnt+"/";	
				rentcnttot=rentcnt+"/";	
			}else {	
				if(i==12) {	
					hostcnttot+=hostcnt;	
					rentcnttot+=rentcnt;	
				}else {	
					hostcnttot+=hostcnt+"/";	
					rentcnttot+=rentcnt+"/";	
				}	
			}	
		}	
			
		for(HouseInfoVo vo : houselist) {	
			if(vo.getPrice() == null) {}	
			else {	
				if(maxprice < vo.getPrice()) {	
					maxprice=vo.getPrice();	
				}	
				pricelist.add(vo.getPrice());	
			}	
		}	
		
		int eachprice=maxprice/10;
		
		for (int i = 0; i < maxprice; i=i+eachprice) {	
			if(i == 0) {	
				pricerange=i+"원~"+(i+eachprice)+"원/";	
				ranglist.add(i);
			}else {	
				if(i == maxprice) {	
					pricerange+=i+"원~"+(i+eachprice)+"원";	
				}else {	
					if(i == maxprice-eachprice) {
						pricerange+=i+"원~"+(i+eachprice)+"원";	
					}else if(i < maxprice-eachprice) {
						pricerange+=i+"원~"+(i+eachprice)+"원/";	
					}
				}	
				ranglist.add(i);	
			}	
		}
		
		ranglist.add(maxprice);
		
		for (int i = 0; i < ranglist.size()-1; i++) {	
			pricecnt=0;	
			for (int j = 0; j < pricelist.size()-1; j++) {	
				if(ranglist.get(i)<=pricelist.get(j) && ranglist.get(i+1)>=pricelist.get(j)) {	
					pricecnt++;	
				}
			}	
			if(i==0) {	
				houseprice=pricecnt+"/";	
			}else {	
				if(i==ranglist.size()-2) {
					houseprice+=pricecnt;	
				}else {
					houseprice+=pricecnt+"/";	
				}
			}	
		}	
		
		model.addAttribute("hostcnttot", hostcnttot);	
		model.addAttribute("rentcnttot", rentcnttot);	
		model.addAttribute("houseprice", houseprice);	
		model.addAttribute("pricerange", pricerange);	
			
		return ".admin.statisticsadmin";	
	}
}
