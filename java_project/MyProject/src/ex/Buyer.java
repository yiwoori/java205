package ex;

public class Buyer {

	int money;
	int bonusPoint;
	Product[] item;
	int cnt;
	
	public Buyer() {
		this.money = 10000;
		this.bonusPoint = 0;
		this.item = new Product[10];
		this.cnt = 0;
	}
	
	//제품들을 구매
	void buy(Product p) {
		
		//보유 금액을 확인하고 구매 여부 체크
		if(this.money<p.price) {
			System.out.println("잔액이 부족합니다.");
			return; //메서드의 종료, 값의 반환
		}
		
		this.money -= p.price;
		this.bonusPoint += p.bonusPoint;
		
		//구매내역에 제품을 추가
		item[cnt++] = p;
		//cot++
		
		System.out.println(p+" 구매");
	}
	
	void summary() {
		//구매상품 리스트, 구매금액의 총합 출력
		
		int sum = 0; //구매 총액
		int bonusPoint = 0;
		String itemList = "";
		
		//배열을 반목문을 이용해 구매 내역을 완성
		for(int i=0; i<cnt; i++) {
			//금액의 합
			sum+=item[i].price;
			//적립될 보너스 포인트
			bonusPoint+=item[i].bonusPoint;
			//구매 상품 이름
			itemList+=item[i]+", ";
			
		}
		
		System.out.println("구매 제품 : "+itemList);
		System.out.println("구매 총 금액 : "+sum+"원");
		System.out.println("적립 포인트 : "+bonusPoint+"점");
		
	}
	
	
	
	
	
	
}
