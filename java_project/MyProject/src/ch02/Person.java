package ch02;

public class Person {
	
	String personName;
	String phoneNumber = "000-0000-0000";
	String idNumber1 = "900000-0000000";
	long idNumber2 = 900000-0000000;
	
	public static void main(String[] args) {
		
		Person p = new Person();
		p.personName = "�̿츮";		
		System.out.println("�̸� : "+p.personName);
		System.out.println("��ȭ��ȣ : "+p.phoneNumber);
		System.out.println("�ֹι�ȣ : "+p.idNumber1);
		
	}
}
