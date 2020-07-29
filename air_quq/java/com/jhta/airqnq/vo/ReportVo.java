package com.jhta.airqnq.vo;

public class ReportVo {
	private int rpnum;
	private int menum;
	private int hinum;
	private String content;
	private String del_yn;
	
	
	public ReportVo() {}
	
	public ReportVo(int rpnum, int menum, int hinum, String content, String del_yn) {
		super();
		this.rpnum = rpnum;
		this.menum = menum;
		this.hinum = hinum;
		this.content = content;
		this.del_yn = del_yn;
	}

	public int getRpnum() {
		return rpnum;
	}

	public void setRpnum(int rpnum) {
		this.rpnum = rpnum;
	}

	public int getMenum() {
		return menum;
	}

	public void setMenum(int menum) {
		this.menum = menum;
	}

	public int getHinum() {
		return hinum;
	}

	public void setHinum(int hinum) {
		this.hinum = hinum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	
	
}
