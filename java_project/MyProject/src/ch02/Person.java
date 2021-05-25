package ch02;

public class Person {
	
	String personName;
	String phoneNumber;
	String idNumber;
	
	public static void main(String[] args) {
		
		Person p = new Person();
		p.personName = "?´?š°ë¦?";
		p.phoneNumber = "010-1234-5678";
		p.idNumber = "123456-0987654";
		
		System.out.println("?´ë¦? : "+p.personName);
		System.out.println("ë²ˆí˜¸ : "+p.phoneNumber);
		System.out.println("ì£¼ë?¼ë“±ë¡ë²ˆ?˜¸ : "+p.idNumber);
		
	}
}
