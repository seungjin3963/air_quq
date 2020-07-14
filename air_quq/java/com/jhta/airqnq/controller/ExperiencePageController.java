package com.jhta.airqnq.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.airqnq.service.ExperienceService;
import com.jhta.airqnq.vo.EP_ManagementVo;
import com.jhta.airqnq.vo.ExperienceInfoVo;
import com.jhta.airqnq.vo.ExperienceVo;

@Controller
public class ExperiencePageController {
	@Autowired
	private ExperienceService service;

	@RequestMapping("/experience/myexperience") // 등록 전 화면
	public String experiencePage(HttpSession session) {
		if(session.getAttribute("logind") == null) {
			return ".login";
		}else {
			session.setAttribute("sessionnum", 8);
			return ".experience.myexperience";
		}
	}
	//////////////////////////////////////////////////////////

	@RequestMapping("/experience/ep_insert/ep") // 체험 추가 페이지 이동
	public String experienceInsertEp(Model model, @RequestParam(value = "num", defaultValue = "0") int num,
			HttpSession session) {
		int sessnum = (int) session.getAttribute("sessionnum");

		if (sessnum > 8) {
			model.addAttribute("ep_num", sessnum);
		} else {
			model.addAttribute("ep_num", 8);
			session.setAttribute("sessionnum", 8);
		}
		if (num == 1) {
			HashMap<String, Object> map=new HashMap<String, Object>();
			int loginnum=(int)session.getAttribute("menum");
			int housenum = service.temporary(loginnum);	
			map.put("loginnum", loginnum);
			map.put("hinum", housenum);
			int n = service.insertexperience(map);
			session.setAttribute("ep_housenum", housenum);
			return ".experience.ep_insert.ep_type";
		} else {
			return ".experience.ep_insert.ep_type";
		}

	}

	@RequestMapping("/experience/ep_insert/type") // 체험 타입 설정 1
	public String experienceInsertType(Model model, String type, HttpSession session) {
		int sessnum = (int) session.getAttribute("sessionnum");

		if (sessnum > 10) {
			model.addAttribute("ep_num", sessnum);
		} else {
			model.addAttribute("ep_num", 10);
			session.setAttribute("sessionnum", 10);
		}

		List<ExperienceVo> list = service.subject();
		model.addAttribute("list", list);
		model.addAttribute("category", "모든 주제");
		model.addAttribute("sub", "subject");

		if (type == "" || type == null) {
			return ".experience.ep_insert.ep_subject";
		} else {
			session.setAttribute("ep_type", type);
			int housenum = (int) session.getAttribute("ep_housenum");
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("hinum", housenum);
			map.put("div", Integer.parseInt(type));
			int n = service.inserttype(map);

			return ".experience.ep_insert.ep_subject";
		}
	}

	@RequestMapping("/experience/ep_insert/location") // 체험 위치 설정 2
	public String experienceInsertlocation(Model model, String value, HttpSession session) {

		int sessnum = (int) session.getAttribute("sessionnum");

		if (sessnum > 14) {
			model.addAttribute("ep_num", sessnum);
		} else {
			model.addAttribute("ep_num", 14);
			session.setAttribute("sessionnum", 14);
		}
		if (value == "" || value == null) {
			return ".experience.ep_insert.ep_introduce";
		} else {
			session.setAttribute("ep_loc", value);
			int housenum = (int) session.getAttribute("ep_housenum");
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("hinum", housenum);
			map.put("loc", value);
			int n = service.insertloc(map);
			return ".experience.ep_insert.ep_introduce";
		}
	}

	@RequestMapping("/experience/ep_insert/subject") // 체험 주제 설정 3
	public String experienceInsertsubject(Model model, String value, HttpSession session) {
		int sessnum = (int) session.getAttribute("sessionnum");

		if (sessnum > 12) {
			model.addAttribute("ep_num", sessnum);
		} else {
			model.addAttribute("ep_num", 12);
			session.setAttribute("sessionnum", 12);
		}
		if (value == "" || value == null) {
			return ".experience.ep_insert.ep_location";
		} else {
			int housenum = (int) session.getAttribute("ep_housenum");
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("hinum", housenum);
			map.put("sunum", value);
			int n = service.insertsunum(map);
			return ".experience.ep_insert.ep_location";
		}

	}

	@RequestMapping("/experience/ep_insert/introduce") // 체험 자기소개 설정 4
	public String experienceInsertintroduce(Model model, String value, HttpSession session) {

		int sessnum = (int) session.getAttribute("sessionnum");
		if (sessnum > 16) {
			model.addAttribute("ep_num", sessnum);
		} else {
			model.addAttribute("ep_num", 16);
			session.setAttribute("sessionnum", 16);
		}
		if (value == "" || value == null) {
			return ".experience.ep_insert.ep_program";
		} else {
			session.setAttribute("ep_intr", value);
			int housenum = (int) session.getAttribute("ep_housenum");
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("hinum", housenum);
			map.put("intr", value);
			int n = service.insertintr(map);

			return ".experience.ep_insert.ep_program";
		}

	}

	@RequestMapping("/experience/ep_insert/program") // 체험 프로그램설명 설정 5
	public String experienceInsertprogram(Model model, String value, HttpSession session) {
		int sessnum = (int) session.getAttribute("sessionnum");
		if (sessnum > 18) {
			model.addAttribute("ep_num", sessnum);
		} else {
			model.addAttribute("ep_num", 18);
			session.setAttribute("sessionnum", 18);
		}
		if (value == "" || value == null) {
			return ".experience.ep_insert.ep_materials";
		} else {
			session.setAttribute("ep_pro", value);
			int housenum = (int) session.getAttribute("ep_housenum");
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("hinum", housenum);
			map.put("program", value);
			service.insertprogram(map);
			return ".experience.ep_insert.ep_materials";
		}
	}

	@RequestMapping("/experience/ep_insert/materials") // 체험 준비물 설정 6
	public String experienceInsertmaterials(Model model, String[] value, HttpSession session) {
		int sessnum = (int) session.getAttribute("sessionnum");
		if (sessnum > 20) {
			model.addAttribute("ep_num", sessnum);
		} else {
			model.addAttribute("ep_num", 20);
			session.setAttribute("sessionnum", 20);
		}
		if (value == null) {
			return ".experience.ep_insert.ep_title";
		} else {
			session.setAttribute("ep_mater", value);
			String val = "";
			String val1 = "";
			for (int i = 0; i < value.length; i++) {
				if (value[i] == "" || value[i] == null) {
					val1 += value[i];
				} else {
					val += value[i] + ",";
				}
			}

			int housenum = (int) session.getAttribute("ep_housenum");
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("hinum", housenum);
			map.put("mater", val);
			service.insertmater(map);

			return ".experience.ep_insert.ep_title";
		}
	}

	@RequestMapping("/experience/ep_insert/title") // 체험 제목 설정 7
	public String experienceInserttitle(Model model, String value, HttpSession session) {

		int sessnum = (int) session.getAttribute("sessionnum");
		if (sessnum > 22) {
			model.addAttribute("ep_num", sessnum);
		} else {
			model.addAttribute("ep_num", 22);
			session.setAttribute("sessionnum", 22);
		}
		if (value == "" || value == null) {
			return ".experience.ep_insert.ep_price_time";
		} else {
			session.setAttribute("ep_title", value);
			int housenum = (int) session.getAttribute("ep_housenum");
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("hinum", housenum);
			map.put("title", value);
			service.inserttitle(map);
			return ".experience.ep_insert.ep_price_time";
		}
	}

	@RequestMapping("/experience/ep_insert/price_time") // 체험 가격 시간 설정 8
	public String experienceInsertprice_time(Model model, String price, String ep_fiedset, HttpSession session) {

		int sessnum = (int) session.getAttribute("sessionnum");
		if (sessnum > 24) {
			model.addAttribute("ep_num", sessnum);
		} else {
			model.addAttribute("ep_num", 24);
			session.setAttribute("sessionnum", 24);
		}
		if (ep_fiedset == "" || ep_fiedset == null) {
			return ".experience.ep_insert.ep_insertimg";
		} else {
			session.setAttribute("ep_price", price);
			session.setAttribute("ep_fiedset", ep_fiedset);
			int housenum = (int) session.getAttribute("ep_housenum");
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("hinum", housenum);
			map.put("price", price);
			map.put("times", ep_fiedset);
			service.insertpricetimes(map);
			return ".experience.ep_insert.ep_insertimg";
		}
	}

	/////////////////////////////////////////////////////////////
	@RequestMapping("/experince/ep_insert/Sub") // 소주제 뽑아오기
	public String experinceSubject(int num, Model model, String name, HttpSession session) {
		session.setAttribute("subjectname", name);
		int sessnum = (int) session.getAttribute("sessionnum");
		if (sessnum > 10) {
			model.addAttribute("ep_num", sessnum);
		} else {
			model.addAttribute("ep_num", 10);
			session.setAttribute("sessionnum", 10);
		}

		List<ExperienceVo> list = service.detailsub(num);

		model.addAttribute("list", list);
		model.addAttribute("category", name);
		model.addAttribute("sub", "detailsub");
		return ".experience.ep_insert.ep_subject";
	}

	@RequestMapping("/experience/ep_insert/subdetail") //
	public String experincesubDatile(String value, Model model, int num, HttpSession session) {
		session.setAttribute("subjectdename", value);
		int sessnum = (int) session.getAttribute("sessionnum");
		if (sessnum > 10) {
			model.addAttribute("ep_num", sessnum);
		} else {
			model.addAttribute("ep_num", 10);
			session.setAttribute("sessionnum", 10);
		}
		model.addAttribute("subdetail", value);
		model.addAttribute("expernum", num);
		return ".experience.ep_insert.subdetail";
	}
	
	@RequestMapping("/ep/GoHome")
	public String epGoHome(int num ,HttpSession session) {
		
		session.removeAttribute("ep_type");
		session.removeAttribute("subjectname");
		session.removeAttribute("subjectdename");
		session.removeAttribute("ep_title");
		session.removeAttribute("ep_loc");
		session.removeAttribute("ep_intr");
		session.removeAttribute("ep_pro");
		session.removeAttribute("ep_price");
		session.removeAttribute("ep_mater");
		session.removeAttribute("ep_fiedset");
		int hinum=(int)session.getAttribute("ep_housenum");
		if(num==1) {
			//저장 후 나가기 sessionnum table 저장
			int sessnum = (int) session.getAttribute("sessionnum");
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("hinum", hinum);
			map.put("sessnum", sessnum);
			int n=service.ep_insertsession(map);
			session.removeAttribute("ep_housenum");
			return ".home";
		}else if(num==2) {
			//그냥 나가기 table삭제
			int n=service.ep_delete(hinum);
			session.removeAttribute("ep_housenum");
			return ".home";
		}else if(num==3) {
			// 최종 제출 div_type 변경
			int n=service.ep_updatediv(hinum);
			session.removeAttribute("ep_housenum");
			return ".home";
		}
		return null;
	}
}
