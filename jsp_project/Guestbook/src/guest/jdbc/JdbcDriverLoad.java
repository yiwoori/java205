package guest.jdbc;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class JdbcDriverLoad extends HttpServlet {

	@Override
	public void init(ServletConfig config) throws ServletException {
		
		String jdbcDriver = config.getInitParameter("jdbcdriver"); //web.xml
		
		try {
			jdbcDriver = jdbcDriver == null ? "com.mysql.cj.jdbc.Driver" : jdbcDriver;
			Class.forName(jdbcDriver);
			System.out.println("mysql Driver load");
			
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
			throw new RuntimeException(e); //오류시 서버 실행x
			
		}
		
	}
	
	
	
}
