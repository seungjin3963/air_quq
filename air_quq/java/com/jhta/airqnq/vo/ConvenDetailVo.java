package com.jhta.airqnq.vo;

public class ConvenDetailVo {
	private int detailnum;
	private int conum;
	private int pool;
	private int paking;
	private int wifi;
	private int washer;
	private int kitchen;
	private String etc;
	
	public ConvenDetailVo() {
		
	}

	public ConvenDetailVo(int detailnum, int conum, int pool, int paking, int wifi, int washer, int kitchen,
			String etc) {
		super();
		this.detailnum = detailnum;
		this.conum = conum;
		this.pool = pool;
		this.paking = paking;
		this.wifi = wifi;
		this.washer = washer;
		this.kitchen = kitchen;
		this.etc = etc;
	}

	public int getDetailnum() {
		return detailnum;
	}

	public void setDetailnum(int detailnum) {
		this.detailnum = detailnum;
	}

	public int getConum() {
		return conum;
	}

	public void setConum(int conum) {
		this.conum = conum;
	}

	public int getPool() {
		return pool;
	}

	public void setPool(int pool) {
		this.pool = pool;
	}

	public int getPaking() {
		return paking;
	}

	public void setPaking(int paking) {
		this.paking = paking;
	}

	public int getWifi() {
		return wifi;
	}

	public void setWifi(int wifi) {
		this.wifi = wifi;
	}

	public int getWasher() {
		return washer;
	}

	public void setWasher(int washer) {
		this.washer = washer;
	}

	public int getKitchen() {
		return kitchen;
	}

	public void setKitchen(int kitchen) {
		this.kitchen = kitchen;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}
	
	
	
}
