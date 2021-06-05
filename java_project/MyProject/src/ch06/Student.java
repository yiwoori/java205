package ch06;

public class Student {

	// 2.Student 클래스를 정의해봅시다.
	// ①학생이름, 국어점수, 영어점수, 수학점수를 저장하는 변수를 정의 합니다.
	private String name;
	private int korScore;
	private int engScore;
	private int mathScore;
	
	public Student (String name, int korScore, int engScore, int mathScore) {
		this.name = name;
		this.korScore = korScore;
		this.engScore = engScore;
		this.mathScore = mathScore;
	}
	
	// ②변수는 캡슐화를 합니다. getter/setter 메소드를 정의합니다.
	public void setName(String name) {
		this.name = name;
	} String getName() {
		return name;
	}
	public void setKorScore(int korScore) {
		this.korScore = korScore;
	} int getKorScore() {
		return korScore;
	}
	public void setEngScore(int engScore) {
		this.engScore = engScore;
	} int getEngScore() {
		return engScore;
	}
	public void setMathScore(int mathScore) {
		this.mathScore = mathScore;
	} int getMathScore() {
		return mathScore;
	}
	
	// ③총점과 평균을 구해 결과를 반환하는 메소드를 정의합니다.
	int sum() {
		return this.korScore+this.engScore+this.mathScore;
	}
	float avg() {
		float avg = (float)(sum())/3f;
		return (float)(Math.round(avg*100)/100.0);
	}
	
	public static void main(String[] args) {
		
		Student stu1 = new Student("학생1",87,54,78);
		System.out.println(stu1.getName()+"의 총점 : "+stu1.sum());
		System.out.println(stu1.getName()+"의 평균 : "+stu1.avg());
		System.out.println("=======================");
		Student stu2 = new Student("학생2", 67, 45, 90);
		System.out.println(stu2.getName()+"의 총점 : "+stu2.sum());
		System.out.println(stu2.getName()+"의 평균 : "+stu2.avg());
		System.out.println("=======================");
		Student stu3 = new Student("학생3", 98, 76, 87);
		System.out.println(stu3.getName()+"의 총점 : "+stu3.sum());
		System.out.println(stu3.getName()+"의 평균 : "+stu3.avg());
		
	}
}
