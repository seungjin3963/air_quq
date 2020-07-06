package com.jhta.airqnq.vo;

public class JoinVo {
	private int memun;
	private String id;
	private String pwd;
	private String addr;
	private String email;
	private String phone;
	private String gender;
	private String profile_img;

	public JoinVo() {}

	public JoinVo(int memun, String id, String pwd, String addr, String email, String phone, String gender,
			String profile_img) {
		super();
		this.memun = memun;
		this.id = id;
		this.pwd = pwd;
		this.addr = addr;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.profile_img = profile_img;
	}

	public int getMemun() {
		return memun;
	}

	public void setMemun(int memun) {
		this.memun = memun;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}


}