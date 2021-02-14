package com.ds.controller;

import java.io.*;
import java.util.*;

import javax.annotation.*;

import org.apache.commons.io.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.util.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.ds.util.*;

@Controller
public class UploadController {
	
	@Resource(name = "uploadPath")
	private String uploadPath;

	
	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
	public String uploadForm(MultipartFile file, Model model) 
			throws Exception {
//		System.out.println("originalName:" + file.getOriginalFilename());
//		System.out.println("size:" + file.getSize());
//		System.out.println("contentType:" + file.getContentType());
		
		String savedName = uploadFile(
				file.getOriginalFilename(), file.getBytes());
		model.addAttribute("savedName", savedName);
		
		return "uploadResult";
	}
	
	private String uploadFile(String originalName, byte[] fileData) 
			throws Exception {
		UUID uuid = UUID.randomUUID();
		String savedName = uuid.toString() + "_" + originalName;
		
		File target  = new File(uploadPath, savedName);
		
		// 스프링이 제공하는 파일 복사 유틸 클래스
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.GET)
	public void uploadAjax() {
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST,
			produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		
		String uploadedFileName = UploadFileUtils.uploadFile(
				uploadPath, file.getOriginalFilename(), file.getBytes());
		
		return new ResponseEntity<String>(
				uploadedFileName, HttpStatus.CREATED);
	}
	
	@ResponseBody
	@RequestMapping(value = "/displayFile", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		
		try {
			String formatName = fileName.substring(
					fileName.indexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			
			in = new FileInputStream(uploadPath + fileName);
			// 파일이 이미지인 경우 - 브라우저에 보일 수 있도록 설정
			if (mType != null) {
				headers.setContentType(mType);
			}
			// 파일이 이미지가 아닌 경우 브라우저가 다운로드 받도록 설정 
			else {
				fileName = fileName.substring(fileName.lastIndexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				// 헤더에 첨부 파일 정보 추가
				// 한글 파일 처리
				headers.add("Content-Disposition", 
						"attatment; filename=\"" + 
								new String(fileName.getBytes("utf-8"), "ISO-8859-1")
								+ "\"");
			}
			
			// org.apache.commons.io.IOUtils
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
					headers,
					HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		
		return entity;
	}
	
	@RequestMapping(value="/deleteFile", method= RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {
		
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if (mType != null) {

			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			
			File orgImage = new File(uploadPath + File.separator
					+(front + end).replace('/', File.separatorChar));
			if (orgImage.exists()) {
				orgImage.delete();
			}
			
			}
		
		File target = new File(uploadPath + File.separatorChar
				+ File.separator 
				+ fileName.replace('/', File.separatorChar));
		if(target.exists()) {
			target.delete();
		}
		return new ResponseEntity<String>("DELETED", HttpStatus.OK);
	}
}
