package ch04;
import java.util.Scanner;

public class Member {
	
	static void vac (int age) {
		if(15>age||age>64) {
			System.out.println("���� ���������� �����մϴ�.");
		} else {
			System.out.println("�������� ����� �ƴմϴ�.");
		}
	}
	
	static void checkUp (int age) {
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
		
		Scanner scn = new Scanner(System.in);
		System.out.println("���̸� �Է����ּ��� �� ");
		int age = scn.nextInt();
		
		System.out.println();
		System.out.println("<������������>");
		vac(age);
		
		System.out.println();
		System.out.println("<�ǰ�����>");
		checkUp(age);
		
	}
}
