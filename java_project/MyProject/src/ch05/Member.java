package ch05;

public class Member {

	String name, phoneNumber, major, email, address;
	int grade, birthDay;
	
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
	
	void printData1() {
		System.out.println("이름 : "+name);
		System.out.println("전화번호 : "+phoneNumber);
		System.out.println("전공 : "+major);
		System.out.println("메일 : "+email);
		System.out.println("주소 : "+address);
		System.out.println("학년 : "+grade);
		System.out.println("생일 : "+birthDay);
	}
	
	public Member(String name, String phoneNumber,
			String major, String email, int grade) {
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.major = major;
		this.email = email;
		this.grade = grade;
	}
	void printData2() {
		System.out.println("이름 : "+name);
		System.out.println("전화번호 : "+phoneNumber);
		System.out.println("전공 : "+major);
		System.out.println("메일 : "+email);
		System.out.println("학년 : "+grade);
	}
	
	public static void main(String[] args) {
		
		Member m = new Member(
				"이우리","010-1234-5678","경영학과","yiwoori@gmail.com","서울특별시 마포구 백범로 23",4,210525);
		m.printData1();
		System.out.println();
		
		Member m2 = new Member(
				"이우리", "010-1234-5678","경영학과","yiwoori@gmail.com",4);
		m2.printData2();
		
	}
}
