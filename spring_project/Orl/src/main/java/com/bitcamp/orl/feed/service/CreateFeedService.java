package com.bitcamp.orl.feed.service;

import java.io.*;
import java.sql.*;

import javax.servlet.http.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

import com.bitcamp.orl.feed.dao.*;
import com.bitcamp.orl.feed.domain.*;
import com.bitcamp.orl.member.domain.*;

@Service
public class CreateFeedService { 
	
	Dao dao;
	
	@Autowired
	private SqlSessionTemplate template;	
	
	final String UPLOAD_URI = "/images/feed/feedw/uploadfile";
	
	
	
	//피드 게시
	public int createFeed(FeedCreateRequest createRequest,
						HttpServletRequest request) {
		
		int result = 0;
		
		File newFile = null;
		
		try {
			
			// 1. 파일 저장
			// feed 객체 생성 -> 저장된 파일의 이름을 set
			Feed feed = createRequest.toFeed();

			if (createRequest.getBoardPhoto() != null && !createRequest.getBoardPhoto().isEmpty()) {

				// 파일 저장
				newFile = saveFile(request, createRequest.getBoardPhoto());
				feed.setBoardPhoto(newFile.getName());
				
			}
			
			Member member = (Member)(request.getSession().getAttribute("member"));	//세션에서 member 객체 가져옴
			feed.setMemberIdx(member.getMemberIdx());

			// 2. dao 저장
			dao = template.getMapper(Dao.class);
			result = dao.createFeed(feed);

			System.out.println("새롭게 등록된 idx => " + feed.getBoardIdx());
			// idx 값은 자식 테이블의 insert 시 외래키로 사용

		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			// DB 예외 발생 시 저장된 파일 삭제
			if (newFile != null && newFile.exists()) {
				newFile.delete();
			}
		}

		return result;
		
	}
	
	
	
	// 업로드 파일 저장 메소드
	private File saveFile(HttpServletRequest request, MultipartFile file) throws IllegalStateException, IOException {

		// 저장경로 : 시스템 경로
		String saveDir = request.getSession().getServletContext().getRealPath(UPLOAD_URI);
		File newDir = new File(saveDir);
		
		// 폴더 없으면 생성
		if(!newDir.exists()) {
			newDir.mkdir();
			System.out.println("폴더 생성");
		}
		
		// 파일 이름
		String newFileName = System.currentTimeMillis()+file.getOriginalFilename();
		
		// 새롭게 저장할 파일
		File newFile = new File(saveDir, newFileName); // 예외처리

		// 파일 저장
		file.transferTo(newFile); // 예외처리
		
		return newFile;
		
	}
	
	

}
