package com.jhta.airqnq.vo;

public class ReviewVo {
	private int renum;
	private int menum;
	private int rtnum;
	private int hinum;
	private float score;
	private int div;
	private String content;
	private String del_yn;
	
	private int totalscore;
	
	private String id;
	private byte[] profile_img;
	
	public ReviewVo() {}

	public ReviewVo(int renum, int menum, int rtnum, int hinum, float score, int div, String content, String del_yn,
			String id, byte[] profile_img , int totalscore) {
		super();
		this.renum = renum;
		this.menum = menum;
		this.rtnum = rtnum;
		this.hinum = hinum;
		this.score = score;
		this.div = div;
		this.content = content;
		this.del_yn = del_yn;
		this.id = id;
		this.profile_img = profile_img;
		this.totalscore=totalscore;
	}

	public int getRenum() {
		return renum;
	}

	public void setRenum(int renum) {
		this.renum = renum;
	}

	public int getMenum() {
		return menum;
	}

	public void setMenum(int menum) {
		this.menum = menum;
	}

	public int getRtnum() {
		return rtnum;
	}

	public void setRtnum(int rtnum) {
		this.rtnum = rtnum;
	}

	public int getHinum() {
		return hinum;
	}

	public void setHinum(int hinum) {
		this.hinum = hinum;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public int getDiv() {
		return div;
	}

	public void setDiv(int div) {
		this.div = div;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public byte[] getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(byte[] profile_img) {
		this.profile_img = profile_img;
	}

	public int getTotalscore() {
		return totalscore;
	}

	public void setTotalscore(int totalscore) {
		this.totalscore = totalscore;
	}
	
}
