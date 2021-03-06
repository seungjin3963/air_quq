package com.jhta.airqnq.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.lang.reflect.Array;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.airqnq.service.AdminApproveService;
import com.jhta.airqnq.service.ApplyService;
import com.jhta.airqnq.service.House_infoAdminService;
import com.jhta.airqnq.service.MemberService;
import com.jhta.airqnq.service.RentService;
import com.jhta.airqnq.service.ReviewAndGradeService;
import com.jhta.airqnq.vo.ApplyVo;
import com.jhta.airqnq.vo.Apply_infoVo;
import com.jhta.airqnq.vo.ConvenDetailVo;
import com.jhta.airqnq.vo.EP_ManagementVo;
import com.jhta.airqnq.vo.JoinVo;
import com.jhta.airqnq.vo.MemberVo;
import com.jhta.airqnq.vo.RentVo;
import com.jhta.airqnq.vo.ReviewAndGradeVo;
import com.jhta.airqnq.vo.ReviewGradeVo;
import com.jhta.airqnq.vo.ReviewmodalVo;

@Controller
public class UserApplyController {

	private static final String Date = null;

	@Autowired
	private ApplyService service;
	
	@Autowired
	private MemberService memberservice;

	@Autowired
	private House_infoAdminService house_infoService;
	
	@Autowired
	private RentService rentservice;
	
	@Autowired
	private AdminApproveService approveservice;
	
	@Autowired
	private ReviewAndGradeService reviewandgradeservice;

	@RequestMapping(value="/user/apply")
	public String userapply(Model model,HttpSession session, String start_day, String end_day, int hinum, int people_count) {
		
		
		ConvenDetailVo convenvo= service.selectconvendetail(hinum);
		Apply_infoVo infovo= house_infoService.HinumSelect(hinum);
		List<RentVo> hinumrentlist=rentservice.hinumrentselect(hinum);
		List<EP_ManagementVo> epvo = approveservice.epappImg(hinum);
		List<ReviewGradeVo> review=reviewandgradeservice.selectreviewandgrade(hinum);
		
		HashMap<String, String> usercheck=new HashMap<String, String>();
		HashMap<String, Object> revieavg=new HashMap<String, Object>();
		ArrayList<ReviewmodalVo> membernumid=new ArrayList<ReviewmodalVo>();

		String imgarr=null;

		int cnt=0;
		
		for(EP_ManagementVo vo: epvo) {
			if(vo.getImg() != null) {
				if(vo.getOrdernum() == 1) {
					if(epvo.size() == 1) {
						imgarr=vo.getImg();
					}else {
						imgarr=vo.getImg()+"/";
						cnt++;
					}
				}else {
					if(epvo.size()-1 == cnt) {
						imgarr+=vo.getImg();
					}else {
						imgarr+=vo.getImg()+"/";
						cnt++;
					}
				}
			}
		}
		
		String chekcdatepicker=null;
		
		if(hinumrentlist != null) {
		
			ArrayList<String> temp=new ArrayList<String>();
			ArrayList<String> temp2=new ArrayList<String>();
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			
			boolean overlap=true;
			
			for(RentVo vo : hinumrentlist) {
				
				long timetemp=vo.getEndrent().getTime()-vo.getStartrent().getTime();
				
				long daybetween=timetemp/(24*60*60*1000);
				
				if(overlap) {
					temp.add(sdf.format(vo.getStartrent()));
					
					for (int i = 0; i < daybetween; i++) {
						boolean overlapcheck=true;
						
						Calendar cal = Calendar.getInstance();
						
						try {
							Date hinumrentdate = sdf.parse(temp.get(temp.size()-1));
							
							cal.setTime(hinumrentdate);
							cal.add(Calendar.DATE,1);
							
							Date tempday=new Date(cal.getTimeInMillis());
							
							for (int j = 0; j < temp.size(); j++) {
								if(sdf.format(tempday).equals(temp.get(j))) {
									overlapcheck=false;
								}
							}
							if(overlapcheck) {
								temp.add(sdf.format(tempday));
							}
							
						} catch (ParseException pe) {
							System.out.println("String -> date 변경 오류:"+pe.getMessage());
						}
					}
					
					overlap=false;
				}else {
					for (int i = 0; i < daybetween; i++) {
						boolean overlapcheck=true;
						
						Calendar cal = Calendar.getInstance();
						
						try {
							if(temp2.size()==0) {
								String otherday=sdf.format(vo.getStartrent());
								
								temp2.add(otherday);
								
								for (int j = 0; j < temp.size(); j++) {
									if(otherday.equals(temp.get(j))) {
										overlapcheck=false;
									}
								}
								
								if(overlapcheck) {
									temp.add(otherday);
								}
							}
							
							Date hinumrentdate = sdf.parse(temp2.get(temp2.size()-1));
							
							cal.setTime(hinumrentdate);
							cal.add(Calendar.DATE,1);
							
							Date tempday=new Date(cal.getTimeInMillis());
							
							String tempday2=sdf.format(tempday);
							
							for (int j = 0; j < temp.size(); j++) {
								if(sdf.format(tempday).equals(temp.get(j))) {
									overlapcheck=false;
								}
							}
							if(overlapcheck) {
								temp.add(sdf.format(tempday));
								if(daybetween > 1) {
									temp2.add(tempday2);
								}
							}
							
							if(i == daybetween-1) {
								for (int j = 0; j < temp2.size(); j++) {
									temp2.remove(j);
								}
							}
						} catch (ParseException pe) {
							System.out.println("String -> date 변경 오류:"+pe.getMessage());
						}
					}
				}
			}
			
			for (int i = 0; i < temp.size(); i++) {
				if(i == 0) {
					chekcdatepicker=temp.get(i)+"/";
				}else {
					if(i == temp.size()-1) {
						chekcdatepicker+=temp.get(i);
					}else {
						chekcdatepicker+=temp.get(i)+"/";
					}
				}
			}
		}
		
		String start=start_day.replace("-", "/");
		String end=end_day.replace("-", "/");
		
		usercheck.put("checkIn", start);
		usercheck.put("checkOut", end);
		usercheck.put("max_n", people_count+"");
		
		try {
			
			SimpleDateFormat format=new SimpleDateFormat("yyyy/MM/dd");
			
			Date start2=(Date) format.parse(start);
			Date end2=(Date) format.parse(end);
			
			java.sql.Date rentstart=new java.sql.Date(start2.getTime());
			java.sql.Date rentend=new java.sql.Date(end2.getTime());
			
			long timebetween1=end2.getTime()-start2.getTime();
			
			long timebetween2=timebetween1/(24*60*60*1000);
			
			long timebetween3=timebetween2*infovo.getPrice();
			
			RentVo rentvo=new RentVo(0, hinum, 0, rentstart, rentend, 1, people_count, (int)timebetween3, "n", null, null,1);

			session.setAttribute("rentVo", rentvo);

			String conven=null;
			
			boolean convencheck=true;
			
			if(convenvo.getPool() == 1) {
				if(convencheck) {
					conven="수영장・";
					convencheck=false;
				}
			}
			if(convenvo.getPaking() == 1) {
				if(convencheck) {
					conven="주차장・";
					convencheck=false;
				}else {
					conven+="주차장・";
				}
			}
			if(convenvo.getWifi() == 1) {
				if(convencheck) {
					conven="무선인터넷・";
					convencheck=false;
				}else {
					conven+="무선인터넷・";
				}
			}
			if(convenvo.getWasher() == 1) {
				if(convencheck) {
					conven="세탁기・";
					convencheck=false;
				}else {
					conven+="세탁기・";
				}
			}
			if(convenvo.getKitchen() == 1) {
				if(convencheck) {
					conven="주방・";
					convencheck=false;
				}else {
					conven+="주방・";
				}
			}
			
			conven=conven.substring(0, conven.length()-1);
			
			Double clean=0.0;
			Double accuracy=0.0;
			Double commu=0.0;
			Double position=0.0;
			Double checkinscore=0.0;
			Double satis=0.0;
			Double score=0.0;
			int reviewgradecnt=0;
			String scoretot=null;
			
			if(review != null) {
				for(ReviewGradeVo vo : review) {
					clean+=vo.getClean();
					accuracy+=vo.getAccuracy();
					commu+=vo.getCommu();
					position+=vo.getPosition();
					checkinscore+=vo.getCheckin();
					satis+=vo.getSatis();
					score+=vo.getScore();
					reviewgradecnt++;
					
					ReviewmodalVo reviewvo=new ReviewmodalVo(vo.getMenum(), memberservice.MemberOne(vo.getMenum()).getId() , vo.getContent());
					membernumid.add(reviewvo);
					
				}
				
				clean/=reviewgradecnt;
				accuracy/=reviewgradecnt;
				commu/=reviewgradecnt;
				position/=reviewgradecnt;
				checkinscore/=reviewgradecnt;
				satis/=reviewgradecnt;
				score/=reviewgradecnt;
				
				scoretot=String.format("%.2f",score);
				
				revieavg.put("clean", clean);
				revieavg.put("accuracy", accuracy);
				revieavg.put("commu", commu);
				revieavg.put("position", position);
				revieavg.put("checkinscore", checkinscore);
				revieavg.put("satis", satis);
				revieavg.put("scoretot", scoretot);
				revieavg.put("reviewgradecnt", reviewgradecnt);
			}
			
			model.addAttribute("imgarr", imgarr);
			model.addAttribute("infovo", infovo);
			model.addAttribute("usercheck", usercheck);
			model.addAttribute("conven", conven);
			model.addAttribute("convendetail", convenvo.getEtc());
			model.addAttribute("chekcdatepicker", chekcdatepicker);
			model.addAttribute("revieavg", revieavg);
			model.addAttribute("review", review);
			model.addAttribute("membernumid", membernumid);
			model.addAttribute("reviewgradecnt", reviewgradecnt);
			
		} catch (ParseException pe) {
			System.out.println("날짜 오류 :"+pe);
		}
		
		return ".apply.userapply";
	}
	
	@GetMapping("/user/apply/memberimg")
	public void memberimg(int menum, HttpServletResponse resp) {
		resp.setContentType("image/jpeg");

		try {
			JoinVo vo = memberservice.MemberOne(menum);
	
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
	
// 환불기능 나중에
//	@RequestMapping("/refund/access_token")
//	@ResponseBody
//	public HashMap<String, Object> updateSpittle(String imp_key,String imp_secret) {
//	    
//		HashMap<String, Object> request = new HashMap<String, Object>();
//		request.put("imp_key", imp_key);
//		request.put("imp_secret",imp_secret);
//		
//		RestTemplate rest = new RestTemplate();
//		System.out.println(rest.postForObject("https://api.iamport.kr/users/getToken", request,request.getClass()));
//		return rest.postForObject("https://api.iamport.kr/users/getToken", request,request.getClass());
//	}
//	
//	@RequestMapping("/refund/use")
//	@ResponseBody
//	public HashMap<String, Object> refunttest(String imp_uid,String reason,int amount,String accountname,String banknumber,String accountnumber,String Authorization) {
//		
//		RestTemplate rest = new RestTemplate();
//		
//		HashMap<String, Object> postrequest=new HashMap<String, Object>();
//		
//		postrequest.put("Content-Type", "application/json");
//		postrequest.put("access_token", Authorization);
//		postrequest.put("imp_uid", imp_uid);
//		postrequest.put("amount", amount);
//		if(accountname != null) {
//			postrequest.put("refund_holder",accountname);
//			postrequest.put("refund_bank",banknumber);
//			postrequest.put("refund_account",accountnumber);
//		}
//		
//		rest.postForObject("https://api.iamport.kr/payments/cancel", postrequest, postrequest.getClass());
//		return rest.postForObject("https://api.iamport.kr/payments/cancel", postrequest, postrequest.getClass());
//	}
	
	/* 준범 */
	@PostMapping(value = "/user/apply/setApply")
	@ResponseBody
	public void totmoney(HttpSession session, String checkin, String checkout, int checkcnt,int summoney) {
		RentVo rent=(RentVo)session.getAttribute("rentVo");
		ApplyVo applyVo=new ApplyVo(checkin, checkout, checkcnt, summoney);
		
		try {
			String start=checkin;
			String end=checkout;

			SimpleDateFormat format=new SimpleDateFormat("yyyy/MM/dd");
			
			Date start2=(Date) format.parse(start);
			Date end2=(Date) format.parse(end);
			
			java.sql.Date rentstart=new java.sql.Date(start2.getTime());
			java.sql.Date rentend=new java.sql.Date(end2.getTime());
			
			rent.setStartrent(rentstart);
			rent.setEndrent(rentend);
			rent.setPerson(checkcnt);
			rent.setPay_price(summoney);
			
			session.setAttribute("rentVo", rent);
			session.setAttribute("applyVo", applyVo);
			
		} catch (ParseException pe) {
			System.out.println("수정 날짜 오류"+pe.getMessage());
		}
	}
	

	@GetMapping(value = "/user/applyCheck")
	public String apply(HttpSession session) {
//		MemberVo vo=(MemberVo) session.getAttribute("memberVo");
//		
//		if(vo != null) {
//			return ".apply.applyCheck";
//		}else {
//			return ".login";
//		}
		
		if((boolean) session.getAttribute("logind")) {
			return ".apply.applyCheck";
		}else {
			return ".login";
		}
	}

	@GetMapping("/user/applyCheck/getMemberInfo")
	@ResponseBody
	public MemberVo getMemberInfo(HttpSession session) {
		return (MemberVo) session.getAttribute("memberVo");
	}
	
	@PostMapping("/user/apply/cencel")
	@ResponseBody
	public String applyCencel(HttpSession session, int rtnum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menum", session.getAttribute("menum"));
		map.put("rtnum", rtnum);
		try {
			service.applyCencel(map);
			return "success";
		}catch (Exception e) {
			System.out.println(e.getMessage());
			return "error";
		}
	}
}