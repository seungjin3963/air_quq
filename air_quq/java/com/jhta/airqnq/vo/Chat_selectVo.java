package com.jhta.airqnq.vo;

public class Chat_selectVo {
	// 채팅방번호
	private Integer chat_no;

	// 멤버번호
	private Integer menum;

	// 상대번호
	private Integer younum;

	// 삭제여부
	private String del_yn;

	public Integer getChat_no() {
		return chat_no;
	}

	public void setChat_no(Integer chat_no) {
		this.chat_no = chat_no;
	}

	public Integer getMenum() {
		return menum;
	}

	public void setMenum(Integer menum) {
		this.menum = menum;
	}

	public Integer getYounum() {
		return younum;
	}

	public void setYounum(Integer younum) {
		this.younum = younum;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	@Override
	public String toString() {
		return "Chat_selectVo [chat_no=" + chat_no + ", menum=" + menum + ", younum=" + younum + ", del_yn=" + del_yn
				+ "]";
	}

}
