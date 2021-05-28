package ch06;

public class Score {

	public static void main(String[] args) {
		
		//1. 국어, 영어, 수학 점수 10개씩을 저장하는 배열을 정의하고
		//점수를 모두 출력하고, 평균 점수를 출력하는 프로그램 작성
		int[] korScore = {100, 50, 20, 40, 63, 58, 36, 58, 37, 87};
		int[] engScore = {49, 68, 87, 86, 76, 53, 56, 100, 45, 67};
		int[] mathScore = {34, 56, 34, 67, 87, 67, 97, 86, 67, 45};
		
		System.out.print("");
		
		//점수 모두 출력(국어, 영어, 수학)
		System.out.print("국어점수 : ");
		for(int i=0; i<korScore.length; i++) {
			System.out.print(korScore[i]+"\t");
		} System.out.println();
		
		System.out.print("영어점수 : ");
		for(int i=0; i<engScore.length; i++) {
			System.out.print(engScore[i]+"\t");
		} System.out.println();
		
		System.out.print("수학점수 : ");
		for(int i=0; i<mathScore.length; i++) {
			System.out.print(mathScore[i]+"\t");
		} System.out.println();
		System.out.println();
		
		//평균 점수 출력
		int korSum = 0;
		for(int i=0; i<korScore.length; i++) {
			korSum = korSum+korScore[i]; 
		} System.out.println("국어 점수의 총합 : "+korSum);
		
		float avg = (float)korSum/korScore.length;
		System.out.println("국어 점수의 평균 : "+avg);
		
		
		
		
		
		
		
		
		
	}
}
