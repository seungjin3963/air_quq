package com.jhta.airqnq.vo;

public class JoinVo {
	private int memun;
	private String id;
	private String pwd;
	private String addr;
	private String email;
	private String phone;
	private String gender;
	private byte[] profile_img;
	private int identi_user;
	private int identi_kakao;
	private String nickname;

	public JoinVo() {}

	public JoinVo(int memun, String id, String pwd, String addr, String email, String phone, String gender,
			byte[] profile_img, int identi_user, int identi_kakao, String nickname) {
		this.memun = memun;
		this.id = id;
		this.pwd = pwd;
		this.addr = addr;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.profile_img = profile_img;
		this.identi_user = identi_user;
		this.identi_kakao = identi_kakao;
		this.nickname = nickname;
	}

	
	public int getIdenti_user() {
		return identi_user;
	}

	public void setIdenti_user(int identi_user) {
		this.identi_user = identi_user;
	}

	public int getIdenti_kakao() {
		return identi_kakao;
	}

	public void setIdenti_kakao(int identi_kakao) {
		this.identi_kakao = identi_kakao;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public byte[] getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(byte[] profile_img) {
		this.profile_img = profile_img;
	}


}