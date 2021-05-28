package ch07;

import java.util.Calendar;

public class Person {
	
	String name;
	String idNumber;
	void hello() {
		System.out.println("안녕하세요. 저는 "+name+"입니다."
				+age()+"살 입니다.");
	}
	
	int age() {
		if(idNumber.charAt(1)!=0) {
			int age = 2021-(Integer.parseInt(idNumber.substring(0, 2))+1900);
			return age;
		}else {
			int age = 2021-(Integer.parseInt(idNumber.substring(0, 2))+2000);
			System.out.println(age);
			return age;
		}
	}

	public static void main(String[] args) {
		Person p = new Person();
		p.hello();
		p.age();
	}

	
}