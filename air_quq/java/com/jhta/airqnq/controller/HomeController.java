package com.jhta.airqnq.controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.airqnq.pageUtil.PageUtilForMySql;
import com.jhta.airqnq.service.HostInfoService;
import com.jhta.airqnq.service.ProfileService;
import com.jhta.airqnq.vo.HouseInfoVo;
import com.jhta.airqnq.vo.HouseSearchVo;
import com.jhta.airqnq.vo.JoinVo;
import com.jhta.airqnq.vo.MainHouseInfoVo;
import com.jhta.airqnq.vo.MemberVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private HostInfoService hostService;
	
	@Autowired
	private ProfileService profileService;

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
		
		//System.out.println("페이지번호:" + pageNum);
		
		int rowBlockCount = 4;
		int pageBlockCount = 5;
		
		int limit = (pageNum-1) * rowBlockCount;
		System.out.println("limit : " + limit);
		
		//관리자 가 승인한 게시물만 검색
		HouseSearchVo vo = new HouseSearchVo(locationAdress, people_count, 1, start_day, end_day, "n", 1, limit, rowBlockCount);
		
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
	
	//프로필 정보 페이지
	@RequestMapping("/member/profile")
	public String getProfilePage(int menum, Model model) {
		
		MemberVo vo = profileService.getProfile(menum);
		model.addAttribute("member", vo);
		
		return ".profile";
	}
	
	//프로필 정보 업데이트
	@RequestMapping("/profile/updateOk")
	public String setProfileUpdate(JoinVo vo, MultipartFile file1) {
		int r = 0;
		if(file1.getSize() == 0) {
			System.out.println("file1:" + file1);
			r = profileService.updateProfile(vo);
			System.out.println("프로필업데이트 : " + r);
			return "redirect:/";
		}
		try {
			
			byte[] profile_img = file1.getBytes();
			
			//DB에 값넣기
//			System.out.println(">>>>>>>>>>>>>>>>>>>>>" + jvo.getGender());
			if(profile_img.length <= 16777215) { //MEDIUMBLOB 최대사이즈보다 작을경우에만..
				vo.setProfile_img(profile_img);
				r = profileService.updateProfile(vo);
				System.out.println("프로필업데이트 : " + r);
			} else {
				return "error";
			}
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		if(r>0) {
			return "redirect:/";
		} else {
			return "error";
		}
	}
	
	//프로필 사진 로딩
	@RequestMapping("/member/profile/img")
	public ResponseEntity<byte[]> getProfileImg(int menum) {
		//DB에서 프로필 사진 가져오기
		Map<String, Object> map = profileService.getByteImage(menum);
		byte[] blobImg = (byte[])map.get("profile_img");
		System.out.println(blobImg);
		final HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.IMAGE_PNG);
		
		return new ResponseEntity<byte[]>(blobImg, headers, HttpStatus.OK);
	}
}
