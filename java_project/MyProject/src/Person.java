
public class Person {
	
	String personName;
	String phoneNumber;
	String idNumber;
	
	public static void main(String[] args) {
		
		Person p = new Person();
		p.personName = "이우리";
		p.phoneNumber = "010-1234-5678";
		p.idNumber = "123456-0987654";
		
		System.out.println("이름 : "+p.personName);
		System.out.println("번호 : "+p.phoneNumber);
		System.out.println("주민등록번호 : "+p.idNumber);
		
	}
}
