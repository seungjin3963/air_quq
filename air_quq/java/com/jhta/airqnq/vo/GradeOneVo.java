package com.jhta.airqnq.vo;

public class GradeOneVo {
	private String gradeName;
	private int grade;
	private String content;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "GradeOneVo [gradeName=" + gradeName + ", grade=" + grade + "]";
	}
}
