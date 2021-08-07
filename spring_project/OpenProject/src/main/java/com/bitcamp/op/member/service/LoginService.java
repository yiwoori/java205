package com.bitcamp.op.member.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.bitcamp.op.member.dao.*;

@Service
public class LoginService {
	
	@Autowired
	MemberDao dao;
	
	
	public void login() {
		dao.login();
	}

}
