package com.jhta.airqnq.vo;

public class ExperienceInfoVo {
	private int ep_type; //체엄 타입
	private String ep_local; // 주소 
	private	String ep_detailsub; //세부 주제
	private String ep_intro; //자기소개
	private String ep_mater; //준비물
	private String ep_title; //제목
	public ExperienceInfoVo() {}
	public ExperienceInfoVo(int ep_type, String ep_local, String ep_detailsub, String ep_intro, String ep_mater,
			String ep_title) {
		
		this.ep_type = ep_type;
		this.ep_local = ep_local;
		this.ep_detailsub = ep_detailsub;
		this.ep_intro = ep_intro;
		this.ep_mater = ep_mater;
		this.ep_title = ep_title;
	}
	public int getEp_type() {
		return ep_type;
	}
	public void setEp_type(int ep_type) {
		this.ep_type = ep_type;
	}
	public String getEp_local() {
		return ep_local;
	}
	public void setEp_local(String ep_local) {
		this.ep_local = ep_local;
	}
	public String getEp_detailsub() {
		return ep_detailsub;
	}
	public void setEp_detailsub(String ep_detailsub) {
		this.ep_detailsub = ep_detailsub;
	}
	public String getEp_intro() {
		return ep_intro;
	}
	public void setEp_intro(String ep_intro) {
		this.ep_intro = ep_intro;
	}
	public String getEp_mater() {
		return ep_mater;
	}
	public void setEp_mater(String ep_mater) {
		this.ep_mater = ep_mater;
	}
	public String getEp_title() {
		return ep_title;
	}
	public void setEp_title(String ep_title) {
		this.ep_title = ep_title;
	}
	
}
