package com.bitcamp.orl.member.service;

import com.bitcamp.orl.member.dao.Dao;
import com.bitcamp.orl.member.domain.Member;
import com.bitcamp.orl.member.domain.MemberEditRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

@Service
public class MypageService {
   final String PROFILE_URI ="/images/member/profile";

   private Dao dao;
   
   @Autowired
   private SqlSessionTemplate template;

   public Member getMemberSelectByIdx(int memberIdx){

      Member member = null;
      dao = template.getMapper(Dao.class);

      member = dao.selectByIdx(memberIdx);

      return member;
   }

   public int editMember(
         HttpServletRequest request,
         Member member,
         MemberEditRequest memberEditRequest) {

      File newFile = null;
      int resultCnt = 0;

      try {
         Member editMember = member;

         if (memberEditRequest.getMemberPhoto() != null && !memberEditRequest.getMemberPhoto().isEmpty()) {
            newFile = saveProfileFile(request,memberEditRequest.getMemberPhoto());
            editMember.setMemberProfile(newFile.getName());
         }
         editMember.setMemberName(memberEditRequest.getMemberName());
         editMember.setMemberEmail(memberEditRequest.getMemberEmail());
         editMember.setMemberNickname(memberEditRequest.getMemberNickname());
         editMember.setMemberBirth(memberEditRequest.getBirth());

         dao = template.getMapper(Dao.class);
         resultCnt = dao.updateMember(member);

      } catch (IllegalStateException e) {
         e.printStackTrace();
      } catch (Exception e) {
         e.printStackTrace();
         if(newFile != null & newFile.exists()) {
            newFile.delete();
            System.out.println("?????? ??????");
         }
      }
      return resultCnt;
   }

   public int editPw(String oldPw,String newPw,String newPw2,Member member) {
	   int resultCnt = 0;
	   
	   if( member.getMemberPw().equals(oldPw)) {
		   
		   if(newPw.equals(newPw2)) {
			   member.setMemberPw(newPw);
			   dao=template.getMapper(Dao.class);
			   resultCnt=dao.updateMember(member);
		   }
	   }
	   
	   
	   return resultCnt;
   }
   
   
   
   public File saveProfileFile(
         HttpServletRequest request,
         MultipartFile file) {

      String path = request.getSession().getServletContext().getRealPath(PROFILE_URI);
      File newDir = new File(path);

      if(!newDir.exists()) {
         newDir.mkdir();
         System.out.println("?????? ????????? ??????????????????.");
      }

      String newFileName = System.currentTimeMillis() + file.getOriginalFilename();
      File newFile = new File(newDir, newFileName);

      try {
         file.transferTo(newFile);
      } catch (IllegalStateException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
      return newFile;
   }
   
   
   
   
}