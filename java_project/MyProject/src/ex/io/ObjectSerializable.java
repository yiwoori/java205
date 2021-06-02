package ex.io;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class ObjectSerializable {
	public static void main(String[] args) {
		
		//인스턴스를 저장
		try {
			ObjectOutputStream out = new ObjectOutputStream
					(new FileOutputStream("Object.ser"));
			
			out.writeObject(new Circle(1,1,2.4));
			out.writeObject(new Circle(3,5,7.9));
			out.writeObject("Hello");
			out.close();
			
			System.out.println("인스턴스 저장 완료");
			
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
}



class Circle implements Serializable {
	
	//implements Serializable : 
	
	int x;
	int y;
	double r;
	
	public Circle(int x, int y, double r) {
		this.x = x;
		this.y = y;
		this.r = r;
	}
	
	public void showData() {
		System.out.println("원점 ["+x+", "+y+"]");
		System.out.println("반지름 : "+r);
	}
}





