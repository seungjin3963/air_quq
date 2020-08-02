package com.jhta.airqnq.vo;

public class ReviewmodalVo {
	
	private int menum;
	private String id;
	private String content;
	
	public ReviewmodalVo(int menum, String id, String content) {
		super();
		this.menum = menum;
		this.id = id;
		this.content = content;
	}

	public int getMenum() {
		return menum;
	}

	public void setMenum(int menum) {
		this.menum = menum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
