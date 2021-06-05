package ch07;

interface I {
	void method();
}

class A {
	public void method(I i) {
		//b.method();
		i.method();
	}
}
class B implements I {
	public void method() {
		System.out.println("B클래스의 메소드");
	}
}
class C implements I {
	public void method() {
		System.out.println("C클래스의 메소드");
	}
}

public class InterfaceTest {

	public static void main(String[] args) {

		A a = new A();
		a.method(new C());

	}

}
