package com.jhta.airqnq.vo;

public class ChatLogVo {

		private int chat_no;//채팅번호
		private String content;//내용
		private	int mnum;//번호
		private int step;//스텝
		
		public ChatLogVo() {};
		
		public ChatLogVo(int chat_no, String content, int mnum, int step) {
			super();
			this.chat_no = chat_no;
			this.content = content;
			this.mnum = mnum;
			this.step = step;
		}

		public int getChat_no() {
			return chat_no;
		}
		public void setChat_no(int chat_no) {
			this.chat_no = chat_no;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public int getMnum() {
			return mnum;
		}
		public void setMnum(int mnum) {
			this.mnum = mnum;
		}
		public int getStep() {
			return step;
		}
		public void setStep(int step) {
			this.step = step;
		}
		
		
}
