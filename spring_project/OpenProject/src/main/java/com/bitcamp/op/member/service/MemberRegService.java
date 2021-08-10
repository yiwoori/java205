package com.bitcamp.op.member.service;

import java.io.*;
import java.sql.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.bitcamp.op.jdbc.*;
import com.bitcamp.op.member.dao.*;
import com.bitcamp.op.member.domain.*;

@Service
public class MemberRegService {
	
	final String UPLOAD_URI = "/uploadfile";
	
	@Autowired
	private MemberDao dao;
	
	public int memberReg(
			MemberRegRequest regRequest,
			HttpServletRequest request
			) {
		int resultCnt = 0;
		Connection conn = null;
		File newFile = null;
		
			try {
				
			// 1. 파일 저장
				// 1.1 시스템경로
				String path = request.getSession().getServletContext().getRealPath(UPLOAD_URI);
				// 1.2 새로운 저장 폴더 : File
				File newDir = new File(path);
				
					//(폴더가 존재하지 않으면 폴더 생성)
					if(!newDir.exists()) {
						newDir.mkdir();		//폴더 생성
						System.out.println("저장 폴더 생성");
					}
					//(파일 저장시 파일 이름이 같으면 덮어쓴다 -> 회원별 고유한 파일이름(회원아이디로)을 만들자)
					String newFileName = regRequest.getMemberid()+System.currentTimeMillis();	//cool1232143511389
					//새로운 File 객체
					newFile = new File(newDir, newFileName);
					
				// 1.3 파일 저장
				if(regRequest.getPhoto() != null && !regRequest.getPhoto().isEmpty())
				regRequest.getPhoto().transferTo(newFile);
				
				
				
			// 2. dao 저장
			conn = ConnectionProvider.getConnection();
				// Member 객체 생성 -> 저장된 파일의 이름을 set
				Member member = regRequest.toMemter();
				member.setMemberphoto(newFileName);
			
			resultCnt = dao.insertMember(conn, member);
				
				
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
				
			} catch (SQLException e) {
				//DB 예외 발생시 저장된 파일을 삭제
				if(newFile != null && newFile.exists()) {
					newFile.delete();
				}
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn);
			}

		
		return resultCnt;
	}

}
