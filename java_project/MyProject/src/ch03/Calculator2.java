package ch03;

import java.util.Scanner;

public class Calculator2 {

	//정수 두 개를 매개변수의 인자로 전달받아 더하기 연산 후 출력하는 메소드를 정의
	int add (int a, int b) {
		return a+b;
	}
	
	//정수 두 개를 매개변수의 인자로 전달받아 빼기 연산 후 출력하는 메소드를 정의
	int sub (int a, int b) {
		return a-b;
	}
	
	//정수 두 개를 매개변수의 인자로 전달받아 곱하기 연산 후 출력하는 메소드를 정의
	int mult (int a, int b) {
		return a*b;
	}
	
	//정수 두 개를 매개변수의 인자로 전달받아 나누기 연산 후 출력하는 메소드를 정의
	float div (int a, int b) {
		float div = (float)a/b;
		return (float)(Math.round(div*100)/100.0);
	}
	
	//실수 반지름 하나를 매개변수의 인자로 전달받아 원의 둘레를 구해 반환하는 메소드 정의
	float circlePeri (float r) {
		float circlePeri = (float)(2*Math.PI*r); 
		return (float)(Math.round(circlePeri*100)/100.0f);
	}
	
	//실수 반지름 하나를 매개변수의 인자로 전달받아 원의 넓이를 구해 반환하는 메소드 정
	float circleArea (float r) {
		float circleArea = (float)(Math.PI*r*r);
		return (float)(Math.round(circleArea*100)/100.0);
	}
	
	public static void main(String[] args) {
		
		//메소드를 정의하고 각각의 메소드를 호출해서 결과 출력
		Calculator2 cal = new Calculator2();
		
//		System.out.println(cal.add(3, 5));
//		System.out.println(cal.sub(10, 4));
//		System.out.println(cal.mult(9, 4));
//		System.out.println(cal.div(45, 2));
//		System.out.println(cal.circlePeri(4.3f));
//		System.out.println(cal.circleArea(3.2f));
		
		
		//콘솔에서 사용자에게 데이터를 받아 메소드를 호출할 때 사용자에게 받은 데이터를
		//매개변수의 인자 전달하는 코드 추가
		Scanner scn = new Scanner(System.in);
		System.out.println("연산할 두 값을 입력해주세요");
		System.out.print("첫번째 값 : ");
		int value1 = scn.nextInt();
		System.out.print("두번째 값 : ");
		int value2 = scn.nextInt();
		System.out.println("덧셈 결과 : "+cal.add(value1, value2));
		System.out.println("뺄셈 결과 : "+cal.sub(value1, value2));
		System.out.println("곱셈 결과 : "+cal.mult(value1, value2));
		System.out.println("나눗셈 결과 : "+cal.div(value1, value2));
	}
}
