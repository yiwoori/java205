package com.bitcamp.orl.feed.service;

import java.io.*;

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

	FeedDao dao;

	@Autowired
	private SqlSessionTemplate template;

	// 파일 저장 경로
	final String UPLOAD_URI = "/images/feed/feedw/uploadfile";

	// 피드 작성
	public int insert(FeedCreateRequest createRequest, HttpServletRequest request) {

		int result = 0;
		File newFile = null;

		try {
			// 1. 파일 저장
			Feed feed = createRequest.toFeed();

			if (createRequest.getBoardPhoto() != null && !createRequest.getBoardPhoto().isEmpty()) {
				
				// 파일 저장 메소드
				newFile = saveFile(request, createRequest.getBoardPhoto());
				feed.setBoardPhoto(newFile.getName());
				
			}

			MemberDto memberVo = (MemberDto) (request.getSession().getAttribute("memberVo"));

			if (memberVo != null) {
				feed.setMemberIdx(memberVo.getMemberIdx());	//memberIdx 넣기
			}

			// 2. dao 저장
			dao = template.getMapper(FeedDao.class);
			result = dao.createFeed(feed);

		} catch (Exception e) {
			e.printStackTrace();
			// DB 예외 발생 시 저장된 파일 삭제
			if (newFile != null && newFile.exists()) {
				newFile.delete();
				System.out.println("예외발생 - 파일 삭제");
			}
		}
		return result;
	}

	// 업로드 파일 저장
	private File saveFile(HttpServletRequest request, MultipartFile file) {

		// 저장경로 : 시스템 경로
		String saveDir = request.getSession().getServletContext().getRealPath(UPLOAD_URI);
		File newDir = new File(saveDir);

		// 폴더 없으면 생성
		if (!newDir.exists()) {
			newDir.mkdir();
		}

		// 파일 이름
		String newFileName = System.currentTimeMillis() + file.getOriginalFilename();

		// 새롭게 저장할 파일
		File newFile = new File(saveDir, newFileName); // 예외처리 필요

		try {
			// 파일 저장
			file.transferTo(newFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return newFile;
	}

}
