package com.jhta.airqnq.vo;

import java.sql.Date;

public class AdminInfoVo {
	private int bnum;
	private String title;
	private String content;
	private int div;
	private int ref;
	private int level;
	private int step;
	private String del_yn;
	private Date date;
	
	public AdminInfoVo() {};
	
	public AdminInfoVo(int bnum, String title, String content, int div, int ref, int level, int step, String del_yn,Date date) {
		super();
		this.bnum = bnum;
		this.title = title;
		this.content = content;
		this.div = div;
		this.ref = ref;
		this.level = level;
		this.step = step;
		this.del_yn = del_yn;
		this.date=date;
	}
	
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getDiv() {
		return div;
	}
	public void setDiv(int div) {
		this.div = div;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	
	
}
