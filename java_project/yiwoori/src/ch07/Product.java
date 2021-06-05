package ch07;

public class Product {
	
	int price;
	int bonusPoint;
	
	Product(int price) {
		this.price = price;
		bonusPoint = (int)(price/10.0);
	}
	
}


class Tv extends Product {
	Tv() {
		super(300);
	}
	public String toString() {
		return "Tv";
	}
}


class Computer extends Product {
	Computer() {
		super(150);
	}
	public String toString() {
		return "Computer";
	}
}


class Audio extends Product {
	Audio() {
		super(50);
	}
	public String toString() {
		return "Audio";
	}
}



