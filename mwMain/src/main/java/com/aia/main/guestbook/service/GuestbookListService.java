package com.aia.main.guestbook.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.main.guestbook.dao.GuestbookDao;
import com.aia.main.guestbook.domain.Guestbook;
import com.aia.main.guestbook.domain.GuestbookListPage;

import lombok.extern.log4j.Log4j;

@Service
//@Log4j
public class GuestbookListService {

	private GuestbookDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	// 추후 코드 수정
	int memberNo = 0010;
	
	// 전체 게시물 조회
	public List<Guestbook> getAllGbookList() {
		
		List<Guestbook> list = null;
		
		try {
		
			// MemberDao 구현체 생성 
			dao = template.getMapper(GuestbookDao.class);
			
			list = dao.selectAllGuestbook();
			
			System.out.println(list);
			//log.info(list);
		
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
}
