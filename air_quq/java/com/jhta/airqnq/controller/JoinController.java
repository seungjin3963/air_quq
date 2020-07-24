package com.jhta.airqnq.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.airqnq.service.MemberFunctionService;
import com.jhta.airqnq.vo.JoinVo;


@Controller
public class JoinController {
	@Autowired
	MemberFunctionService service;
	
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
	
	@RequestMapping(value = "/emailchk", method = RequestMethod.GET)
	@ResponseBody
	public String selectEmail(String email) {
		String chkEmail = "";
		
		int cnt = service.emailChk(email);
		if(cnt == 0) {
			chkEmail = "false";
		} else {
			chkEmail = "true";
		}
		
		return chkEmail;
	}
	
	@PostMapping("/upload/memberjoin")
	public String memberJoinOk(HttpSession session, MultipartFile file1, JoinVo jvo) {
		System.out.println(jvo.getGender());
		try {
			byte[] profile_img = file1.getBytes();
			
			//DB에 값넣기
			int n = 0;
//			System.out.println(">>>>>>>>>>>>>>>>>>>>>" + jvo.getGender());
			if(profile_img.length <= 16777215) { //MEDIUMBLOB 최대사이즈보다 작을경우에만..
				JoinVo vo = new JoinVo(0, jvo.getId(), jvo.getPwd(), jvo.getAddr(),
						jvo.getEmail(), jvo.getPhone(), jvo.getGender(), profile_img, 0, 0, null, "n");
				
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
		public String pwdSearch(String email, Model model) {
			String setfrom = "kurassyio@naver.com"; //관리자 이메일
			String tomail = email; // 받는 사람 이메일
			String title = "에어 큐엔큐 비밀번호찾기 확인 이메일 입니다."; // 제목
			String content = ""; // 내용
			
			System.out.println("받는사람 이메일주소 : " + email);
			
			StringBuffer rkey = new RandomKey().getRandomKeyValue();
			System.out.println("랜덤한 인증Key : " + rkey);
			model.addAttribute("authkey", rkey.toString());
			model.addAttribute("auth_email", email);
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,
						true, "UTF-8");
				
				content = "인증번호는 " + rkey + " 입니다.";
				
				messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용

				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e);
			}

			return ".pwdresetForm";
			
		}
		
		class RandomKey { 
			//랜덤문자열값 생성 클래스
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
		
		@PostMapping("/forget/member/success")
		public String resetPwd(String authkey, String forgetKey, String pwd, String auth_email) {
			System.out.println(authkey + "," + forgetKey + "," + pwd);
			
			if(authkey.equals(forgetKey)) {
				System.out.println("인증 확인됨");
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("pwd", pwd);
				map.put("email", auth_email);
				int n = service.updateMemberPwd(map);
				
				if(n>0) {
					System.out.println("비밀번호 수정 완료!");
					return "redirect:/";
				}
			}
			
			return "error";
		}
}
