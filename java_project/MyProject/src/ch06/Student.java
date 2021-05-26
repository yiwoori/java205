package ch06;

public class Student {
	
	//①학생이름, 국어점수, 영어점수, 수학점수를 저장하는 변수를 정의 합니다.
	private String name;
	private int korScore;
	private int engScore;
	private int mathScore;
	
	public Student (String name, int korScore,
			int engScore, int mathScore) {
		this.name = name;
		this.korScore = korScore;
		this.engScore = engScore;
		this.mathScore = mathScore;
	}
	
	
	
	//②변수는 캡슐화를 합니다. getter/setter 메소드를 정의합니다.
	public void setName(String name) {
		this.name = name;
	} public String getName() {
		return this.name;
	}
	public void setKorScore(int korScore) {
		this.korScore = korScore;
	} public int getKorScore() {
		return this.korScore;
	}
	public void setEngScore(int engScore) {
		this.engScore = engScore;
	} public int getEngScore() {
		return this.engScore;
	}
	public void setMathScore(int mathScore) {
		this.mathScore = mathScore;
	} public int getMathScore() {
		return this.mathScore;
	}
	
	
	
	//③총점과 평균을 구해 결과를 반환하는 메소드를 정의합니다.
	int total() {
		return korScore+engScore+mathScore;
	}
	int average() {
		return (korScore+engScore+mathScore)/3;
	}
	void stuInfo() {
		System.out.println("학생 이름 : "+name);
		System.out.println("국어 점수 : "+korScore);
		System.out.println("영어 점수 : "+engScore);
		System.out.println("수학 점수 : "+mathScore);
		System.out.println("총점 : "+total());
		System.out.println("평균 : "+average());
	}
	
	public static void main(String[] args) {
		
		//①Student 타입의 배열을 선언하고,
		//요소 10개를 저장할 수 있는 배열 인스턴스를 생성해 봅시다.
		Student[] stuArr = new Student[10];
		
		
		//②Student 타입의 인스턴스를 생성하고
		//배열에 저장하는 코드를 정의해봅시다.
		stuArr[0] = new Student ("학생1", 80, 90, 70);
		stuArr[1] = new Student ("학생2", 65, 50, 80);
		stuArr[2] = new Student ("학생3", 90, 45, 70);
		
		
		//③배열에 저장된 Student 타입의 인스턴스의 메소드를 이용해
		//모든 데이터를 출력해봅시다.
		stuArr[0].stuInfo();
		System.out.println("================");
		stuArr[1].stuInfo();
		System.out.println("================");
		stuArr[2].stuInfo();
		
	}
}