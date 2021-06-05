package ch08;

import java.util.Scanner;

public class CalculatorMain {
	public static void main(String[] args) {
		
		Calculator cal = new Calculator2();
		
		Scanner scn = new Scanner(System.in);
		
		System.out.print("첫번째 숫자 입력 : ");
		long n1 = scn.nextLong();
		
		System.out.print("두번째 숫자 입력 : ");
		long n2 = scn.nextLong();
		
		System.out.println("================================");
		
		System.out.println("더한 값 : "+cal.add(n1, n2));
		System.out.println("뺀 값 : "+cal.substract(n1, n2));
		System.out.println("곱한 값 : "+cal.multiply(n1, n2));
		System.out.println("나눈 값 : "+cal.divide(n1, n2));
		
		
		
	}
}
