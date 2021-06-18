package dept;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;

import com.sun.corba.se.spi.orb.StringPair;

public class DeptMain {

	public static void main(String[] args) {
		
		Connection conn = null;
		

		// 1. 드라이버 로드
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			System.out.println("드라이버 로드 성공");

			// 2. 연결
			String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "hr";
			String pw = "tiger";

			conn = DriverManager.getConnection(jdbcUrl, user, pw);
			System.out.println("데이터베이스 연결 성공");

			DeptDAO dao = new DeptDAO();
			
			/* 리스트로 출력하는 방법
			List<Dept> list = dao.getDeptList(conn);
			
			for(Dept dept : list) {
				System.out.println(dept);
			}
			*/
			
			Scanner sc = new Scanner(System.in);
			
			/*
			System.out.println("부서 입력을 시작합니다.");
			System.out.println("부서번호, 부서이름, 부서위치 순으로 입력해주세요");
			System.out.println("ex) 50 dev seoul");
			String deptData = sc.nextLine();
			String[] deptDatas = deptData.split(" "); //데이터 잘라서 받음
			
			// Dept 객체 생성 -> DAO 메소드 호출
			Dept dept = new Dept(Integer.parseInt(deptDatas[0]), deptDatas[1], deptDatas[2]);
			
			int result = dao.insertDept(conn, dept);
			if(result > 0) {
				System.out.println("입력 성공");
			} else {
				System.out.println("입력 실패");
			}
			*/
			
			
			System.out.println("부서 수정을 시작합니다.");
			System.out.println("수정하고자 하는 부서번호, 새 부서이름, 새 부서위치 순으로 입력해주세요");
			System.out.println("ex) 50 dev seoul");
			String deptData = sc.nextLine();
			String[] deptDatas = deptData.split(" "); //데이터 잘라서 받음
			
			// Dept 객체 생성 -> DAO 메소드 호출
			Dept dept = new Dept(Integer.parseInt(deptDatas[0]), deptDatas[1], deptDatas[2]);
			
			int result = dao.editDept(conn, dept);
			if(result > 0) {
				System.out.println("수정 성공");
			} else {
				System.out.println("수정 실패");
			}
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}



	}

}
