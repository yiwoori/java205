package ch03;

import java.util.Scanner;

public class Calculator {
	
	int add(int a, int b) {
		return a+b;
	} int sub(int a, int b) {
		return a=b;
	} int mult(int a, int b) {
		return a*b;
	} int div(int a, int b) {
		return a/b;
	}
	
	double circle1 (double r) {
		return 2*Math.PI*r;
	} double circle2 (double r) {
		return Math.PI*r*r;
	}
	
	public static void main(String[] args) {
		
		Calculator calc = new Calculator();
		System.out.println("add(10+20) = "+calc.add(10, 20));
		System.out.println("sub(20-10) = "+calc.sub(20, 10));
		System.out.println("mult(3*10) = "+calc.mult(3, 10));
		System.out.println("div(10/30) = "+calc.div(10, 30));
		
		System.out.println();
		
		System.out.println("���� �ѷ�(r=3) = "+calc.circle1(3));
		System.out.println("���� ����(r=5) = "+calc.circle2(5));
		
		System.out.println();
		
		Scanner scn = new Scanner(System.in);
		System.out.print("ù��° ���� : ");
		int num1 = scn.nextInt();
		System.out.print("�ι�° ���� : ");
		int num2 = scn.nextInt();
		System.out.println("���� �� : "+calc.add(num1, num2));
		System.out.println("�� �� : "+calc.sub(num1, num2));
		System.out.println("���� �� : "+calc.mult(num1, num2));
		System.out.println("���� �� : "+calc.div(num1, num2));
		
		
		
		
		
		
	}
}
