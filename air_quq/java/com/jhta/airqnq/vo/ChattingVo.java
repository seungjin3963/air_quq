package com.jhta.airqnq.vo;

public class ChattingVo {
    // 채팅 번호 
    private Integer chnum;

    // 채팅반번호 
    private Integer chat_no;

    // 내용 
    private String content;

    // 멤버번호 
    private Integer mnum;

    // 삭제여부 
    private String del_yn;

	public Integer getChnum() {
		return chnum;
	}

	public void setChnum(Integer chnum) {
		this.chnum = chnum;
	}

	public Integer getChat_no() {
		return chat_no;
	}

	public void setChat_no(Integer chat_no) {
		this.chat_no = chat_no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getMnum() {
		return mnum;
	}

	public void setMnum(Integer mnum) {
		this.mnum = mnum;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	@Override
	public String toString() {
		return "ChattingVo [chnum=" + chnum + ", chat_no=" + chat_no + ", content=" + content + ", mnum=" + mnum
				+ ", del_yn=" + del_yn + "]";
	}
    
}
