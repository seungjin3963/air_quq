package com.jhta.airqnq.vo;

//�뒳�씪�씠�뜑 ���옣怨듦컙
public class SliderVo {
	private int einum;//ei踰덊샇
	private int hinum;//泥댄뿕踰덊샇
	private int memnum;//�샇�뒪�듃踰덊샇
	//-------------硫붿씤-----------------//
	private String img;//�씠誘몄�
	private String title;//�젣紐�
	private String loc;//吏��뿭
	private String times;//�떆媛�
	private String price;//媛�寃�
	private int score;//�룊�젏
	//-------------�긽�꽭-----------------//
	private String id;//�븘�씠�뵒
	private String addr;//二쇱냼
	private String email;//�씠硫붿씪
	private String phone;//�쟾�솕踰덊샇
	private byte[] profile_img;//�봽濡쒗븘�씠誘몄�
	private String nickname;//�땳�꽕�엫
	private String program;//�봽濡쒓렇�옩 �냼媛�
	private String intr;//�샇�뒪�듃�옄湲곗냼媛�
	private String mater;//以�鍮꾨Ъ
	private int people;//�씤�썝�닔
	private String subname;
	private int div_type;
	
	
	public SliderVo() {};
	
	
	
	
	public SliderVo(int hinum, String img, String title, String times, String price, String program, String subname, // 랜덤 list
			int div_type) {
		super();
		this.hinum = hinum;
		this.img = img;
		this.title = title;
		this.times = times;
		this.price = price;
		this.program = program;
		this.subname = subname;
		this.div_type = div_type;
	}




	public SliderVo(int hinum, int memnum, String title, String loc, String times, String price, byte[] profile_img, // hinum list 영노
			String program, String intr, String mater, int people, String subname , String id) {
		super();
		this.hinum = hinum;
		this.memnum = memnum;
		this.title = title;
		this.loc = loc;
		this.times = times;
		this.price = price;
		this.profile_img = profile_img;
		this.program = program;
		this.intr = intr;
		this.mater = mater;
		this.people = people;
		this.subname = subname;
		this.id=id;
	}




	//硫붿씤�솕硫�
	public SliderVo(int score,int hinum,int memnum,String img,String title,String loc,String times,String price) {
		this.hinum=hinum;
		this.memnum=memnum;
		this.img=img;
		this.title=title;
		this.loc=loc;
		this.times=times;
		this.price=price;
		this.score=score;
	}
	//�긽�꽭�솕硫�
	public SliderVo(int einum,int hinum,int memnum,String img, String title, String loc,
			String times, String price,int score ,String id ,String addr,
			String email,String phone,byte[] profile_img,String nickname,
			String program,String intr,String mater,int people
			) {
		this.einum=einum;
		this.hinum=hinum;
		this.memnum=memnum;
		this.img=img;
		this.title=title;
		this.loc=loc;
		this.times=times;
		this.price=price;
		this.score=score;
		this.id=id;
		this.addr=addr;
		this.email=email;
		this.phone=phone;
		this.profile_img=profile_img;
		this.nickname=nickname;
		this.program=program;
		this.intr=intr;
		this.mater=mater;
		this.people=people;
	}
	public int getEinum() {
		return einum;
	}
	public void setEinum(int einum) {
		this.einum = einum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public byte[] getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(byte[] profile_img) {
		this.profile_img = profile_img;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getScore() {
		return score;
	}
	public int getHinum() {
		return hinum;
	}
	public void setHinum(int hinum) {
		this.hinum = hinum;
	}
	public int getMemnum() {
		return memnum;
	}
	public void setMemnum(int memnum) {
		this.memnum = memnum;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getTimes() {
		return times;
	}
	public void setTimes(String times) {
		this.times = times;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getProgram() {
		return program;
	}
	public void setProgram(String program) {
		this.program = program;
	}
	public String getIntr() {
		return intr;
	}
	public void setIntr(String intr) {
		this.intr = intr;
	}
	public String getMater() {
		return mater;
	}
	public void setMater(String mater) {
		this.mater = mater;
	}
	public String getSubname() {
		return subname;
	}
	public void setSubname(String subname) {
		this.subname = subname;
	}
	public int getDiv_type() {
		return div_type;
	}
	public void setDiv_type(int div_type) {
		this.div_type = div_type;
	}
	
}
