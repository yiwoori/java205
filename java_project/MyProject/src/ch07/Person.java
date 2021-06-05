package ch07;

import java.util.Calendar;

public class Person {
	
//	1.Person 이라는 클래스를 정의해봅시다.
//	①이름을 저장하는 변수, 주민등록번호를 저장하는 변수를 정의해봅시다.
//	②인사하는 메소드를 정의해봅시다.
//		- “안녕하세요. 저는 OOO입니다. 00살 입니다.”라는 문자열이 출력하도록 정의합시다.
	
	String name;
	String idNum;
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);

	Person(String name, String idNum) {
		this.name = name;
		this.idNum = idNum;
	}
	
	void hello() {
		System.out.println("안녕하세요. 저는 "+name+"입니다. "+age()+"살입니다.");
	}

	int age() {
		String a = idNum.substring(0,1);
		int age=0;
		if(a.equals("0")) {	//equals
			//return year-(Integer.parseInt(idNum.substring(0, 2))+2000)+1;
			age = year-(Integer.parseInt(idNum.substring(0, 2))+2000)+1;
		} else {
			//return year-(Integer.parseInt(idNum.substring(0, 2))+1900)+1;
			age = year-(Integer.parseInt(idNum.substring(0, 2))+1900)+1;
		} return age;
	}

	public static void main(String[] args) {
		
		Person p = new Person("이우리","021007");
		p.age();
		p.hello();
		System.out.println();
		Person p1 = new Person("우리","931007");
		p1.age();
		p1.hello();
		
	}

}