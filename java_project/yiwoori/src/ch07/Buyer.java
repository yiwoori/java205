package ch07;

public class Buyer {
	
	
	int money = 10000;
	int bonusPoint = 0;
	Product[] cart = new Product[10];
	int i = 0;
	
	void buy(Product p) {
		if(money<p.price) {
			System.out.println("잔액이 부족합니다.");
			return;
		} else {
			money -= p.price;
			bonusPoint += p.bonusPoint;
			cart[i++] = p;
			System.out.println(p+"구매 완료");
		}
	}
	
	void sum() {
		int sum = 0;
		String itemString = "";
		
		for(int i=0; i<cart.length; i++) {
			if(cart[i]==null ) { break; }
			sum += cart[i].price;
			itemString += cart[i] + ", ";
		}
		System.out.println("총 금액은 "+sum+"원 입니다.");
		System.out.println("구매 제품은 "+itemString+"입니다.");
	}
	
	
}
