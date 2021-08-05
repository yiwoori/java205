package member.service;

import java.util.Date;

import member.domain.Member;
import member.domain.RegRequest;
import member.dao.*;

public class MemberRegService {
	
	//Dao dao = new MemberDao();
	private Dao dao ;
	private int num;
	
	////////////////////////////////////////
	
	//프로퍼티 주입 방식 : setter 메소드를 이용 (기본 생성자가 필요)
	public void setDao(Dao dao) {	
		this.dao = dao;
	}
	
	
	//생성자 정의
	//정수형 데이터를 받는 생성자
	public MemberRegService() {
		System.out.println("ChangePasswordService()");
	}
	
	
	//생성자 주입 방식1 : 정수 데이터를 받는 생성자(잘 사용 x)
	public MemberRegService(int num) {	
		//this.dao = dao;
		System.out.println("MemberRegService 인스턴스 생성");
	}
	
	//생성자 주입 방식2 : 참조형
	public MemberRegService(Dao dao) {	
		this.dao = dao;
		System.out.println("MemberRegService 인스턴스 생성");
	}
	
	//생성자 주입 방식3 : 둘다 사용
	public MemberRegService(Dao dao, int num) {	
		this.dao = dao;
		this.num = num;
		System.out.println("MemberRegService 인스턴스 생성");
	}
	
	////////////////////////////////////////
	
	public void regMember(RegRequest request) throws Exception {
		
		// 중복 이메일 체크
		Member member = dao.selectByEmail(request.getEmail());
		
		if(member != null) {
			throw new Exception("중복 이메일 !!");
		}
		
		
		Member newMember = new Member(
				0, 
				request.getEmail(), 
				request.getPassword(), 
				request.getName(), 
				new Date());
		
		dao.insert(newMember);
	}

}