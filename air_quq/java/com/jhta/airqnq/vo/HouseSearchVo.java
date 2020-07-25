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
	
	public HouseSearchVo() {}

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
	
	
}
