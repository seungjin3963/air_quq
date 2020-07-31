package com.jhta.airqnq.vo;

public class basketVo {
	private int banum;
	private int menum;
	private int hinum;
	private String del_yn;
	
	public basketVo() {}

	public basketVo(int banum, int menum, int hinum, String del_yn) {
		super();
		this.banum = banum;
		this.menum = menum;
		this.hinum = hinum;
		this.del_yn = del_yn;
	}

	public int getBanum() {
		return banum;
	}

	public void setBanum(int banum) {
		this.banum = banum;
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

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	
	
}
