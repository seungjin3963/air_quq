package com.jhta.airqnq.vo;

public class MemberVo {

    // 멤버번호 
    private Integer menum;

    // 아이디(카카오id) 
    private String id;

    // 비밀번호 
    private String pwd;

    // 주소 
    private String addr;

    // 이메일 
    private String email;

    // 전화번호 
    private String phone;

    // 성별 
    private String gender;

    // 프로필이미지 
    private String profile_img;

    // 관리자/유저 구별번호 
    private Integer identi_user;

    // 일반회원/카카오회원 구별 
    private Integer identi_kakao;

    // 닉네임 
    private String nickname;

    // 삭제여부 
    private String delYn;

	public Integer getMenum() {
		return menum;
	}

	public void setMenum(Integer menum) {
		this.menum = menum;
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

	public Integer getIdenti_user() {
		return identi_user;
	}

	public void setIdenti_user(Integer identi_user) {
		this.identi_user = identi_user;
	}

	public Integer getIdenti_kakao() {
		return identi_kakao;
	}

	public void setIdenti_kakao(Integer identi_kakao) {
		this.identi_kakao = identi_kakao;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	@Override
	public String toString() {
		return "MemberVo [menum=" + menum + ", id=" + id + ", pwd=" + pwd + ", addr=" + addr + ", email=" + email
				+ ", phone=" + phone + ", gender=" + gender + ", profile_img=" + profile_img + ", identi_user="
				+ identi_user + ", identi_kakao=" + identi_kakao + ", nickname=" + nickname + ", delYn=" + delYn + "]";
	}

}