package polymorphism;

class Product {
	final int price;
	int bonusPoint;
	
	Product(int price) {
		this.price = price;
		bonusPoint = (int)(price/10.0);
	}
}

class Tv extends Product {
	Tv(int price) {
		super(price);
	}
	public String toString() {
		return "Tv";
	}
}
class Computer extends Product {
	Computer(int price) {
		super(price);
	}
	public String toString() {
		return "Computer";
	}
}
class Audio extends Product {
	Audio(int price){
		super(price);
	}
	public String toString() {
		return "Audio";
	}
}

class Buyer {
	int money;
	int bonusPoint;
	Product[] item;
	int cnt;
	
	Buyer() {
		this.money = 10000;
		this.bonusPoint = bonusPoint;
		this.item = new Product[10];
		this.cnt = 0;
	}
	
	void buy (Product p) {
		
		if(this.money < p.price) {
			System.out.println("잔액이 부족합니다.");
			return;
		}
		
		this.money -= p.price;
		this.bonusPoint += p.bonusPoint;
		
		item[cnt++] = p;
		
		System.out.println(p+" 구매 완료");
		
	}
	
	void summary() {
		int sum = 0;
		int bonusPoint = 0;
		String itemList = "";
		
		for(int i=0; i<cnt; i++) {
			sum += item[i].price;
			bonusPoint += item[i].bonusPoint;
			itemList += item[i] + ", ";			
		}
		System.out.println("전체 구매 제품 : "+itemList);
		System.out.println("전체 구매 금액 : "+sum);
		System.out.println("적립 보너스 포인트 : "+bonusPoint+"점");
	}
}

public class ProductMain {
	public static void main(String[] args) {
		
		Buyer b = new Buyer();
		
		Product pTv = new Tv(1000);
		Product pCom = new Computer(500);
		Product pAudio = new Audio(200);
		
		b.buy(pTv);
		b.buy(pCom);
		b.buy(pAudio);
		
		System.out.println("현재 소지한 금액은 "+b.money+"원 입니다.");
		System.out.println("현재 보유한 보너스 포인트는 "+b.bonusPoint+"점 입니다.");
		
		b.summary();
		
	}
}
