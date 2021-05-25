package ch02;

public class Person {
	
	String personName;
	String phoneNumber = "000-0000-0000";
	String idNumber1 = "900000-0000000";
	long idNumber2 = 900000-0000000;
	
	public static void main(String[] args) {
		
		Person p = new Person();
		p.personName = "이우리";		
		System.out.println("이름 : "+p.personName);
		System.out.println("전화번호 : "+p.phoneNumber);
		System.out.println("주민번호 : "+p.idNumber1);
		
	}
}
