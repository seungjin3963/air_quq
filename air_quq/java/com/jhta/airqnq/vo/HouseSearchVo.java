package com.jhta.airqnq.vo;

import java.sql.Date;

public class HouseSearchVo {
	private String addr;
	private int max_n;
	private int div;
	private Date startdate;
	private Date enddate;
	private String del_yn;
	private int manager_check;
	private int startRow;
	private int endRow;
	private int hinum;
	private String title;
	private String lat;
	private String lnt;
	private int price;
	private String img;
	private String addr_detail;
	
	public HouseSearchVo() {}

	public HouseSearchVo(String addr, int max_n, int div, Date startdate, Date enddate, String del_yn, int manager_check,
			int startRow, int endRow, int hinum, String title, String lat, String lnt, int price, String img, String addr_detail) {
		super();
		this.addr = addr;
		this.max_n = max_n;
		this.div = div;
		this.startdate = startdate;
		this.enddate = enddate;
		this.del_yn = del_yn;
		this.manager_check = manager_check;
		this.startRow = startRow;
		this.endRow = endRow;
		this.hinum = hinum;
		this.title = title;
		this.lat = lat;
		this.lnt = lnt;
		this.price = price;
		this.img = img;
		this.addr_detail = addr_detail;
	}
	
	public HouseSearchVo(String addr, int max_n, int div, Date startdate, Date enddate, String del_yn, int manager_check,
			int startRow, int endRow) {
		super();
		this.addr = addr;
		this.max_n = max_n;
		this.div = div;
		this.startdate = startdate;
		this.enddate = enddate;
		this.del_yn = del_yn;
		this.manager_check = manager_check;
		this.startRow = startRow;
		this.endRow = endRow;
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
	
	

	public int getDiv() {
		return div;
	}

	public void setDiv(int div) {
		this.div = div;
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

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public int getManager_check() {
		return manager_check;
	}

	public void setManager_check(int manager_check) {
		this.manager_check = manager_check;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getHinum() {
		return hinum;
	}

	public void setHinum(int hinum) {
		this.hinum = hinum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getAddr_detail() {
		return addr_detail;
	}

	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}
	
	
}
