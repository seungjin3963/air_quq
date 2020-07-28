package com.jhta.airqnq.vo;

import java.util.Date;

public class EP_ManagementVo {
	private int einum;
	private int sunum;
	private int memnum;
	private int div_type;
	private String loc;
	private String intr;
	private String program;
	private String title;
	private String price;
	private String times;
	private String mater;
	private int sessionnum;
	private int hinum;
	private Date regdate;
	private int people;
	private String subname;
	private String img;
	private int ordernum;
	private String reason;
	private int count;
	private int checkNum;
	private String del_yn;
	
	private String lat;
	private String lnt;
	
	
	
	public EP_ManagementVo() {}
	
	public EP_ManagementVo(int hinum ,String img , int ordernum) { 
		this.img=img;
		this.ordernum=ordernum;
		this.hinum=hinum;
	}
	public EP_ManagementVo(int memnum, int div_type, String loc, String intr, String program, String title,String subname,
			String price, String times, int hinum) {
		
		this.memnum = memnum;
		this.div_type = div_type;
		this.loc = loc;
		this.intr = intr;
		this.program = program;
		this.title = title;
		this.price = price;
		this.times = times;
		this.hinum = hinum;
		this.subname=subname;
	}
	public EP_ManagementVo(int einum, int sunum, int memnum, int div_type, String loc, String intr, String program,
			String title, String price, String times, String mater, int sessionnum, int hinum,Date regdate , int people ,String reason , String del_yn, String lnt , String lat) {
		super();
		this.einum = einum;
		this.sunum = sunum;
		this.memnum = memnum;
		this.div_type = div_type;
		this.loc = loc;
		this.intr = intr;
		this.program = program;
		this.title = title;
		this.price = price;
		this.times = times;
		this.mater = mater;
		this.sessionnum = sessionnum;
		this.hinum = hinum;
		this.regdate = regdate;
		this.people= people;
		this.reason=reason;
		this.del_yn=del_yn;
		this.lat=lat;
		this.lnt=lnt;
	}
	
	

	

	public EP_ManagementVo(String title, String price, String times, int hinum, String img , String subname) { // 온라인 체험 list 뽑아오는 vo
		
		this.title = title;
		this.price = price;
		this.times = times;
		this.hinum = hinum;
		this.img = img;
		this.subname=subname;
	}
	public EP_ManagementVo(String title, String price, String times, int hinum, String img , String subname ,int count, int checkNum) { // 체험 예약 list 뽑아오는 vo
		this.count=count;
		this.title = title;
		this.price = price;
		this.times = times;
		this.hinum = hinum;
		this.img = img;
		this.subname=subname;
		this.checkNum=checkNum;
	}
	

	public EP_ManagementVo(String title, String price, int hinum, String img, int count, int checkNum) { // 숙소 예약 list
		super();
		this.title = title;
		this.price = price;
		this.hinum = hinum;
		this.img = img;
		this.count = count;
		this.checkNum = checkNum;
	}

	public int getEinum() {
		return einum;
	}

	public void setEinum(int einum) {
		this.einum = einum;
	}

	public int getSunum() {
		return sunum;
	}

	public void setSunum(int sunum) {
		this.sunum = sunum;
	}

	public int getMemnum() {
		return memnum;
	}

	public void setMemnum(int memnum) {
		this.memnum = memnum;
	}

	public int getDiv_type() {
		return div_type;
	}

	public void setDiv_type(int div_type) {
		this.div_type = div_type;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public String getIntr() {
		return intr;
	}

	public void setIntr(String intr) {
		this.intr = intr;
	}

	public String getProgram() {
		return program;
	}

	public void setProgram(String program) {
		this.program = program;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getTimes() {
		return times;
	}

	public void setTimes(String times) {
		this.times = times;
	}

	public String getMater() {
		return mater;
	}

	public void setMater(String mater) {
		this.mater = mater;
	}

	public int getSessionnum() {
		return sessionnum;
	}

	public void setSessionnum(int sessionnum) {
		this.sessionnum = sessionnum;
	}

	public int getHinum() {
		return hinum;
	}

	public void setHinum(int hinum) {
		this.hinum = hinum;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}



	public String getSubname() {
		return subname;
	}
	public void setSubname(String subname) {
		this.subname = subname;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getCheckNum() {
		return checkNum;
	}

	public void setCheckNum(int checkNum) {
		this.checkNum = checkNum;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLnt() {
		return lnt;
	}

	public void setLnt(String lnt) {
		this.lnt = lnt;
	}


	
}
