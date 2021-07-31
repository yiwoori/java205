package dept.dao;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import dept.domain.Dept;
import jdbc.util.ConnectionProvider;
import jdbc.util.JdbcUtil;

public class DeptDaoTest {
	
	Connection conn;
	DeptDao dao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		System.out.println("테스트 시작");
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		System.out.println("테스트 완료");
		System.out.println();
	}

	@Before
	public void setUp() throws Exception {
		conn = ConnectionProvider.getConnection();
		dao = DeptDao.getInstance();
	}

	@After
	public void tearDown() throws Exception {
	}
	
	
	
	@Test (expected = SQLException.class)
	public void testGetDeptList() throws SQLException {
		
		//list 생성 테스트
		List<Dept> list = dao.getDeptList(conn);
		assertNotNull("list test", list);
		
		// 예외 타입 테스트
		throw new SQLException();
	}
	
	
	
	@Test (expected = SQLException.class)
	public void testInsertDept() throws SQLException {
		
		Dept dept;
		
		// insert 실행 테스트
		int resultCnt = dao.insertDept(conn, new Dept(98, "기획", "제주"));
		assertNotNull("insert test", resultCnt);
		assertSame("insert test2", resultCnt, 1);
		
		// 예외 타입 테스트
		throw new SQLException();
	}

	
	
	@Test (expected = SQLException.class)
	public void testDeleteDept() throws SQLException {
		
		//delete 실행 테스트
		int resultCnt = dao.deleteDept(conn, 200);
		assertSame("delete test", resultCnt, 1);
		
		// 예외 타입 테스트
		throw new SQLException();
	}
	
	
	
	@Test (expected = SQLException.class)
	public void testSelectByDeptno() throws SQLException {
		
		Dept dept;

		//select 실행 테스트
		dept = dao.selectByDeptno(conn, 101);
		assertNotNull("selectByDetpno Test", dept);
		
		// 예외 타입 테스트
		throw new SQLException();
	}
	
	
	
	@Test (expected = SQLException.class)
	public void testUpdateDept() throws SQLException {
		
		Dept dept;
		
		// update 실행 테스트
		int resultCnt = dao.updateDept(conn, new Dept(99, "디자인", "서울"));
		assertSame("update test", resultCnt, 1);
		
		// 예외 타입 테스트
		throw new SQLException();
	}
	
}
