package com.jhta.airqnq.vo;

public class ExperienceSearchVo {
	private int hinum;
	private String loc;
	private String lat;
	private String lnt;
	private String program;
	private String title;
	private int price;
	private int times;
	private String img;
	
	public ExperienceSearchVo() {}

	public ExperienceSearchVo(int hinum, String loc, String lat, String lnt, String program, String title, int price,
			int times, String img) {
		super();
		this.hinum = hinum;
		this.loc = loc;
		this.lat = lat;
		this.lnt = lnt;
		this.program = program;
		this.title = title;
		this.price = price;
		this.times = times;
		this.img = img;
	}

	public int getHinum() {
		return hinum;
	}

	public void setHinum(int hinum) {
		this.hinum = hinum;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLnt() {
		return lnt;
	}

	public void setLnt(String lnt) {
		this.lnt = lnt;
	}

	public String getProgram() {
		return program;
	}

	public void setProgram(String program) {
		this.program = program;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	
}
