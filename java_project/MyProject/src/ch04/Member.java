package ch04;
import java.util.Scanner;

public class Member {
	
	void vac (int birthYear) {
		int age = 2021-birthYear-1;
		boolean check1 = age<15 || age>=65;
		boolean check2 = !(age>=15 || age<65);
		
		if(check1) {
			System.out.println("���� ���������� �����մϴ�.");
		} else {
			System.out.println("�������� ����� �ƴմϴ�.");
		}
							
//		if(15>age||age>64) {
//			System.out.println("���� ���������� �����մϴ�.");
//		} else {
//			System.out.println("�������� ����� �ƴմϴ�.");
//		}
		
	}
	
	void checkUp (int birthYear) {
		int age = 2021-birthYear-1;
		if(age>19) {
			for(int i=20; i<100; i++) {
				if(age%2!=0 && age>39) {
					System.out.println("���� ���� ����Դϴ�.");
					System.out.println("�� �˻絵 �����մϴ�.");
					break;
				} else if(age%2!=0) {
					System.out.println("���� ���� ����Դϴ�.");
					break;
				} else {
					System.out.println("���� ���� ����Դϴ�.");
					break;
				}
			}
		} else {
			System.out.println("���� ����� �ƴմϴ�.");	
		}
	}
	
	public static void main(String[] args) {
		
		Member m = new Member();
		
		Scanner scn = new Scanner(System.in);
		System.out.println("�¾ �ظ� �Է����ּ��� �� ");
		int birthYear = scn.nextInt();
		
		System.out.println();
		System.out.println("<������������>");
		m.vac(birthYear);
		
		System.out.println();
		System.out.println("<�ǰ�����>");
		m.checkUp(birthYear);
		
	}
}
