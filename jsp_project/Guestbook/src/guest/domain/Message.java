package guest.domain;

import java.sql.Timestamp;

//데이터베이스 처리
public class Message {
	
	//sql 컬럼과 일치
	private int messageid;
	private String guestname;
	private String password;
	private String message;
	private Timestamp regdate;
	
	public Message() {
	}

	public Message(int messageid, String guestname, String password, String message, Timestamp regdate) {
		this.messageid = messageid;
		this.guestname = guestname;
		this.password = password;
		this.message = message;
		this.regdate = regdate;
	}

	//massege 객체를 만들 수 있는 생성자 (messageid는 자동증가값)
	public Message(String guestname, String password, String message) {
		this.guestname = guestname;
		this.password = password;
		this.message = message;
	}

	public int getMessageid() {
		return messageid;
	}

	public void setMessageid(int messageid) {
		this.messageid = messageid;
	}

	public String getGuestname() {
		return guestname;
	}

	public void setGuestname(String guestname) {
		this.guestname = guestname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Message [messageid=" + messageid + ", guestname=" + guestname + ", password=" + password + ", message="
				+ message + ", regdate=" + regdate + "]";
	}
	
	

}
