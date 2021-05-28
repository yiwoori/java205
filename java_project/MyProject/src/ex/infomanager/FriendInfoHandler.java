package ex.infomanager;

import java.util.Scanner;

public class FriendInfoHandler {

	//저장 데이터(객체)를 배열로 저장하고 관리하는 기능을 가지는 클래스
	
	Friend[] friends;
	int numOfFriend;	//배열의 입력 index 역할, 정보의 개수
	
	public FriendInfoHandler(int num) {	// num : 배열의 사이즈 -> 배열 인스턴스 생성
		this.friends = new Friend[num];
		this.numOfFriend = 0;
	}
	
	//데이터의 입력 처리
	//사용자로부터 친구의 정보를 입력 받아서 -> 인스턴스 생성 -> 배열에 저장
	public void addFriend(int choice) { //choice : 1(고교) or 2(대학)
		
		Scanner s = new Scanner(System.in);
		
		System.out.print("이름 입력 : ");
		String name = s.nextLine();
		System.out.print("전화번호 입력 : ");
		String phoneNumber = s.nextLine();
		System.out.print("주소 입력 : ");
		String address = s.nextLine();
		
		if(choice==1) { //고교친구
			System.out.println("직업 입력 : ");
			String work = s.nextLine();
			
			//인스턴스 생성
			HighFriend hFriend = new HighFriend(name, phoneNumber, address, work);
			friends[numOfFriend] = hFriend;
			numOfFriend++;
		} else { //대학친구
			System.out.println("전공 입력 : ");
			String major = s.nextLine();
			
			//인스턴스 생성
			UnivFriend uFriend = new UnivFriend(name, phoneNumber, address, major);
			
			//배열에 요소 추가
			friends[numOfFriend] = uFriend;
			numOfFriend++;
		}
		
		
		
		
		
		
		
		
		
	}
	
	
	
	
	
	
}
