package com.jhta.airqnq.vo;

import java.sql.Blob;

//슬라이더 저장공간
public class SliderVo {
	private int hinum;//체험번호
	private int memnum;//호스트번호
	//-------------메인-----------------//
	private Blob img;//이미지
	private String title;//제목
	private String loc;//지역
	private String times;//시간
	private String price;//가격
	private int score;//평점
	//-------------상세-----------------//
	private String program;//프로그램 소개
	private String intr;//호스트자기소개
	private String mater;//준비물
	
	public SliderVo() {};
	//메인화면
	public SliderVo(int score,int hinum,int memnum,Blob img,String title,String loc,String times,String price) {
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
	public SliderVo(int hinum,int memnum,Blob img, String title, String loc, String times, String price, String program, String intr,
			String mater) {
		this.img = img;
		this.title = title;
		this.loc = loc;
		this.times = times;
		this.price = price;
		this.program = program;
		this.intr = intr;
		this.mater = mater;
		this.hinum=hinum;
		this.memnum=memnum;
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
	public Blob getImg() {
		return img;
	}
	public void setImg(Blob img) {
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
