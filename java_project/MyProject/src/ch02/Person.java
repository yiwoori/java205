package ch02;

public class Person {
	
	String personName;
	String phoneNumber;
	String idNumber;
	
	public static void main(String[] args) {
		
		Person p = new Person();
		p.personName = "?��?���?";
		p.phoneNumber = "010-1234-5678";
		p.idNumber = "123456-0987654";
		
		System.out.println("?���? : "+p.personName);
		System.out.println("번호 : "+p.phoneNumber);
		System.out.println("주�?�등록번?�� : "+p.idNumber);
		
	}
}
