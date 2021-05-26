package ch07;

public class Female extends Person {

	String gender;
	String major;
	int grade;
	
	void hello2() {
		System.out.println("저는 "+major+"전공이고, "+grade+"학년 입니다.");
	}

	
	void hello() {
		System.out.println("안녕하세요. 저는 "+name+"입니다. "+age()+"살이고, "
				+gender+"입니다.");
	}
	
	
	Female(String name, String idNum, String gender, String major, int grade) {
		super(name,idNum);
		this.gender = gender;
		this.major = major;
		this.grade = grade;
	}


}
