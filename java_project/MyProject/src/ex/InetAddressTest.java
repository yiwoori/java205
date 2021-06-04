package ex;

import java.net.InetAddress;
import java.net.UnknownHostException;

public class InetAddressTest {

	public static void main(String[] args) {
		
		String urlStr = "www.naver.com";
		
		try {
			
			InetAddress ip = InetAddress.getByName(urlStr);
			
			System.out.println("호스트 이름 : "+ip.getHostName());
			System.out.println("IP address : "+ip.getHostAddress());
			
		} catch (UnknownHostException e) {
			e.printStackTrace();
			
		}
		
		
		
		
		
		
		
		
		
		
	}
}
