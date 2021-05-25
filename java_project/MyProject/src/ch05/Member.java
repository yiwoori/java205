package ch05;

public class Member {

	String name, phoneNumber, major, email, address;
	int grade, birthDay;
	
	void print1() {
		System.out.println(name);
		System.out.println(phoneNumber);
		System.out.println(major);
		System.out.println(email);
		System.out.println(address);
		System.out.println(grade);
		System.out.println(birthDay);
	}
	void print2() {
		System.out.println(name);
		System.out.println(phoneNumber);
		System.out.println(major);
		System.out.println(email);
		System.out.println(grade);
	}
	
	public Member(String name, String phoneNumber,
			String major, String email, String address,
			int grade, int birthDay) {
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.major = major;
		this.email = email;
		this.address = address;
		this.grade = grade;
		this.birthDay = birthDay;
	}
	public Member(String name, String phoneNumber,
			String major, String email, int grade) {
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.major = major;
		this.email = email;
		this.grade = grade;
	}
	
	public static void main(String[] args) {
		
		Member m = new Member("이우리","010-1234-5678","경영학과","yiwoori@gmail.com",4);
		m.print2();
		
	}
}
