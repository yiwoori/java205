package ch02;
public class Member {
	public static void main(String[] args) {
		System.out.println("�̿츮");
		
		String name = "�̿츮";
		int age = 10;
		double height = 100.0;
		boolean hasBooks = true;
		
		System.out.println();
		System.out.println("�̸� : "+name);
		System.out.println("���� : "+age);
		System.out.println("Ű : "+height);
		System.out.println("å ���� ���� : "+hasBooks);
		
		if(hasBooks) {
			System.out.println("å �־��!");
		} else {
			System.out.println("å �����!");
		}
	}
}
