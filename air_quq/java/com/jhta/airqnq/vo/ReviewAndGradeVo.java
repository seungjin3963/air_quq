package com.jhta.airqnq.vo;

public class ReviewAndGradeVo {
	private int rtnum;
	private int hinum;
	private String content;
	private float cleanGrade;
	private float accuracyGrade;
	private float commuGrade;
	private float positionGrade;
	private float checkinGrade;
	private float satisGrade;

	public float getCommuGrade() {
		return commuGrade;
	}

	public void setCommuGrade(float commuGrade) {
		this.commuGrade = commuGrade;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public float getCleanGrade() {
		return cleanGrade;
	}

	public void setCleanGrade(float cleanGrade) {
		this.cleanGrade = cleanGrade;
	}

	public float getAccuracyGrade() {
		return accuracyGrade;
	}

	public void setAccuracyGrade(float accuracyGrade) {
		this.accuracyGrade = accuracyGrade;
	}

	public float getPositionGrade() {
		return positionGrade;
	}

	public void setPositionGrade(float positionGrade) {
		this.positionGrade = positionGrade;
	}

	public float getCheckinGrade() {
		return checkinGrade;
	}

	public void setCheckinGrade(float checkinGrade) {
		this.checkinGrade = checkinGrade;
	}

	public float getSatisGrade() {
		return satisGrade;
	}

	public void setSatisGrade(float satisGrade) {
		this.satisGrade = satisGrade;
	}

	@Override
	public String toString() {
		return "ReviewAndGradeVo [rtnum=" + rtnum + ", hinum=" + hinum + ", content=" + content + ", cleanGrade="
				+ cleanGrade + ", accuracyGrade=" + accuracyGrade + ", positionGrade=" + positionGrade
				+ ", checkinGrade=" + checkinGrade + ", satisGrade=" + satisGrade + "]";
	}
}
