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
@Log4j
public class GuestbookListService {

	private GuestbookDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	// 회원 A의 방명록 게시판 조회 
	public List<Guestbook> getMemberGbookList(int memberNo) {
		
		List<Guestbook> list = null;
		
		try {
			dao = template.getMapper(GuestbookDao.class);
			
			list = dao.selectMemberGuestbook(memberNo);
			
			log.info(list);
		
		} catch(Exception e) {
			e.printStackTrace();
		}
			
		return list;
		
	}
	
	// 회원 A의 방명록 게시판의 게시물 수 조회 
	public int getMemberGbookCount(int memberNo) {
		
		int gbookCnt = 0;
		
		try {
			dao = template.getMapper(GuestbookDao.class);
			
			gbookCnt = dao.selectMemberGuestbookCount(memberNo);
			
			log.info(gbookCnt);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return gbookCnt;
	}
	
	
	// 전체 게시물 조회
	public List<Guestbook> getAllGbookList() {
		
		List<Guestbook> list = null;
		
		try {
			dao = template.getMapper(GuestbookDao.class);
			
			list = dao.selectAllGuestbook();
			
			log.info(list);
		
		} catch(Exception e) {
			e.printStackTrace();
		}
			
		return list;
	}
	
	
	
}
