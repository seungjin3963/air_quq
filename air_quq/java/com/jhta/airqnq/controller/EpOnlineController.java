package com.jhta.airqnq.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.airqnq.pageUtil.PageUtil;
import com.jhta.airqnq.service.AdminApproveService;
import com.jhta.airqnq.service.EpOnlineService;
import com.jhta.airqnq.service.OnlineListServer;
import com.jhta.airqnq.vo.ChatLogVo;
import com.jhta.airqnq.vo.EP_ManagementVo;
import com.jhta.airqnq.vo.ReviewVo;
import com.jhta.airqnq.vo.SliderVo;
import com.jhta.airqnq.vo.basketVo;

@Controller
public class EpOnlineController {

	@Autowired
	private EpOnlineService service;

	@Autowired
	private AdminApproveService imgService;

	@Autowired
	private OnlineListServer heartservice;

	@RequestMapping("/online/home")
	public String goHome(Model model) {
		// 여기서 각각 리스트 매퍼연결해서 어떤거 가져와야하는지 검색조건(유명셰프,6시간이내,서울인기체험,새로등록된체험(3시간이내),저렴한
		// 가격,베스트체험(별높은 순),전체)
		// model.addAttribute("list1",service.outslider());
		model.addAttribute("inSeoul", service.inSeoul());
		model.addAttribute("beststar", service.beststar());
		model.addAttribute("cheap", service.cheap());
		model.addAttribute("within6", service.within6());
		return ".epOnline.layout";
	}

	@RequestMapping("/online/details")
	public String goDetails(int hinum, Model model, HttpSession session) throws IOException {

		if (session.getAttribute("menum") != null) {
			int menum = (int) session.getAttribute("menum");
			List<basketVo> basket = heartservice.basketlist(menum);
			System.out.println(basket);
			model.addAttribute("basket", basket);
		}

		// 영노
		String[] mater = {};
		String Mater = "";
		List<EP_ManagementVo> hinum_Img = imgService.epappImg(hinum); // 이미지
		model.addAttribute("hinum_Img", hinum_Img);

		SliderVo experienceInfo = service.outslider(hinum); // hinum 정보
		model.addAttribute("experienceInfo", experienceInfo);

		List<SliderVo> randexperienceInfo = service.randInfo(); // randlist
		model.addAttribute("rand", randexperienceInfo);

		List<ReviewVo> Review = service.ReviewSelect(hinum);
		model.addAttribute("Review", Review);

		String maters = experienceInfo.getMater();
		if (maters == null) {
			Mater = "준비물 없습니다.";
			model.addAttribute("mater", Mater);
		} else {
			mater = maters.split(",");
			model.addAttribute("mater", maters);
		}

		/*
		 * model.addAttribute("list2",service.inslider(hinum)); List<SliderVo>
		 * list=service.inslider(hinum); for (int i=0; i<list.size(); i++) { SliderVo
		 * str = list.get(i); System.out.println(str.getTitle() +"asd"); }
		 */
		
		model.addAttribute("hinum", hinum);
		model.addAttribute("hostNum", experienceInfo.getMemnum());
		
		return ".epOnline.detail";
	}

	@RequestMapping(value = "/online/image", method = RequestMethod.GET)
	public void showImage(@RequestParam("hinum") Integer hinum, HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
//		response.getOutputStream().write(service.inslider(hinum).getProfile_img());
		response.getOutputStream().close();
	}

	@ResponseBody
	@RequestMapping(value = "/online/dm", method = RequestMethod.GET)
	public Map<String, Object> dm(HttpSession session, int hinum, int hostNum) {
		Map<String, Object> returnHash = new HashMap<String, Object>();
		if(session.getAttribute("logind") == null) {
			returnHash.put("result", "login");
			return returnHash;
		}else {
			returnHash.put("result", "success");
		}
		int menum = (int) session.getAttribute("menum");
		
		HashMap<String, Object> hash = new HashMap<String, Object>();
		hash.put("menum", menum);
		hash.put("younum", hostNum);
		int n = 0;
		try {
			n = service.findRoom(hash);
		} catch (NullPointerException ne) {
			n = 0;
		}

		if (n != 0) {// 방 있음 ,내역 불러와야함
			List<ChatLogVo> chat = service.chatlog(n);
			returnHash.put("chat", chat);
			returnHash.put("chat_no", n);
		} else {// chat목록에 추가하도록 chat_no만들기
			service.addChat(hash);
			returnHash.put("chat_no", service.maxChatNo());
		}
		returnHash.put("menum", menum);

		return returnHash;
	}

	@GetMapping(value = "/epOnline/epOnline")
	public String epOnLine(Model model, int hinum) {
		model.addAttribute("hinum", hinum);
		return ".epOnline.epOnline";
	}

	@GetMapping(value = "/epOnline/modify")
	public String modify() {
		return "";
	}
//		MemberVo vo=(MemberVo)session.getAttribute("memberVo");
//		vo.getMenum();

	@GetMapping(value = "/admin/adminQ")
	public String adminQinfo(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String field,
			String keyword, @RequestParam(value = "div", defaultValue = "1") int div, Model model) {
		HashMap<String, Object> input = new HashMap<String, Object>();
		input.put("div", div);
		input.put("keyword", keyword);
		input.put("field", field);

		int count = service.count(input);
		PageUtil pu = new PageUtil(pageNum, count, 10, 5);

		input.put("startRow", pu.getStartRow());
		input.put("RowsinPage", pu.getRowBlockCount());

		model.addAttribute("divide", div);
		model.addAttribute("pu", pu);
		model.addAttribute("user", service.userinfo(input));
		model.addAttribute("host", service.hostinfo(input));
		return ".admin.adminQ";
	}

	@RequestMapping(value = "/admin/search", produces = "application/json;charset=utf-8")
	@ResponseBody
	public HashMap<String, Object> selected(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			String field, String keyword, @RequestParam(value = "div", defaultValue = "1") int div) {

		HashMap<String, Object> input = new HashMap<String, Object>();
		input.put("div", div);
		input.put("keyword", keyword);
		input.put("field", field);

		int count = service.count(input);
		PageUtil pu = new PageUtil(pageNum, count, 10, 5);
		input.put("divide", div);
		input.put("pu", pu);
		input.put("startRow", pu.getStartRow());
		input.put("RowsinPage", pu.getRowBlockCount());
		if (div == 1) {
			input.put("user", service.userinfo(input));
		} else if (div == 2) {
			input.put("host", service.hostinfo(input));
		}

		return input;
	}

	@RequestMapping(value = "/admin/nav", produces = "application/json;charset=utf-8")
	@ResponseBody
	public HashMap<String, Object> navDetected(int div) {
		HashMap<String, Object> hash = new HashMap<String, Object>();
		hash.put("div", div);
		int count = service.count(hash);
		PageUtil pu = new PageUtil(1, count, 10, 5);
		hash.put("pu", pu);
		hash.put("startRow", pu.getStartRow());
		hash.put("RowsinPage", pu.getRowBlockCount());
		System.out.println("div :" + div + ", pu.getStartRow() :" + pu.getStartRow() + ", RowsinPage :"
				+ pu.getRowBlockCount() + " count :" + count);
		hash.put("user", service.userinfo(hash));
		hash.put("host", service.hostinfo(hash));
		if (div == 1) {
			hash.put("change", "#nav-home");
			hash.put("div", 1);
		} else if (div == 2) {
			hash.put("change", "#nav-profile");
			hash.put("div", 2);
		}
		return hash;
	}

	@RequestMapping("/online/myPick")
	public String mypageonlinePick(HttpSession session, Model model) {
		int menum = (int) session.getAttribute("menum");
		List<EP_ManagementVo> vo = heartservice.Picklist(menum);
		model.addAttribute("vo", vo);
		return ".ep_management.pickpage";
	}
}