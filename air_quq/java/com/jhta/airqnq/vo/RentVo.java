package com.jhta.airqnq.vo;

import java.sql.Date;

public class RentVo {
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

    // 삭제여부 
    private String del_yn;

    // 결제고유id 
    private String imp_uid;

    // 상점거래id 
    private String merchant_uid;
    
    public RentVo() {}

	public RentVo(Integer rtnum, Integer hinum, Integer menum, Date startrent, Date endrent, Integer status,
			Integer person, Integer pay_price, String del_yn, String imp_uid, String merchant_uid) {
		super();
		this.rtnum = rtnum;
		this.hinum = hinum;
		this.menum = menum;
		this.startrent = startrent;
		this.endrent = endrent;
		this.status = status;
		this.person = person;
		this.pay_price = pay_price;
		this.del_yn = del_yn;
		this.imp_uid = imp_uid;
		this.merchant_uid = merchant_uid;
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

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public String getImp_uid() {
		return imp_uid;
	}

	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}

	public String getMerchant_uid() {
		return merchant_uid;
	}

	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}

}
