package com.jhta.airqnq.vo;

public class HouseImgVo {
	private int imgnum;
	private int hinum;
	private String img;
	private String del_yn;
	private int ordernum;
	
	public HouseImgVo() {
		
	}

	public HouseImgVo(int imgnum, int hinum, String img, String del_yn, int ordernum) {
		super();
		this.imgnum = imgnum;
		this.hinum = hinum;
		this.img = img;
		this.del_yn = del_yn;
		this.ordernum = ordernum;
	}

	public int getImgnum() {
		return imgnum;
	}

	public void setImgnum(int imgnum) {
		this.imgnum = imgnum;
	}

	public int getHinum() {
		return hinum;
	}

	public void setHinum(int hinum) {
		this.hinum = hinum;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public int getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	
	
}
