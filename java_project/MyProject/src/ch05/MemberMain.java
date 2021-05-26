package ch05;

public class MemberMain {
	public static void main(String[] args) {
		
		Member member1 = new Member("이우리","010-1234-5678",
				"경영학과", 4, "yiwoori@gmail.com", "210525", "서울");
		
		//member1.name = "영희"; //private 설정으로 직접 참조 x
		member1.setName("영희");
		member1.printData();
		System.out.println(member1.getName());
	}
}
