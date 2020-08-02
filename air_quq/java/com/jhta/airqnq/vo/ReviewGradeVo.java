package com.jhta.airqnq.vo;

public class ReviewGradeVo {
	private int hinum;
	private int menum;
	private String content;
	private float clean;
	private float accuracy;
	private float commu;
	private float position;
	private float checkin;
	private float satis;
	private float score;

	public ReviewGradeVo() {}

	public ReviewGradeVo(int hinum, int menum, String content, float clean, float accuracy, float commu, float position,
			float checkin, float satis, float score) {
		super();
		this.hinum = hinum;
		this.menum = menum;
		this.content = content;
		this.clean = clean;
		this.accuracy = accuracy;
		this.commu = commu;
		this.position = position;
		this.checkin = checkin;
		this.satis = satis;
		this.score = score;
	}

	public int getHinum() {
		return hinum;
	}

	public void setHinum(int hinum) {
		this.hinum = hinum;
	}

	public int getMenum() {
		return menum;
	}

	public void setMenum(int menum) {
		this.menum = menum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public float getClean() {
		return clean;
	}

	public void setClean(float clean) {
		this.clean = clean;
	}

	public float getAccuracy() {
		return accuracy;
	}

	public void setAccuracy(float accuracy) {
		this.accuracy = accuracy;
	}

	public float getCommu() {
		return commu;
	}

	public void setCommu(float commu) {
		this.commu = commu;
	}

	public float getPosition() {
		return position;
	}

	public void setPosition(float position) {
		this.position = position;
	}

	public float getCheckin() {
		return checkin;
	}

	public void setCheckin(float checkin) {
		this.checkin = checkin;
	}

	public float getSatis() {
		return satis;
	}

	public void setSatis(float satis) {
		this.satis = satis;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

}