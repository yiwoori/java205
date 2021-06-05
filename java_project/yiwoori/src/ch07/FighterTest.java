package ch07;

abstract class Unit {
	int x, y;
	abstract void move(int x, int y);
	void stop() {
		System.out.println("Stop");
	}
}

interface Fightable {
	//public abstract 생략
	void move(int x, int y);
	void attack(Fightable f);
}

class Fighter extends Unit implements Fightable {
	//public : 조상(public)보다 접근제어자가 좁을 수 없다.
	public void move(int x, int y) {
		System.out.println("["+x+","+y+"]로 이동");
	}
	public void attack(Fightable f) {
		System.out.println(f+"를 공격");
	}
}

public class FighterTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Fighter fighter = new Fighter();
		fighter.move(100, 200);
		fighter.attack(new Fighter());
		
	}

}
