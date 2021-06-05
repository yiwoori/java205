package ch04;
import java.util.Calendar;
import java.util.Scanner;

public class Member {
	
	void vac (int birthYear) {
		int age = 2021-birthYear-1;
		boolean check1 = age<15 || age>=65;
		boolean check2 = !(age>=15 || age<65);
		
		if(check1) {
			System.out.println("무료 예방접종이 가능합니다.");
		} else {
			System.out.println("무료접종 대상이 아닙니다.");
		}
									
	}
	
	void checkUp (int birthYear) {
		int age = 2021-birthYear-1;
		if(age>19) {
			for(int i=20; i<100; i++) {
				if(age%2!=0 && age>39) {
					System.out.println("올해 검진 대상입니다.");
					System.out.println("암 검사도 가능합니다.");
					break;
				} else if(age%2!=0) {
					System.out.println("올해 검진 대상입니다.");
					break;
				} else {
					System.out.println("내년 검진 대상입니다.");
					break;
				}
			}
		} else {
			System.out.println("검진 대상이 아닙니다.");	
		}
	}
	
	//나이반환 메소드
	int ageCal(int year) {
		int currentYear = Calendar.getInstance().get(Calendar.YEAR); //현재 년도
		return 0;
	}
	
	public static void main(String[] args) {
		
		Member m = new Member();
		
		Scanner scn = new Scanner(System.in);
		System.out.println("태어난 해를 입력해주세요 ▼ ");
		int birthYear = scn.nextInt();
		
		System.out.println();
		System.out.println("<독감예방접종>");
		m.vac(birthYear);
		
		System.out.println();
		System.out.println("<건강검진>");
		m.checkUp(birthYear);
		
	}
}
