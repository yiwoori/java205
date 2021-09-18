package com.bitcamp.app;

import java.sql.*;

import javax.sql.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.*;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class DemoApplicationTests {
	
	@Autowired
	private DataSource dataSource;
	private Connection conn;

	@Test
	void contextLoads() {
	}
	
	@Test
	public void testConnection() throws SQLException {
		System.out.println("datasource : " + dataSource);
		
		conn = dataSource.getConnection();
		System.out.println("connection : " + conn);
		conn.close();
	}

}
