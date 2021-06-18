package JDBC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;


public class JDBCTestDeptDML {
	public static void main(String[] args) {

		// 연결 객체 : 연결 정보를 가진다
		Connection conn = null;
		// sql을 실행할 메소드 제공
		Statement stmt = null;
		// executeQuery() 반환타입 -> select의 결과(표)를 담는 객체
		ResultSet rs = null;
		//Statement -> PreparedStatement : 성능개선
		PreparedStatement pstmt = null;
		
		Scanner sc = new Scanner(System.in);
		

		
		try {
			
			// 1. 드라이버 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 로드 성공!");
		
			
			
			
			
			// 2. 연결
			String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "hr";
			String pw = "tiger";
			
			conn = DriverManager.getConnection(jdbcUrl, user, pw);
			System.out.println("데이터베이스 연결 성공!");
			
			//트랜젝션 설정
			conn.setAutoCommit(false); //false -> 아래 conn.commit(); 전까지 물리적 저장x
			
			//입력
			System.out.println("부서정보 입력을 시작합니다.");
			System.out.println("부서 이름을 입력해주세요 : ");
			String dname = sc.nextLine();
			System.out.println("부서 위치를 입력해주세요 : ");
			String loc = sc.nextLine();
			

			// 3. sql 처리
			// 사용자에게 정보를 받아 부서 데이터를 입력하는 프로그램 만들기
			// prepareStatement -> 물음표
			
			//입력
			String sql = "insert into dept01 values (dept01_deptno_seq.nextval, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dname);
			pstmt.setString(2, loc);
			
			int result = pstmt.executeUpdate();
			
			if(result > 0) {
				System.out.println("입력되었습니다.");
			} else {
				System.out.println("입력 실패");
			}
			
			
			
			
			
			// 트랜젝션 완료(성공)
			conn.commit();
			
			
			
			
		} catch (ClassNotFoundException e) {
			
			System.out.println("드라이버 클래스를 찾지 못함!");
			e.printStackTrace();
			
		} catch (SQLException e) {
			//System.out.println("데이터베이스 연결 실패!");
			
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			
			e.printStackTrace();
		} finally {
			
			// 4. close
			
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			
			
			if(stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			
			
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

				

	}

}
