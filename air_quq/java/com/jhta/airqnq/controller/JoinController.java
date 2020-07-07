package com.jhta.airqnq.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@Autowired 
	private JavaMailSenderImpl mailSender;

	
	@RequestMapping(value = "/idchk", method = RequestMethod.GET)
	@ResponseBody
	public String selectId(String id) {
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
	public String memberJoinOk(HttpSession session, MultipartFile file1, JoinVo jvo) {
		
		try {
			byte[] profile_img = file1.getBytes();
			
			//DB에 값넣기
			int n = 0;
			if(profile_img.length <= 16777215) { //MEDIUMBLOB 최대사이즈보다 작을경우에만..
				JoinVo vo = new JoinVo(0, jvo.getId(), jvo.getPwd(), jvo.getAddr(),
						jvo.getEmail(), jvo.getPhone(), jvo.getGender(), profile_img);
				
				n = service.insertJoin(vo);
			} else {
				return "error";
			}
			
			if(n<0 || n==0) return null;
			
		} catch(IOException e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/";
	}
	
	//비밀번호 찾기 메일보내기
		@GetMapping("/forget/member")
		public String pwdSearch(String email) {
			String setfrom = "kurassyio@naver.com"; //관리자 이메일
			String tomail = email; // 받는 사람 이메일
			String title = "에어 큐엔큐 비밀번호찾기 확인 이메일 입니다."; // 제목
			String content = ""; // 내용
			
			System.out.println("받는사람 이메일주소 : " + email);
			
			StringBuffer rKey = new RandomKey().getRandomKeyValue();
			System.out.println("랜덤한 인증Key : " + rKey);
			
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,
						true, "UTF-8");

				messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용

				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e);
			}

			return "main/main.tiles";
			
		}
		
		class RandomKey { //랜덤문자열값 생성 클래스
			StringBuffer temp = new StringBuffer();
			public StringBuffer getRandomKeyValue() {
				Random rnd = new Random();
				for (int i = 0; i < 20; i++) {
					int rIndex = rnd.nextInt(3);
					switch (rIndex) {
					case 0:
						// a-z
						temp.append((char) ((int) (rnd.nextInt(26)) + 97));
						break;
					case 1:
						// A-Z
						temp.append((char) ((int) (rnd.nextInt(26)) + 65));
						break;
					case 2:
						// 0-9
						temp.append((rnd.nextInt(10)));
						break;
					}
				}
				
				return temp;
			}
		}
}
