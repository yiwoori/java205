package dept;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

public class DeptManager {

	private DeptDAO dao;
	
	public DeptManager(DeptDAO dao) {
		this.dao = dao;
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

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	// 데이터 입력
	
	// 데이터 수정
	
	// 데이터 삭제
	
	
	
	
	
	
}
