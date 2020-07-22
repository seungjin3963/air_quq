package com.jhta.airqnq.vo;

import java.sql.Date;

public class Apply_infoVo {
	
	private Integer menum;
	private Integer hinum;
	private String title;
	private String conatent;
	private String addr;
	private String addr_detail;
	private Integer price;
	private Integer max_n;
	private Integer bedroom;
	private String checkin_time;
	private String lat;
	private String lnt;
	private Date startdate;
	private Date enddate;
	private Byte[] prorile_img;
	
	public Apply_infoVo() {}

	public Apply_infoVo(Integer menum, Integer hinum, String title, String conatent, String addr, String addr_detail,
			Integer price, Integer max_n, Integer bedroom, String checkin_time, String lat, String lnt, Date startdate,
			Date enddate, Byte[] prorile_img) {
		super();
		this.menum = menum;
		this.hinum = hinum;
		this.title = title;
		this.conatent = conatent;
		this.addr = addr;
		this.addr_detail = addr_detail;
		this.price = price;
		this.max_n = max_n;
		this.bedroom = bedroom;
		this.checkin_time = checkin_time;
		this.lat = lat;
		this.lnt = lnt;
		this.startdate = startdate;
		this.enddate = enddate;
		this.prorile_img = prorile_img;
	}

	public Integer getMenum() {
		return menum;
	}

	public void setMenum(Integer menum) {
		this.menum = menum;
	}

	public Integer getHinum() {
		return hinum;
	}

	public void setHinum(Integer hinum) {
		this.hinum = hinum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getConatent() {
		return conatent;
	}

	public void setConatent(String conatent) {
		this.conatent = conatent;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddr_detail() {
		return addr_detail;
	}

	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getMax_n() {
		return max_n;
	}

	public void setMax_n(Integer max_n) {
		this.max_n = max_n;
	}

	public Integer getBedroom() {
		return bedroom;
	}

	public void setBedroom(Integer bedroom) {
		this.bedroom = bedroom;
	}

	public String getCheckin_time() {
		return checkin_time;
	}

	public void setCheckin_time(String checkin_time) {
		this.checkin_time = checkin_time;
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

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public Byte[] getProrile_img() {
		return prorile_img;
	}

	public void setProrile_img(Byte[] prorile_img) {
		this.prorile_img = prorile_img;
	}
	
}
