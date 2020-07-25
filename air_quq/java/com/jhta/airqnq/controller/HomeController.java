package com.jhta.airqnq.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.airqnq.pageUtil.PageUtilForMySql;
import com.jhta.airqnq.service.HostInfoService;
import com.jhta.airqnq.vo.HouseInfoVo;
import com.jhta.airqnq.vo.HouseSearchVo;
import com.jhta.airqnq.vo.MainHouseInfoVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private HostInfoService hostService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return ".home";
	}

	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public String error() {
		return ".error";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model, HttpServletRequest req) {
		return ".login";
	}

	@RequestMapping(value = "/member/join", method = RequestMethod.GET)
	public String join() {
		return ".join";
	}

	@RequestMapping(value = "login/forgotpwd", method = RequestMethod.GET)
	public String loginForgotPassword() {
		return ".loginforgotpw";
	}

	@RequestMapping(value = "host/home", method = RequestMethod.GET)
	public String hostHome() {
		return ".hosthome";
	}

	// 홈에서 하우스검색하는 맵핑
	@RequestMapping("search/host")
	public String hostSearch(String locationAdress, Date start_day, Date end_day, int people_count,
			HttpSession session, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
		
		System.out.println("페이지번호:" + pageNum);
		
		int limit = 0 + pageNum-1;
		int pageCount = 5;
		
		HouseSearchVo vo = new HouseSearchVo(locationAdress, people_count, 1, start_day, end_day, "n", 0, limit, pageCount);
		
		List<MainHouseInfoVo> list = getHouseInfo(vo);
		
		session.setAttribute("addr", locationAdress);
		session.setAttribute("hostSearch", list);
		session.setAttribute("start_day", start_day);
		session.setAttribute("end_day", end_day);
		session.setAttribute("people_count", people_count);
		
		//검색된 전체글 개수
		int getSearchCount = hostService.getSearchCount(vo);
		System.out.println("검색된 전체글 개수" + getSearchCount);
		
		
		//페이징 처리를위한 객체
		int rowBlockCount = 5;
		int pageBlockCount = 5;
		PageUtilForMySql pageUtil = new PageUtilForMySql(pageNum, getSearchCount, rowBlockCount, pageBlockCount);
		session.setAttribute("pageUtil", pageUtil);
		
		System.out.println(pageUtil.getEndPageNum());
		System.out.println("전체 페이지 " + pageUtil.getTotalPageCount());
		
		return ".hostsearch";
	}

	// AJAX로 카카오맵 마커 뿌려주기
	@GetMapping("search/kakao/marker")
	@ResponseBody
	public void setKakaoMarker() {
		// System.out.println("동작");

	}
	
	//금액에 맞게 정규화
	public String setAmount(String amount) {
		if (amount == null) {
			return amount;
		} else if (amount.equals("")) {
			return amount;
		}
		amount = amount.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");

		return amount;

	}

	public List<MainHouseInfoVo> getHouseInfo(HouseSearchVo vo) {
		return hostService.getMainHouseInfoList(vo);
	}
}
