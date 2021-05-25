package ch03;

import java.util.Scanner;

public class Calculator {
	
	long add(int a, int b) {
		return (long)a+b;
	} long sub(int a, int b) {
		return (long)a-b;
	} long mult(int a, int b) {
		return (long)a*b;
	} double div(int a, int b) {
		return (double)a/b;
	}
	
	final float PI = 3.14f;
	float circle1 (float r) {
		return 2*PI*r;
	} float circle2 (float r) {
		return PI*r*r;
	}
	
	public static void main(String[] args) {
		
		Calculator calc = new Calculator();
		System.out.println("add(10+20) = "+calc.add(10, 20));
		System.out.println("sub(20-10) = "+calc.sub(20, 10));
		System.out.println("mult(3*10) = "+calc.mult(3, 10));
		System.out.println("div(10/30) = "+calc.div(10, 30));
		System.out.println("원의 둘레(r=3) = "+calc.circle1(3));
		System.out.println("원의 넓이(r=5) = "+calc.circle2(5));
		System.out.println();
		
		System.out.println("<연산값 입력>");
		Scanner scn = new Scanner(System.in);
		System.out.print("첫번째 숫자 입력 : ");
		int num1 = scn.nextInt();
		System.out.print("두번째 숫자 입력 : ");
		int num2 = scn.nextInt();
		Scanner scn2 = new Scanner(System.in);
		System.out.print("반지름 값 입력 : ");
		int num3 = scn.nextInt();
		System.out.println();
		System.out.println("<연산 결과>");
		System.out.printf("add(%d+%d) = "+calc.add(num1, num2),num1,num2);
		System.out.println();
		System.out.printf("sub(%d-%d) = "+calc.sub(num1, num2),num1,num2);
		System.out.println();
		System.out.printf("mult(%d*%d) = "+calc.mult(num1, num2),num1,num2);
		System.out.println();
		System.out.printf("div(%d/%d) = "+calc.div(num1, num2),num1,num2);
		System.out.println();
		System.out.printf("원의 둘레(r=%d) = "+calc.circle1(num3),num3);
		System.out.println();
		System.out.printf("원의 넓이(r=%d) = "+calc.circle2(num3),num3);
		
	}
}
