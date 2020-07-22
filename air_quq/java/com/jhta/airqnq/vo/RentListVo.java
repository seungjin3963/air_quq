package com.jhta.airqnq.vo;

import java.sql.Date;

public class RentListVo {

    // 예약번호 
    private Integer rtnum;

    // 숙소번호 
    private Integer hinum;

    // 멤버번호 
    private Integer menum;

    // 렌트시작일 
    private Date startrent;

    // 렌트종료일 
    private Date endrent;

    // 상태 1 : 미취소 2 : 취소
    private Integer status;

    // 인원수 
    private Integer person;

    // 총 결제 금액 
    private Integer pay_price;

    // 이용완료 
    private Boolean complete;

    // 삭제여부 
    private String del_yn;
    
    // 숙소 제목
    private String title;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getRtnum() {
		return rtnum;
	}

	public void setRtnum(Integer rtnum) {
		this.rtnum = rtnum;
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

	public Date getStartrent() {
		return startrent;
	}

	public void setStartrent(Date startrent) {
		this.startrent = startrent;
	}

	public Date getEndrent() {
		return endrent;
	}

	public void setEndrent(Date endrent) {
		this.endrent = endrent;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getPerson() {
		return person;
	}

	public void setPerson(Integer person) {
		this.person = person;
	}

	public Integer getPay_price() {
		return pay_price;
	}

	public void setPay_price(Integer pay_price) {
		this.pay_price = pay_price;
	}

	public Boolean getComplete() {
		return complete;
	}

	public void setComplete(Boolean complete) {
		this.complete = complete;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
}