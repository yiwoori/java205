package ch06;

public class StudentMain {
	public static void main(String[] args) {
		
		// 3.main()메소드에 아래 내용을 정의해봅시다.
		// ①Student 타입의 배열을 선언하고, 
		// 요소 10개를 저장할 수 있는 배열 인스턴스를 생성해 봅시다.
		Student[] stu = new Student[10];
		
		// ②Student 타입의 인스턴스를 생성하고 배열에 저장하는 코드를 정의해봅시다.
		stu[0] = new Student("학생1",100,30,40);
		stu[1] = new Student("학생2",40,30,65);
		stu[2] = new Student("학생3",49,43,68);
		stu[3] = new Student("학생4",56,76,87);
		stu[4] = new Student("학생5",76,76,54);
		stu[5] = new Student("학생6",87,67,89);
		stu[6] = new Student("학생7",32,34,67);
		stu[7] = new Student("학생8",56,100,45);
		stu[8] = new Student("학생9",65,76,45);
		stu[9] = new Student("학생10",76,87,100);
				
		// ③배열에 저장된 Student 타입의 인스턴스의 메소드를 이용해서 모든 데이터를 출력해봅시다.
		
		System.out.println("이름\t국어\t영어\t수학\t총점\t평균");
		System.out.println("--------------------------------------------------");
		for(int i=0; i<stu.length; i++) {
			System.out.print(stu[i].getName()+"\t");
			System.out.print(stu[i].getKorScore()+"\t");
			System.out.print(stu[i].getEngScore()+"\t");
			System.out.print(stu[i].getMathScore()+"\t");
			System.out.print(stu[i].sum()+"\t");
			System.out.println(stu[i].avg()+"\t");
		}
	}
}
