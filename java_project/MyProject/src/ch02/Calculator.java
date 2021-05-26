package ch02;
public class Calculator {

	//메소드 -> 기능 (재료->처리->반환)
	//반환타입 메소드이름 (매개변수들...) { 처리구문 }
	void plus(int n1, int n2) {
		System.out.println(n1+n2);
	}
	void minus(int n1, int n2) {
		System.out.println(n1-n2);
	}
	void multi(int n1, int n2) {
		System.out.println(n1*n2);
	}
	void div(int n1, int n2) {
		System.out.println(n1/n2);
	}
	
	//기본형반환타입 메소드이름 (매개변수들...) { 처리구문 + return }
	//처리구문 내 반드시 return문 포함
	int add2(int n1, int n2) {
		int value = n1+n2;
		return value;
	}
	int div2(int n1, int n2) {
		return n1/n2;		//한줄로 처
	}
	
	public static void main(String[] args) {
		
		//인스턴스 생성 -> 클래스의 정의가 필요 (필요한 변수, 필요한 메소드)
		//클래스이름 참조변수 = new 클래스이름();
		Calculator cal = new Calculator();
		cal.plus(10, 20);
		cal.minus(20, 10);
		cal.div(10, 3);
		cal.multi(2, 5);
		
		System.out.println(cal.add2(10, 5)); //반환값 출력
		System.out.println(cal.div2(3,6));
		
	}
}
