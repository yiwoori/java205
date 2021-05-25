package ch05;

public class Member {

	String name, phoneNumber, major, email, address;
	int grade, birthDay;
	
	void memberName(String name) {
		System.out.println(name);
	}
	
	public Member(String name, String phoneNumber,
			String major, String email, String address) {
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.major = major;
		this.email = email;
		this.address = address;
	}
	
	
	public static void main(String[] args) {
		
		//Member m = new Member();


	}
}
