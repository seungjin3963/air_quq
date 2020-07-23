package com.jhta.airqnq.vo;

public class ReportTypeVo {
	// 신고 유형 번호
	private Integer rynum;

	// 신고 내용
	private String content;

	// 삭제여부
	private String del_yn;

	public Integer getRynum() {
		return rynum;
	}

	public void setRynum(Integer rynum) {
		this.rynum = rynum;
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

	@Override
	public String toString() {
		return "ReportTypeVo [rynum=" + rynum + ", content=" + content + ", del_yn=" + del_yn + "]";
	}
}
