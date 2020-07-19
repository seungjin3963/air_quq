package com.jhta.airqnq.vo;

import java.sql.Date;

public class ExpInfoVo {
    // 체험 /온라인번호 
    private Integer einum;

    // 주제번호 
    private Integer sunum;

    // house_info 번호 
    private Integer hinum;

    // 3,4 승인 완료 31,41 등록중인  32 42 승인인 기다리는 
    private Integer div_type;

    // 주소 
    private String loc;

    // 자기소개 
    private String intr;

    // 프로그램 설명 
    private String program;

    // 체험 제목 
    private String title;

    // 금액 
    private Integer price;

    // 진행 시간 
    private String times;

    // 준비물 
    private String mater;

    // 등록중이던 페이지 num 
    private Integer sessionnum;

    // 회원번호 
    private Integer memnum;

    // 승인 완료 날짜 
    private Date regdate;

    // 인원수 
    private Integer people;

    // 삭제여부 
    private String del_yn;

	public Integer getEinum() {
		return einum;
	}

	public void setEinum(Integer einum) {
		this.einum = einum;
	}

	public Integer getSunum() {
		return sunum;
	}

	public void setSunum(Integer sunum) {
		this.sunum = sunum;
	}

	public Integer getHinum() {
		return hinum;
	}

	public void setHinum(Integer hinum) {
		this.hinum = hinum;
	}

	public Integer getDiv_type() {
		return div_type;
	}

	public void setDiv_type(Integer div_type) {
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

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
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

	public Integer getSessionnum() {
		return sessionnum;
	}

	public void setSessionnum(Integer sessionnum) {
		this.sessionnum = sessionnum;
	}

	public Integer getMemnum() {
		return memnum;
	}

	public void setMemnum(Integer memnum) {
		this.memnum = memnum;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Integer getPeople() {
		return people;
	}

	public void setPeople(Integer people) {
		this.people = people;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	@Override
	public String toString() {
		return "ExpInfoVo [einum=" + einum + ", sunum=" + sunum + ", hinum=" + hinum + ", div_type=" + div_type
				+ ", loc=" + loc + ", intr=" + intr + ", program=" + program + ", title=" + title + ", price=" + price
				+ ", times=" + times + ", mater=" + mater + ", sessionnum=" + sessionnum + ", memnum=" + memnum
				+ ", regdate=" + regdate + ", people=" + people + ", del_yn=" + del_yn + "]";
	}
}