package ch08;

public abstract class AbstractCal implements Calculator {
	
	public long add (long n1, long n2) {
		return n1+n2;
	}
	
	public long substract(long n1, long n2) {
		return n1-n2;
	}

}
