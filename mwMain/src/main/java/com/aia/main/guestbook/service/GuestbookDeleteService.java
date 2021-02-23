package com.aia.main.guestbook.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.main.guestbook.dao.GuestbookDao;

@Service
public class GuestbookDeleteService {

	private GuestbookDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int deleteGuestbook(int gbookNo, HttpServletRequest request) {
		
		int result = 0;
		boolean chk = false;		// 삭제 DB 저장 여부
		
		dao = template.getMapper(GuestbookDao.class);
		
		// 삭제하기 전 파일명 받아오기
		String oldFileName = dao.deleteFileName(gbookNo);
		
		try {
			
			result = dao.deleteGuestbook(gbookNo);
			chk = true;
			System.out.println("result: "+result);
			
		} catch(Exception e) {
			e.printStackTrace();
			result = 2;
			System.out.println("result:"+result);
			return result;
		}
		
		// 제대로 삭제 된 후 첨부 사진도 삭제 ! 
		if(chk) {
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
