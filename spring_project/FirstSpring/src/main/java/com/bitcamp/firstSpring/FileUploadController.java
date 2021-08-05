package com.bitcamp.firstSpring;

import java.io.*;

import javax.servlet.http.*;

import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

@Controller
public class FileUploadController {
	
	final String UPLOAD_URI = "/uploadfile"; //생성한 webapp/uploadfile
	
	@RequestMapping("/upload/uploadForm")
	public String getUploadForm() {
		return "upload/uploadForm";
	}
	
	@RequestMapping(value="/upload/upload1")
	public String upload(
			
			@RequestParam("sno") String sno,
			@RequestParam("sname") String sname,
			@RequestParam("report") MultipartFile report,
			Model model,
			HttpServletRequest request
			
			) throws IllegalStateException, IOException {
		
		System.out.println("학번 : "+sno);
		System.out.println("이름 : "+sname);
		System.out.println("파일이름 : "+report.getOriginalFilename());
		
		model.addAttribute("sno", sno);
		model.addAttribute("sname", sname);
		model.addAttribute("reportfile", report.getOriginalFilename());
		
		// 저장 경로 : 시스템 경로
		String saveDir = request.getSession().getServletContext().getRealPath(UPLOAD_URI); //절대경로
		
		//새롭게 저장할 파일
		File newFile = new File(saveDir, report.getOriginalFilename());
		
		report.transferTo(newFile);
		
		return "upload/upload";
	}

}
