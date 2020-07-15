package com.jhta.airqnq.vo;

import java.sql.Blob;

//슬라이더 저장공간
public class SliderVo {
	private int einum;//ei번호
	private int hinum;//체험번호
	private int memnum;//호스트번호
	//-------------메인-----------------//
	private String img;//이미지
	private String title;//제목
	private String loc;//지역
	private String times;//시간
	private String price;//가격
	private int score;//평점
	//-------------상세-----------------//
	private String id;//아이디
	private String addr;//주소
	private String email;//이메일
	private String phone;//전화번호
	private byte[] profile_img;//프로필이미지
	private String nickname;//닉네임
	private String program;//프로그램 소개
	private String intr;//호스트자기소개
	private String mater;//준비물
	private int people;//인원수
	public SliderVo() {};
	//메인화면
	public SliderVo(int score,int hinum,int memnum,String img,String title,String loc,String times,String price) {
		this.hinum=hinum;
		this.memnum=memnum;
		this.img=img;
		this.title=title;
		this.loc=loc;
		this.times=times;
		this.price=price;
		this.score=score;
	}
	//상세화면
	public SliderVo(int einum,int hinum,int memnum,String img, String title, String loc,
			String times, String price,int score ,String id ,String addr,
			String email,String phone,byte[] profile_img,String nickname,
			String program,String intr,String mater,int people
			) {
		this.einum=einum;
		this.hinum=hinum;
		this.memnum=memnum;
		this.img=img;
		this.title=title;
		this.loc=loc;
		this.times=times;
		this.price=price;
		this.score=score;
		this.id=id;
		this.addr=addr;
		this.email=email;
		this.phone=phone;
		this.profile_img=profile_img;
		this.nickname=nickname;
		this.program=program;
		this.intr=intr;
		this.mater=mater;
		this.people=people;
	}
	public int getEinum() {
		return einum;
	}
	public void setEinum(int einum) {
		this.einum = einum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public byte[] getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(byte[] profile_img) {
		this.profile_img = profile_img;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getScore() {
		return score;
	}
	public int getHinum() {
		return hinum;
	}
	public void setHinum(int hinum) {
		this.hinum = hinum;
	}
	public int getMemnum() {
		return memnum;
	}
	public void setMemnum(int memnum) {
		this.memnum = memnum;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getTimes() {
		return times;
	}
	public void setTimes(String times) {
		this.times = times;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getProgram() {
		return program;
	}
	public void setProgram(String program) {
		this.program = program;
	}
	public String getIntr() {
		return intr;
	}
	public void setIntr(String intr) {
		this.intr = intr;
	}
	public String getMater() {
		return mater;
	}
	public void setMater(String mater) {
		this.mater = mater;
	}
	
}
