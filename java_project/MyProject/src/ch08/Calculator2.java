package ch08;

public class Calculator2 implements Calculator {

	public long add(long n1, long n2) {
		return n1+n2;
	}
	public long substract(long n1, long n2) {
		return n1-n2;
	}
	public long multiply(long n1, long n2) {
		return n1*n2;
	}
	public double divide(long n1, long n2) {
		return (double)n1/n2;
	}
	
}
