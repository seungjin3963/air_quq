package com.jhta.airqnq.vo;

import java.sql.Date;

//숙소 
public class HouseInfoVo {

	// 숙소번호
	private Integer hinum;

	// 멤버 번호
	private Integer menum;

	// 제목
	private String title;

	// 내용
	private String content;

	// 주소
	private String addr;

	// 주소2
	private String addr_detail;

	// 일일 가격
	private Integer price;

	// 인원수
	private Integer max_n;

	// 침대 수
	private Integer bedroom;

	// 체크인 시간
	private String checkin_time;

	// 구분
	private Integer div;

	// 위도
	private String lat;

	// 경도
	private String lnt;

	// 시작일
	private Date startdate;

	// 종료일
	private Date enddate;

	// 삭제여부
	private String del_yn;
	
	//관리자 승인 여부
	private int manager_check;

	public HouseInfoVo() {
	}

	public HouseInfoVo(Integer hinum, Integer menum, String title, String content, String addr, String addr_detail,
			Integer price, Integer max_n, Integer bedroom, String checkin_time, Integer div, String lat, String lnt,
			Date startdate, Date enddate, String del_yn, int manager_check) {
		this.hinum = hinum;
		this.menum = menum;
		this.title = title;
		this.content = content;
		this.addr = addr;
		this.addr_detail = addr_detail;
		this.price = price;
		this.max_n = max_n;
		this.bedroom = bedroom;
		this.checkin_time = checkin_time;
		this.div = div;
		this.lat = lat;
		this.lnt = lnt;
		this.startdate = startdate;
		this.enddate = enddate;
		this.del_yn = del_yn;
		this.manager_check = manager_check;
	}

	public Integer getHinum() {
		return hinum;
	}

	public void setHinum(Integer hinum) {
		this.hinum = hinum;
	}

	public Integer getMenum() {
		return menum;
	}

	public void setMenum(Integer menum) {
		this.menum = menum;
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

	public Integer getDiv() {
		return div;
	}

	public void setDiv(Integer div) {
		this.div = div;
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
	
}