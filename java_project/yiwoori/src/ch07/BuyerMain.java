package ch07;

public class BuyerMain {

	public static void main(String[] args) {
		
		Buyer b1 = new Buyer();
		b1.buy(new Tv());
		b1.buy(new Audio());
		b1.buy(new Computer());
		
		System.out.println("==========================");
		System.out.println("현재 남은 금액은 "+b1.money+"원 입니다.");
		System.out.println("보유 중인 포인트는 "+b1.bonusPoint+"점 입니다.");
		
		
		
	}
}
