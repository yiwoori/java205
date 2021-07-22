package ncs.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jdbc.util.JdbcUtil;
import ncs.jdbc.Member;

public class MemberDao {

	private MemberDao(){}
	private static MemberDao dao = new MemberDao();
	public static MemberDao getInstance() {
		return dao==null? new MemberDao():dao;
	}
	
	
	public List<Member> getMemberList(Connection conn) {
		
		Statement stmt = null;
		ResultSet rs = null;
		
		List<Member> list = null;
		
		try {
			
			stmt = conn.createStatement();
			String sql = "select * from member";
			rs = stmt.executeQuery(sql);
			list = new ArrayList<Member>();
			
			while(rs.next()) {
				list.add(makeMember(rs));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}

		return list;
		
	}
	
	
	
	public int insertMember(Connection conn, Member member) {
		
		int resultCnt = 0;
		PreparedStatement pstmt = null;
		String sql = "insert into member values (default, ?, ?, ?, ?)";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setTimestamp(4, member.getDate());
			
			resultCnt = pstmt.executeUpdate(); //결과 가져오기
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
		}
		
		return resultCnt;
		
	}
	
	
	
	public int deleteMember(Connection conn, int idx) {
		
		int resultCnt = 0;
		PreparedStatement pstmt = null;
		
		String sql = "delete from member where idx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			resultCnt = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
		}
		
		return resultCnt;
		
	}
	
	
	
	public Member selectByIdx(Connection conn, int idx) {
		
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from member where idx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = makeMember(rs);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return member;
		
	}
	
	
	
	public int updateMember(Connection conn, Member member) {
		
		int resultCnt = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "update member set id=?, pw=?, name=? where idx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setInt(4, member.getIdx());
			
			resultCnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
		}
		
		return resultCnt;
		
	}
	
	
	
	private Member makeMember(ResultSet rs) throws SQLException {
		
		Member member = new Member();
		member.setIdx(rs.getInt("idx"));
		member.setId(rs.getString("id"));
		member.setPw(rs.getString("pw"));
		member.setName(rs.getString("name"));
		member.setDate(rs.getTimestamp("date"));
		
		return member;
		
	}
	
}
