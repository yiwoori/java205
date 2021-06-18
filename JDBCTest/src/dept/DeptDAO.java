package dept;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

//정보가 저장된 dept에서 정보 가져와 반환
public class DeptDAO {

	// 1.전체 데이터 검색 기능
	// 반환타입 List<Dept>
	// 매개변수 - Connection 객체 필요 (Statement 만들기 위해 필요)
	ArrayList<Dept> getDeptList(Connection conn) {
		
		ArrayList<Dept> list = null; //반환하기 위한 타입 생성
		
		// 데이터 베이스의 Dept 테이블을 이용해 select 결과를 list에 저장
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
			String sql = "select * from dept order by deptno";
			
			// 결과 받아오기
			rs = stmt.executeQuery(sql);
			
			// 데이터를 Dept 객체로 생성 -> list에 저장
			while(rs.next()) {
				list.add(new Dept(rs.getInt(1), rs.getString(2), rs.getString(3)));
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			if(stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
		}
		
		
		
		
		return list;
		
	}
	
	
	
	
	
	
}
