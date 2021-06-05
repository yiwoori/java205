package ch07;

public class Buyer {
	
	
	int money = 10000;
	int bonusPoint = 0;
	
	void buy(Product p) {

		if(money<p.price) {
			System.out.println("잔액이 부족합니다.");
			return;
		} else {
			money -= p.price;
			bonusPoint += p.bonusPoint;
			System.out.println(p+"구매 완료");
		}
		
		
	}
	
	
}
