package com.jhta.airqnq.vo;

public class ApplyVo {
	private String checkIn;
	private String checkOut;
	private int max_n;
	private int totmoney;

	public String getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}

	public String getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}

	public int getMax_n() {
		return max_n;
	}

	public void setMax_n(int max_n) {
		this.max_n = max_n;
	}

	public int getTotmoney() {
		return totmoney;
	}

	public void setTotmoney(int totmoney) {
		this.totmoney = totmoney;
	}

	@Override
	public String toString() {
		return "ApplyVo [checkIn=" + checkIn + ", checkOut=" + checkOut + ", max_n=" + max_n + ", totmoney=" + totmoney
				+ "]";
	}
}
