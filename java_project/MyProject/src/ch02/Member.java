package ch02;
public class Member {
	public static void main(String[] args) {
		System.out.println("이우리");
		
		String name = "이우리";
		int age = 10;
		double height = 100.0;
		boolean hasBooks = true;
		
		System.out.println();
		System.out.println("이름 : "+name);
		System.out.println("나이 : "+age);
		System.out.println("키 : "+height);
		System.out.println("책 보유 여부 : "+hasBooks);
		
		if(hasBooks) {
			System.out.println("책 있어요!");
		} else {
			System.out.println("책 없어요!");
		}
	}
}
