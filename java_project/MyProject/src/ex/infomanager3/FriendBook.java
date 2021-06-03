package ex.infomanager3;

import java.util.Scanner;

public class FriendBook {

	public static void main(String[] args) {
		
		//Friend friend = new Friend("","","");
		
		FriendInfoHandler handler = new FriendInfoHandler(100);

		Scanner s = new Scanner(System.in);

		while (true) {

			System.out.println("** 메뉴 선택 ******************");
			System.out.println(Menu.HIGH_FRI+". 고교 친구 정보 입력");
			System.out.println(Menu.UNIV_FRI+". 대학 친구 정보 입력");
			System.out.println(Menu.SHOW_ALL+". 전체 정보 출력");
			System.out.println(Menu.SHOW_BASIC+". 기본 정보 출력");
			System.out.println(Menu.EXIT+". 프로그램 종료");
			System.out.println("*****************************");

			System.out.println("메뉴를 선택하세요 >> ");			
			int choice = Integer.parseInt(s.nextLine()) ;

			switch (choice) {
			case /*1:*/ Menu.HIGH_FRI :
			case /*2:*/ Menu.UNIV_FRI :
				handler.addFriend(choice);
				break;
			case /*3:*/ Menu.SHOW_ALL :
				handler.showAllData();
				break;
			case /*4:*/ Menu.SHOW_BASIC :
				handler.showAllBasicData();
				break;
			case /*5:*/ Menu.EXIT:
				System.out.println("프로그램을 종료합니다.");
				return;

			}
		}

	}

}

interface Menu {
	/*public static final*/ int HIGH_FRI = 1;
	int UNIV_FRI = 2;
	int SHOW_ALL = 3;
	int SHOW_BASIC = 4;
	int EXIT = 5;
}