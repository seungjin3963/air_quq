package com.jhta.airqnq.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.airqnq.service.ExperienceService;
import com.jhta.airqnq.vo.EP_ManagementVo;
import com.jhta.airqnq.vo.ExperienceSearchVo;
import com.jhta.airqnq.vo.ExperienceVo;

@Controller
public class ExperiencePageController {
	@Autowired
	private ExperienceService service;

	@RequestMapping("/experience/myexperience") // 등록 전 화면
	public String experiencePage(HttpSession session) {
		if (session.getAttribute("logind") == null) {
			return ".login";
		} else {
			EP_ManagementVo sessionVo = new EP_ManagementVo();
			sessionVo.setSessionnum(8);
			session.setAttribute("sessionVo", sessionVo);
			return ".experience.myexperience";
		}
	}
	//////////////////////////////////////////////////////////

	@RequestMapping("/experience/ep_insert/ep") // 체험 추가 페이지 이동
	public String experienceInsertEp(Model model, @RequestParam(value = "num", defaultValue = "0") int num,
			HttpSession session) {
		EP_ManagementVo sessionVo = (EP_ManagementVo) session.getAttribute("sessionVo");
		if (sessionVo.getSessionnum() > 8) {
			model.addAttribute("sessionVo", sessionVo);
		} else {
			sessionVo.setSessionnum(8);
			model.addAttribute("sessionVo", sessionVo);
		}		
		if (num == 1) {		
			int menum = (int) session.getAttribute("menum");		
			sessionVo.setMemnum(menum);							
			session.setAttribute("sessionVo", sessionVo);
			return ".experience.ep_insert.ep_type";
		} else {
			return ".experience.ep_insert.ep_type";
		}
	}


	@RequestMapping("/experience/ep_insert/type") // 체험 타입 설정 1 /////////
	public String experienceInsertType(Model model, String type, HttpSession session) {
		EP_ManagementVo sessionVo = (EP_ManagementVo) session.getAttribute("sessionVo");		
		if (sessionVo.getSessionnum() > 10) {
			model.addAttribute("sessionVo", sessionVo);
		} else {
			sessionVo.setSessionnum(10);
			model.addAttribute("sessionVo", sessionVo);
		}
		List<ExperienceVo> list = service.subject();
		model.addAttribute("list", list);
		model.addAttribute("category", "모든 주제");
		model.addAttribute("sub", "subject");

		if (type == "" || type == null) {
			return ".experience.ep_insert.ep_subject";
		} else {
			
			if (session.getAttribute("ep_type") != null) {
				session.setAttribute("sessionVo", sessionVo);	
			} else {
				sessionVo.setDiv_type(Integer.parseInt(type));
				session.setAttribute("sessionVo", sessionVo);
			}	
			return ".experience.ep_insert.ep_subject";
		}
	}
	
	@RequestMapping("/experience/ep_insert/subject") // 체험 주제 설정 3
	public String experienceInsertsubject(Model model, String value, HttpSession session) {
		EP_ManagementVo sessionVo = (EP_ManagementVo) session.getAttribute("sessionVo");
		
		if (sessionVo.getSessionnum() > 12) {
			model.addAttribute("sessionVo", sessionVo);
		} else {
			sessionVo.setSessionnum(12);
			session.setAttribute("sessionVo", sessionVo);
		}
		if (value == "" || value == null) {
			return ".experience.ep_insert.ep_location";
		} else {	
			
			return ".experience.ep_insert.ep_location";
		}
		
	}


	@RequestMapping("/experience/ep_insert/location") // 체험 위치 설정 2
	public String experienceInsertlocation(Model model, String value, HttpSession session) {

		EP_ManagementVo sessionVo = (EP_ManagementVo) session.getAttribute("sessionVo");

		if (sessionVo.getSessionnum() > 14) {
			model.addAttribute("sessionVo", sessionVo);
		} else {
			sessionVo.setSessionnum(14);
			model.addAttribute("sessionVo", sessionVo);
		}
		if (value == "" || value == null) {
			return ".experience.ep_insert.ep_introduce";
		} else {
			sessionVo.setLoc(value);
			int housenum = sessionVo.getHinum();
			
			
			return ".experience.ep_insert.ep_introduce";
		}
	}


	@RequestMapping("/experience/ep_insert/introduce") // 체험 자기소개 설정 4
	public String experienceInsertintroduce(Model model, String value, HttpSession session) {

		EP_ManagementVo sessionVo = (EP_ManagementVo) session.getAttribute("sessionVo");
		if (sessionVo.getSessionnum() > 16) {
			model.addAttribute("sessionVo", sessionVo);
		} else {
			sessionVo.setSessionnum(16);
			model.addAttribute("sessionVo", sessionVo);
		}
		if (value == "" || value == null) {
			return ".experience.ep_insert.ep_program";
		} else {
			sessionVo.setIntr(value);
			return ".experience.ep_insert.ep_program";
		}

		
	}

	@RequestMapping("/experience/ep_insert/program") // 체험 프로그램설명 설정 5
	public String experienceInsertprogram(Model model, String value, HttpSession session) {
		EP_ManagementVo sessionVo = (EP_ManagementVo) session.getAttribute("sessionVo");
		
		if (sessionVo.getSessionnum() > 18) {
			model.addAttribute("sessionVo", sessionVo);
		} else {
			sessionVo.setSessionnum(18);
			model.addAttribute("sessionVo", sessionVo);
		}
		
		
		if (value == "" || value == null) {
			return ".experience.ep_insert.ep_materials";
		} else {
			sessionVo.setProgram(value);
			return ".experience.ep_insert.ep_materials";
		}
	}

	@RequestMapping("/experience/ep_insert/materials") // 체험 준비물 설정 6
	public String experienceInsertmaterials(Model model, String[] value, HttpSession session) {
		EP_ManagementVo sessionVo = (EP_ManagementVo) session.getAttribute("sessionVo");
		if (sessionVo.getSessionnum() > 20) {
			model.addAttribute("sessionVo", sessionVo);
		} else {
			sessionVo.setSessionnum(20);
			model.addAttribute("sessionVo", sessionVo);
		}
		if (value == null) {
			return ".experience.ep_insert.ep_title";
		} else {
			
			String val = "";
			String val1 = "";
			for (int i = 0; i < value.length; i++) {
				if (value[i] == "" || value[i] == null) {
					val1 += value[i];
				} else {
					val += value[i] + ",";
				}
			}
			sessionVo.setMater(val);
			return ".experience.ep_insert.ep_title";
		}
	}

	@RequestMapping("/experience/ep_insert/title") // 체험 제목 설정 7
	public String experienceInserttitle(Model model, String value, HttpSession session) {

		EP_ManagementVo sessionVo = (EP_ManagementVo) session.getAttribute("sessionVo");
		if (sessionVo.getSessionnum() > 22) {
			model.addAttribute("sessionVo", sessionVo);
		} else {
			sessionVo.setSessionnum(22);
			model.addAttribute("sessionVo", sessionVo);
		}
		if (value == "" || value == null) {
			return ".experience.ep_insert.ep_price_time";
		} else {
			sessionVo.setTitle(value);

			return ".experience.ep_insert.ep_price_time";
		}
	}

	@RequestMapping("/experience/ep_insert/price_time") // 체험 가격 시간 설정 8
	public String experienceInsertprice_time(Model model, String price, String ep_fiedset, HttpSession session) {

		EP_ManagementVo sessionVo = (EP_ManagementVo) session.getAttribute("sessionVo");
		if (sessionVo.getSessionnum() > 24) {
			model.addAttribute("sessionVo", sessionVo);
		} else {
			sessionVo.setSessionnum(24);
			model.addAttribute("sessionVo", sessionVo);
		}
		if (ep_fiedset == "" || ep_fiedset == null) {
			return ".experience.ep_insert.ep_insertimg";
		} else {
			sessionVo.setPrice(price);
			sessionVo.setTimes(ep_fiedset);		
			return ".experience.ep_insert.ep_insertimg";
		}
	}

	/////////////////////////////////////////////////////////////
	@RequestMapping("/experince/ep_insert/Sub") // 소주제 뽑아오기
	public String experinceSubject(int num, Model model, String name, HttpSession session) {
		EP_ManagementVo sessionVo = (EP_ManagementVo) session.getAttribute("sessionVo");
		
		if (sessionVo.getSessionnum() > 10) {
			model.addAttribute("sessionVo", sessionVo);
		} else {
			sessionVo.setSessionnum(10);
			model.addAttribute("sessionVo", sessionVo);
		}
		List<ExperienceVo> list = service.detailsub(num);
		sessionVo.setSubname(name);

		model.addAttribute("list", list);
		model.addAttribute("category", name);
		model.addAttribute("sub", "detailsub");
		return ".experience.ep_insert.ep_subject";
	}

	@RequestMapping("/experience/ep_insert/subdetail") //
	public String experincesubDatile(String value, Model model, int num, HttpSession session) {
		EP_ManagementVo sessionVo = (EP_ManagementVo) session.getAttribute("sessionVo");
		
		
		if (sessionVo.getSessionnum() > 10) {
			model.addAttribute("sessionVo", sessionVo);
		} else {
			sessionVo.setSunum(num);
			sessionVo.setSessionnum(10);
			session.setAttribute("sessionVo", sessionVo);
		}
		model.addAttribute("subdetail", value);
		model.addAttribute("expernum", num);
		return ".experience.ep_insert.subdetail";
	}
	
	
	@RequestMapping("/ep/GoHome")
	public  String epGoHome( HttpSession session) {
		session.removeAttribute("sessionVo");
		session.removeAttribute("epimglist");
			return ".home";
	}
	
	@RequestMapping(value = "/ep_insert" ,produces = "application/json;charset=utf-8")
	@ResponseBody
	public String ep_insertTable(HttpSession session) {
		int hinum=0;
		EP_ManagementVo sessionVo = (EP_ManagementVo) session.getAttribute("sessionVo");
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		if(sessionVo.getHinum()==0 ) {
			hinum=service.temporary(sessionVo.getMemnum());
			sessionVo.setHinum(hinum);	
			int n=service.experienceInsert(sessionVo);
		}else {
			hinum=sessionVo.getHinum();
			int n=service.experienceUpdate(sessionVo);
		}
		
		JSONObject json=new JSONObject(); 
		
		
		return json.toString();
	}

	@RequestMapping("/ep/modalImg") /////////////////////////////////////////// 
	public String InsertEpImg(MultipartFile[] EpImgfile, HttpSession session , int[] index) {
		
		int hinum=0;
		int num = 0;
		int ordernum = 0;
		EP_ManagementVo sessionVo = (EP_ManagementVo) session.getAttribute("sessionVo");
		if (sessionVo.getDiv_type()==31 || sessionVo.getDiv_type()==39) {
			sessionVo.setDiv_type(32);
		}
		if (sessionVo.getDiv_type()==41 || sessionVo.getDiv_type()==49) {
			sessionVo.setDiv_type(42);
		}
		if(sessionVo.getHinum()==0 ) {
			hinum=service.temporary(sessionVo.getMemnum());
			sessionVo.setHinum(hinum);
			int n=service.experienceInsert(sessionVo);
		}else {
			hinum=sessionVo.getHinum();
			int n=service.experienceUpdate(sessionVo);
		}
		String uploadPath = session.getServletContext().getRealPath("/resources/img/house_img");
		if(session.getAttribute("epimglist")==null) {
			for (int i = 0; i < EpImgfile.length; i++) {
				String ep_OrigonalFileName = EpImgfile[i].getOriginalFilename();
				String savefileName = UUID.randomUUID() + "_" + ep_OrigonalFileName;
				try {

					InputStream fis = EpImgfile[i].getInputStream();

					FileOutputStream fos = new FileOutputStream(uploadPath + "\\" + savefileName);

					FileCopyUtils.copy(fis, fos);
					fis.close();
					fos.close();
					HashMap<String, Object> map = new HashMap<String, Object>();
					ordernum += 1;
					map.put("ordernum", ordernum);
					map.put("hinum", hinum);
					map.put("file", savefileName);
					service.epImgFile(map);
				} catch (IOException ie) {
					System.out.println(ie.getMessage());
					return ".error";
				}
			}
		}else {
			for (int i = 0; i < index.length; i++) {
				
				
				String ep_OrigonalFileName = EpImgfile[index[i]].getOriginalFilename();
				String savefileName = UUID.randomUUID() + "_" + ep_OrigonalFileName;
				try {

					InputStream fis = EpImgfile[index[i]].getInputStream();

					FileOutputStream fos = new FileOutputStream(uploadPath + "\\" + savefileName);

					FileCopyUtils.copy(fis, fos);
					fis.close();
					fos.close();
					HashMap<String, Object> map = new HashMap<String, Object>();
					ordernum += 1;
					map.put("ordernum", index[i]+1);
					map.put("hinum", hinum);
					map.put("file", savefileName);
					//service.epImgFile(map);\
					service.epImgFileUpdate(map);
				} catch (IOException ie) {
					System.out.println(ie.getMessage());
					return ".error";
				}
			}
		}
		
		session.removeAttribute("sessionVo");
		session.removeAttribute("epimglist");
		return ".home";
	}
	
	//체험 검색 기능 페이지 이동
	@RequestMapping("/experience/search")
	public String movingSearchPage() {
		return ".exSearchPage";
	}
	
	//주소로 체험 검색하는 기능
	@RequestMapping("/experience/search/result")
	public String searchExList(String addr, String day, int cnt, Model model) {
//		System.out.println(addr);
//		System.out.println(day);
//		System.out.println(cnt);
		model.addAttribute("addr", addr);
		model.addAttribute("day", day);
		model.addAttribute("cnt", cnt);
		
		List<ExperienceSearchVo> list = service.getExSearchList(addr);
		for(ExperienceSearchVo v : list) {
			System.out.println(v.getLoc());
			System.out.println(v.getProgram());
			System.out.println(v.getTitle());
		}
		model.addAttribute("exlist", list);
		
		return ".exSearchPageResult";
	}
}
