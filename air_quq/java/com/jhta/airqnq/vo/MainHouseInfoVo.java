package com.jhta.airqnq.vo;

import java.sql.Date;

public class MainHouseInfoVo {
	private int hinum;
	private String addr;
	private int max_n;
	private String addr_detail;
	private String road_addr;
	private int price;
	private double lat;
	private double lnt;
	private Date startdate;
	private Date enddate;
	private String img;
	
	public MainHouseInfoVo() {}

	public MainHouseInfoVo(int hinum, String addr, int max_n, String addr_detail, String road_addr, int price,
			double lat, double lnt, Date startdate, Date enddate, String img) {
		super();
		this.hinum = hinum;
		this.addr = addr;
		this.max_n = max_n;
		this.addr_detail = addr_detail;
		this.road_addr = road_addr;
		this.price = price;
		this.lat = lat;
		this.lnt = lnt;
		this.startdate = startdate;
		this.enddate = enddate;
		this.img = img;
	}

	public int getHinum() {
		return hinum;
	}

	public void setHinum(int hinum) {
		this.hinum = hinum;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getMax_n() {
		return max_n;
	}

	public void setMax_n(int max_n) {
		this.max_n = max_n;
	}

	public String getAddr_detail() {
		return addr_detail;
	}

	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}

	public String getRoad_addr() {
		return road_addr;
	}

	public void setRoad_addr(String road_addr) {
		this.road_addr = road_addr;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLnt() {
		return lnt;
	}

	public void setLnt(double lnt) {
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

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
}

