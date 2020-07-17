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
	
	public EP_ManagementVo() {}
	
	public EP_ManagementVo(String img , int ordernum) {
		this.img=img;
		this.ordernum=ordernum;
	}
	
	public EP_ManagementVo(int memnum, int div_type, String title, int hinum, String subname,String loc,String intr,String program,String price
			) {
		super();
		this.memnum = memnum;
		this.div_type = div_type;
		this.title = title;
		this.hinum = hinum;
		this.subname = subname;
	}



	public EP_ManagementVo(int einum, int sunum, int memnum, int div_type, String loc, String intr, String program,
			String title, String price, String times, String mater, int sessionnum, int hinum,Date regdate , int people) {
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
	
	
}
