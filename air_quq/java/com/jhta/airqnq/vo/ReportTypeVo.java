package com.jhta.airqnq.vo;

public class ReportTypeVo {
	// 신고 유형 번호
	private Integer rpnum;

	// 신고 내용
	private String content;
	
	//신고자 번호
	private int menum;
	
	//신고된 숙소 번호
	private int hinum;
	
	// 삭제여부
	private String del_yn;

	public ReportTypeVo() {}
	
	public ReportTypeVo(Integer rpnum, String content, int menum, int hinum, String del_yn) {
		super();
		this.rpnum = rpnum;
		this.content = content;
		this.menum = menum;
		this.hinum = hinum;
		this.del_yn = del_yn;
	}

	public Integer getRpnum() {
		return rpnum;
	}

	public void setRpnum(Integer rpnum) {
		this.rpnum = rpnum;
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

	@Override
	public String toString() {
		return "ReportTypeVo [rpnum=" + rpnum + ", content=" + content + ", del_yn=" + del_yn + "]";
	}
}
