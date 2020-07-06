package com.jhta.airqnq.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.airqnq.service.JoinService;
import com.jhta.airqnq.vo.JoinVo;

@Controller
public class JoinController {
	@Autowired
	JoinService service;
	
	@RequestMapping(value = "/idchk", method = RequestMethod.GET)
	@ResponseBody
	public String selectId(String id) {
		System.out.println(id);
		String chkid = "";
		
		int cnt = service.idChk(id);
		if(cnt == 0) {
			chkid = "false";
		} else {
			chkid = "true";
		}
		
		return chkid;
	}
	
	@PostMapping("/upload/memberjoin")
	public String memberJoinOk(HttpSession session, MultipartFile file1,
			String id, String addr, String email, String phone, String pwd) {
		//업로드할 폴더 경로 얻어오기
		String uploadPath = session.getServletContext().getRealPath("resources/upload");
		
		//전송된 파일명
		String orgfilename = file1.getOriginalFilename();
		
		//실제 저장할 파일명(중복되지 않도록)
		String savefileName = UUID.randomUUID() + "_" + orgfilename;
		
		try {
			//전송된 파일을 읽어오는 스트림 
			InputStream fis = file1.getInputStream(); 
			
			//전송된 파일을 서버에 복사(업로드) 하기위한 출력 스트림
			FileOutputStream fos = new FileOutputStream(uploadPath + "//" + savefileName);
			
			//파일복사하기
			FileCopyUtils.copy(fis, fos);
			fis.close();
			fos.close();
			
			//DB에 값넣기
//			int memun, String id, String pwd, String addr, String email, String phone, String gender,String profile_img
			String profile_img = savefileName;
			JoinVo vo = new JoinVo(0, id, pwd, addr, email, phone, "0", profile_img);
			
			int n = service.insertJoin(vo);
			if(n<0 || n==0) return null;
			
		} catch(IOException e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/";
	}
}
