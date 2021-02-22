package com.aia.main.guestbook.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aia.main.guestbook.dao.GuestbookDao;
import com.aia.main.guestbook.domain.Guestbook;
import com.aia.main.guestbook.domain.GuestbookRegRequest;
import com.aia.main.guestbook.domain.GuestbookUpdateRequest;

@Service
public class GuestbookUpdateService {
		// 방명록 수정과 관련된 서비스

	private GuestbookDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	File newFile = null;
	String newGbFileName = null;
	
	int result = 0;
	boolean chk = false; 	// 수정전 사진 삭제 여부
	
	
	// 게시물 수정 : 파일 삭제, 파일 업로드, DB 저장 
	@Transactional
	public int updateGuestbook(int gbookNo, GuestbookUpdateRequest updateRequest, HttpServletRequest request) {
		
		// 방명록 내용, 사진, 비밀글 여부가 수정이 가능하다. 
		// 글 내용은 기본 입력 사항이 있어 무조건 받아줘야 한다. 
		
		
		dao = template.getMapper(GuestbookDao.class);
		// 삭제하기 전 파일명 받아오기 
		String oldFileName = dao.deleteFileName(gbookNo);
		
		// 내용 없으면 2 반환 
		if (updateRequest.getGbContent().trim().isEmpty()) {
			result = 2;
			return result;
		}
		
		// 사진이 정상적인 파일인지 확인 [1 -> 사진있을 경우 저장방식]
		if(updateRequest.getGbContentPhoto() != null && !updateRequest.getGbContentPhoto().isEmpty()) {
			
			// 웹 경로 
			String uploadPath = "/fileupload/guestbook";
			// 시스템의 실제 경로 
			String dirPath = request.getSession().getServletContext().getRealPath(uploadPath);
			
			// 새로은 파일 이름 생성 
			newGbFileName = (String)request.getSession().getAttribute("memidx") + "_" + String.valueOf(System.nanoTime());
			
			// 파일 저장
			try {
				newFile = new File(dirPath, newGbFileName);
				updateRequest.getGbContentPhoto().transferTo(newFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			// DB에 저장하기 
			try {
				// GuestbookUpdateRequest -> Guestbook으로 형변환 
				Guestbook guestbook = updateRequest.toGuestbook();
				System.out.println("게스트북 update toString : " + updateRequest.toString());
				
				if(newGbFileName != null) {
					guestbook.setContentPhoto(newGbFileName);
				}
				
				// 방명록 내용, 첨부 사진, 비밀글 여부 새로저장
				result = dao.updatePhotoGuestbook(guestbook);
				chk = true;
				
			} catch (Exception e) {
				e.printStackTrace();
				// DB 업데이트 문제 시, 저장된 파일 삭제 
				if(newFile != null && newFile.exists()) {
					newFile.delete();
				}
			}
			
			
		// 사진이 없는 경우 내용/비밀여부 만 저장
		} else {
			Guestbook guestbook = updateRequest.toGuestbook();
			result = dao.updateNoPhotoGuestbook(guestbook);
			
		}
		
		
		
		// 입력이 제대로 된 후 원래 있던 사진을 삭제 ! 
		if (chk) {
			
			String uploadPath = "/fileupload/guestbook";
			String dirPath = request.getSession().getServletContext().getRealPath(uploadPath);
			
			if(oldFileName != null) {
				File file = new File(dirPath, oldFileName);
				// 사진 삭제
				if(file.delete()) {
					System.out.println("파일 삭제 성공");
				} else {
					System.out.println("파일 삭제 실패");
				}
			} else {
				System.out.println("파일이 존재하지 않습니다.");
			}
			
			
		}
		
		
		return result;
		
	}
	
	
}
