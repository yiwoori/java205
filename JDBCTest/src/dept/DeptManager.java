package dept;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;

public class DeptManager {

	private DeptDao dao;
	private Scanner sc;
	
	public DeptManager(DeptDao dao) {
		this.dao = dao;
		sc = new Scanner(System.in);
	}
	
	// 전체 리스트 출력 메소드
	// DAO에서 데이터 리스트를 받고 출력 처리
	void deptList() {
		
		// connection 객체 생성 -> 트랜젝션 처리
		Connection conn = null;
		
		// 2. 연결
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pw = "tiger";

		try {
			conn = DriverManager.getConnection(jdbcUrl, user, pw);
			
			List<Dept> list = dao.getDeptList(conn);
			
			System.out.println("부서 정보 리스트");
			System.out.println("=================================================");
			System.out.println("부서번호 \t 부서이름 \t 부서위치");
			System.out.println("=================================================");
			
			for(Dept dept : list) {
				System.out.printf("%d \t %s \t %s \n",
						dept.getDeptno(),
						dept.getDname(),
						dept.getLoc());
			}
			System.out.println("=================================================");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	// 데이터 입력
	// 사용자에게 scanner 클래스로 입력 받아 -> DAO insertDept 메서드로 저장
	void inputData() {
		
		// connection 객체 생성 -> 트랜젝션 처리
		Connection conn = null;
		
		// 2. 연결
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pw = "tiger";
		
		try {
			conn = DriverManager.getConnection(jdbcUrl, user, pw);
			
			System.out.println("부서 정보를 입력합니다.");
			System.out.println("부서이름 부서위치 형식으로 입력해주세요.");
			System.out.println("ex) dev seoul");
			String inputData = sc.nextLine();
			String[] deptdata = inputData.split(" ");
			
			Dept dept = new Dept(0, deptdata[0], deptdata[1]);
			
			int result = dao.insertDept(conn, dept);
			
			if(result > 0) {
				System.out.println("입력되었습니다.");
			} else {
				System.out.println("입력 실패");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	// 데이터 수정
	// 사용자로부터 데이터를 받아 수정 -> dao editDept() 메소드 이용
	void editDept() {
		
		// connection 객체 생성 -> 트랜젝션 처리
		Connection conn = null;
		
		// 2. 연결
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pw = "tiger";
		
		try {
			conn = DriverManager.getConnection(jdbcUrl, user, pw);
			
			System.out.println("부서 번호를 수정합니다.");
			System.out.println("부서번호 부서이름 부서위치 형식으로 입력해주세요");
			System.out.println("입력된 부서번호의 부서 이름과 부서 위치가 수정됩니다."); //부서번호=pk=변경x
			String editData = sc.nextLine();
			String[] eData = editData.split(" ");
			
			Dept dept = new Dept(Integer.parseInt(eData[0]), eData[1], eData[2]);
			
			int result = dao.editDept(conn, dept);
			
			if(result > 0) {
				System.out.println("수정되었습니다.");
			} else {
				System.out.println("수정 실패");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	// 데이터 삭제
	// 사용자로부터 부서번호를 입력받아 부서정보 삭제
	void deleteDept() {

		// connection 객체 생성 -> 트랜젝션 처리
		Connection conn = null;
		
		// 2. 연결
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pw = "tiger";
		
		try {
			conn = DriverManager.getConnection(jdbcUrl, user, pw);
			
			deptList();
			System.out.println("삭제를 원하는 부서 번호를 입력해주세요.");
			int deptno = Integer.parseInt(sc.nextLine());
			
			int result = dao.deleteDept(conn, deptno);
			
			if(result > 0) {
				System.out.println("삭제 되었습니다.");
			} else {
				System.out.println("삭제 실패 : 해당 부서의 정보가 없습니다.");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
