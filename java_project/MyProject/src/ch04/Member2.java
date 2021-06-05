package ch04;
import java.util.Calendar;

public class Member2 {
	
//	① 독감예방 접종이 가능한지 여부를 확인하는 메소드 정의 (매개변수:태어난해)
//	- 15세 미만의 경우와 65세 이상의 경우 “무료예방접종이 가능합니다.” 메시지 출력
//	- 위의 조건 범위가 아닌 경우 “무료접종 대상이 아닙니다.”라고 출력.

	int year = Calendar.getInstance().get(Calendar.YEAR);
	int birthYear;
	int age = year-birthYear-1; //만나이 계산
	
	void vaccinCheck(int birthYear) {

		if(15>age||age>=65) {
			System.out.printf("올해 %d세로, 무료 예방접종이 가능합니다.",age);
		} else {
			System.out.printf("올해 %d세로, 무료접종 대상이 아닙니다.",age);
			if(age==64) {
				System.out.println("\n내년부터 무료접종이 가능합니다.");
			}
		}
	}
	
//	② 건강검진 대상 여부를 판별하고 어떤 검진이 가능한지 확인하는 메소드 정의
//	- 매개변수로 태어난 해(년도)를 전달받습니다.
//	- 대한민국 성인( 20세 )의 경우 무료로 2년마다 건강검진을 받을 수 있습니다.
//	- 짝수 해에 태어난 사람은 올해가 짝수년이라면 검사 대상이 됩니다.
//	- 40 이상의 경우는 암 검사도 무료 검사 가능
	
	void vaccinCheck2(int birthYear) {
		
		if(age>=20) {
			if((year%2==0)&&(age%2==0)) {
				System.out.println("올해 무료 건강검진 대상입니다.");
			} else {
				System.out.println("내년 건강검진 대상입니다.");
			}
			if(age>=40) {
				System.out.println("무료 암 검사도 가능합니다.");
			}
		} else {
			System.out.println("무료 건강검진 대상이 아닙니다.");
		}
		
	}

	public static void main(String[] args) {
		
		Member2 m = new Member2();
		m.vaccinCheck2(1956);

		
		
		
		
		
		
	}
}
