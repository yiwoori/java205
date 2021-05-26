package ch07;

public class PersonMain {
	public static void main(String[] args) {
		
		Person p1 = new Person("김영희","900526");
		p1.hello();
		Person p2 = new Person("이철수","030527");
		p2.hello();
		System.out.println();
		Female f = new Female("영희","980321-2012345","여자","경영",3);
		f.hello();
		f.hello2();
		System.out.println();
		Male m = new Male("철수","010123-1012345","남자","미술",2);
		m.hello();
		m.hello2();
	}
}
