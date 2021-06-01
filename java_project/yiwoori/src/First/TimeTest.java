package First;

class Time {
	
	private int hour;	//0~23사이의 값
	private int minute;	//0~59사이의 값
	private int second;	//0~59사이의 값

	public void setHour(int hour) {
		if(hour < 0 || hour > 23) {
			return;
		}
		this.hour = hour;
	} public int getHour() {
		return hour;
	}
	
	public void setMinute (int min) {
		if(min < 0 || min > 59) {
			return;
		} this.minute = min;
	} public int getMinute() {
		return minute;
	}
	
	public void setSecond (int sec) {
		if(sec < 0 || sec > 59) {
			return;
		} this.second = sec;
	} public int getSecond() {
		return second;
	}
}

public class TimeTest {
	public static void main(String[] args) {
		
		Time t = new Time();
		//t.hour = 25;
		t.setHour(21);
		System.out.println(t.getHour()+"시");
		t.setHour(29);
		System.out.println(t.getHour()+"시");
		
		t.setMinute(14);
		System.out.println(t.getMinute()+"분");
		t.setMinute(62);
		System.out.println(t.getMinute()+"분");
		
		t.setSecond(37);
		System.out.println(t.getSecond()+"초");
		
	}

}
