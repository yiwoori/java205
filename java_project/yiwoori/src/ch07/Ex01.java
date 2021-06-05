package ch07;

class Car {
	int gasolinegauge;
	Car(int gas) {
		this.gasolinegauge = gas;
	}
}
class HybridCar extends Car {
	int electronicGauge;
	HybridCar(int gas, int eg){
		super(gas);
		this.electronicGauge = eg;
	}
}
class HybridWaterCar extends HybridCar {
	int waterGauge;
	public HybridWaterCar(int gas,int eg, int wg) {
		super(gas,eg);
		this.waterGauge = wg;
	}
	public void showCurrentGauge() {
		System.out.println("잔여 가솔린 : "+gasolinegauge);
		System.out.println("잔여 가솔린 : "+electronicGauge);
		System.out.println("잔여 가솔린 : "+waterGauge);
	}
}

public class Ex01 {
	public static void main(String[] args) {
		
		HybridWaterCar waterCar = new HybridWaterCar(300, 200, 50);
		waterCar.showCurrentGauge();
		
		
	}

}
