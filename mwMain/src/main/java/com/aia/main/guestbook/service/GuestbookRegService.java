package com.aia.main.guestbook.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aia.main.guestbook.dao.GuestbookDao;
import com.aia.main.guestbook.domain.Guestbook;
import com.aia.main.guestbook.domain.GuestbookListPage;
import com.aia.main.guestbook.domain.GuestbookRegRequest;

import lombok.extern.log4j.Log4j;

@Service
public class GuestbookRegService {

	private GuestbookDao dao;
	
	@Autowired
	private SqlSessionTemplate template;

	
	// 게시물 등록 : 파일 업로드, DB 저장
	@Transactional
	public int insertGbookRegRequest(GuestbookRegRequest gbRegReq, HttpServletRequest request) {
		
		int result = 0;
		
		String newFileName = null;
		File newFile = null;	
		
		
		if(gbRegReq.getGbContentPhoto() != null && !gbRegReq.getGbContentPhoto().isEmpty()) {
			
			// 웹 경로 
			String uploadPath = "/fileupload/guestbook";
			// 시스템의 실제 경로 
			String saveDirPath = request.getSession().getServletContext().getRealPath(uploadPath);
			// 새로운 파일 이름 
			newFileName = (String)request.getSession().getAttribute("ownidx") + "_"
						+ (String)request.getSession().getAttribute("memidx") + "_" 
						+ String.valueOf(System.nanoTime());
			
			System.out.println("파일이름: " + newFileName);
			
			// 파일 저장 
			try {
				newFile = new File(saveDirPath, newFileName);
				gbRegReq.getGbContentPhoto().transferTo(newFile);
				
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			} 
			
		}
		
	
		try {
			
			// test : request의 session에서 가져오기 
			int writerNo = Integer.valueOf((String)request.getSession().getAttribute("memidx"));
			String writerName = (String) request.getSession().getAttribute("memnic");
			String writerPhoto = (String)request.getSession().getAttribute("memphoto");
			String writerLoc = (String)request.getSession().getAttribute("memloc");
			
			// GuestbookRegRequest에 test 값 넣기
			gbRegReq.setGbWriterNo(writerNo);
			gbRegReq.setGbWriterName(writerName);
			gbRegReq.setGbWriterPhoto(writerPhoto);
			gbRegReq.setGbWriterLoc(writerLoc);

			// GuestbookRegRequest -> Guestbook으로 형변환
			Guestbook guestbook = gbRegReq.toGuestbook();
			System.out.println("게스트북 toString : " + gbRegReq.toString());
			
			if(newFileName != null) {
				guestbook.setContentPhoto(newFileName);
			}
			
			// DB 입력
			dao = template.getMapper(GuestbookDao.class);
			
			// 방명록 게시판의 게시물 수 업데이트 
			//dao.memberGbookCountUpdate();
			
			// 게스트북 DB insert
			result = dao.insertGuestbook(guestbook);
			
			System.out.println("result : " +result);
		
		
		} catch(Exception e) {
			// 현재 저장한 파일이 있는 경우 -> 삭제 
			if(newFile != null && newFile.exists()) {
				newFile.delete();
			}
			e.printStackTrace();
		}
			
		return result;
		
	}

	

}
