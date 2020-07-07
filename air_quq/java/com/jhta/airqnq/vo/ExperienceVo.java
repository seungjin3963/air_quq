package com.jhta.airqnq.vo;

public class ExperienceVo {
	private int expernum;
	private String subname;
	public ExperienceVo(int expernum, String subname) {
		
		this.expernum = expernum;
		this.subname = subname;
	}
	public int getExpernum() {
		return expernum;
	}
	public void setExpernum(int expernum) {
		this.expernum = expernum;
	}
	public String getSubname() {
		return subname;
	}
	public void setSubname(String subname) {
		this.subname = subname;
	}
	
}
