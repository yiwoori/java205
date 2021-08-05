package com.bitcamp.firstSpring;

import java.io.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.bitcamp.firstSpring.domain.*;

@Controller
public class FileUploadController {		//라이브러리, servlet-context 설정 필수
	
	@Autowired
	private FileUploadService uploadService;
	
	final String UPLOAD_URI = "/uploadfile"; //생성한 webapp/uploadfile

	@RequestMapping("/upload/uploadForm")
	public String getUploadForm() {
		return "upload/uploadForm";
	}
	
	
	
	@RequestMapping(value="/upload/upload1")
	public String upload1(
			
			//파일 한두개 -> @RequestParam
			@RequestParam("sno") String sno,
			@RequestParam("sname") String sname,
			@RequestParam("report") MultipartFile report,
			HttpServletRequest request,
			Model model
			
			) throws IllegalStateException, IOException{
		
		System.out.println("학번 : "+sno);
		System.out.println("이름 : "+sname);
		System.out.println("파일이름 : "+report.getOriginalFilename());
		
		model.addAttribute("sno", sno);
		model.addAttribute("sname", sname);
		model.addAttribute("reportfile", report.getOriginalFilename());
		
		
		saveFile(request, report);
		
		uploadService.fileUpload();
		
		return "upload/upload";
	}
	
	
	
	@RequestMapping("/upload/upload2")
	public String upload2(

			MultipartHttpServletRequest request,
			Model model
			
			) throws IllegalStateException, IOException{
		
		String sno = request.getParameter("sno");
		String sname = request.getParameter("sname");
		MultipartFile report = request.getFile("report");
		
		System.out.println("학번 : "+sno);
		System.out.println("이름 : "+sname);
		System.out.println("파일이름 : "+report.getOriginalFilename());
		
		model.addAttribute("sno", sno);
		model.addAttribute("sname", sname);
		model.addAttribute("reportfile", report.getOriginalFilename());
		
		saveFile(request, report);
		
		return "upload/upload";
	}
	
	
	
	@RequestMapping("/upload/upload3")
	public String upload3(
			
			//많은 파일을 받을 경우
			Report report,
			Model model,
			HttpServletRequest request
			
			) throws IllegalStateException, IOException {
		
		System.out.println("3. 학번 : "+report.getSno());
		System.out.println("3. 이름 : "+report.getSname());
		System.out.println("3. 파일이름 : "+report.getReport().getOriginalFilename());
		
		model.addAttribute("sno", report.getSno());
		model.addAttribute("sname", report.getSname());
		model.addAttribute("reportfile", report.getReport().getOriginalFilename());
		
		saveFile(request, report.getReport());
		
		return "upload/upload";
	}
	
	
	
	//사용자가 업로드한 파일을 저장하는 메소드
	private void saveFile(HttpServletRequest request, MultipartFile file) throws IllegalStateException, IOException {
		
		// 저장 경로 : 시스템 경로
		String saveDir = request.getSession().getServletContext().getRealPath(UPLOAD_URI); //절대경로
				
		//새롭게 저장할 파일
		File newFile = new File(saveDir, file.getOriginalFilename());
				
		//파일 저장
		file.transferTo(newFile);
		
	}
	
}








