package com.bitcamp.firstSpring.dao;

import org.springframework.stereotype.Repository;

@Repository		//설정파일 자동 등록 (<->servlet-context에 beans 등록 필요)	
public class FileUploadDao implements Dao {

	@Override
	public void insert() {
		System.out.println("파일 정보를 저장합니다.");
		
	}

}
