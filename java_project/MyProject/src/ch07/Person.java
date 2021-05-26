package ch07;

public class Person {
//	1.Person 이라는 클래스를 정의해봅시다.
//	①이름을 저장하는 변수, 주민등록번호를 저장하는 변수를 정의해봅시다.
//	②인사하는 메소드를 정의해봅시다.
//		- “안녕하세요. 저는 OOO입니다. 00살 입니다.”라는 문자열이 출력하도록 정의합시다.
	
	
	String name;
	String idNum;

	Person(String name, String idNum) {
		this.name = name;
		this.idNum = idNum;
	}
	
	void hello() {
		System.out.println("안녕하세요. 저는 "+name+"입니다. "+age()+"살입니다.");
	}

	int age() {
		String year = idNum.substring(0);
		if(year!="0") {
			int age = Integer.parseInt(idNum.substring(0, 2))+1900;
			return 2021-age;
		} else {
			int age = Integer.parseInt(idNum.substring(0, 2))+2000;
			return 2021-age;
		}
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