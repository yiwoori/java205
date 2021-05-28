package ch07;

//2.Person 클래스를 상속해서 확장하는
//새로운 클래스 Male 클래스와 Female 클래스를 정의 해봅시다.
public class Male extends Person {

	//①각 클래스는 상속 받은 멤버 외에 추가적인 변수와 메소드를 추가해서
	//새로운 클래스를 정의해봅시다.
	String gender;
	String major;
	int grade;
	
	void hello2() {
		System.out.println("저는 "+major+"전공이고, "+grade+"학년 입니다.");
	}

	
	//②Person 클래스에서 정의된 인사하는 메소드를 오버라이딩 해봅시다.
	void hello() {
		System.out.println("안녕하세요. 저는 "+name+"입니다. "+age()+"살이고, "
				+gender+"입니다.");
	}
	
	
	
	//③Person 클래스에 생성자를 정의해서 인스턴스 변수들을 초기화 해봅시다.
	Male(String name, String idNum, String gender, String major, int grade) {
		super(name,idNum);
		this.gender = gender;
		this.major = major;
		this.grade = grade;
	}
}

