package com.aia.main.guestbook.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.main.guestbook.dao.GuestbookDao;
import com.aia.main.guestbook.domain.Guestbook;
import com.aia.main.guestbook.domain.GuestbookListPage;
import com.aia.main.guestbook.domain.SearchParam;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class GuestbookListService {

	private GuestbookDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	// 회원 A의 방명록 게시판 조회 (페이징 X)
	public GuestbookListPage getListPage(int ownerNo, int pageNum) {
		
		System.out.println("ownerNo: "+ownerNo);
		System.out.println("pageNum:" +pageNum);
		
		GuestbookListPage listPage = null;

		try {
			
			// MemberDao 구현채 생성
			dao = template.getMapper(GuestbookDao.class);
			
			int cntPerPage = 10;
			
			int startRow = (pageNum-1)*cntPerPage;
			int endRow = startRow+cntPerPage-1;
			
			int totalGBCnt = dao.selectMemGbookCount(ownerNo);	
			System.out.println("totalGBCnt:"+totalGBCnt);
						
			List<Guestbook> guestbookList = dao.selectMGbListPage(ownerNo, startRow, cntPerPage);
			System.out.println(guestbookList);
		
			listPage = new GuestbookListPage(pageNum, totalGBCnt, cntPerPage, guestbookList, startRow, endRow);
			System.out.println("리스트페이지 : "+listPage);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listPage;
	}
	
	
	
	// 게시물 1개 조회
	public Guestbook getGuestbookInfo(int gbookNo) {
		
		Guestbook gbinfo = null;
		
		try {
			dao = template.getMapper(GuestbookDao.class);
			gbinfo = dao.selectOneGuestbook(gbookNo);
			
			log.info(gbinfo);
			System.out.println("게스트북 정보 : "+ gbinfo);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return gbinfo;
	}

	
	
	// 회원 A의 방명록 게시판 조회 (페이징 X)
	public List<Guestbook> getMemberGbookList(int ownerNo) {
		
		List<Guestbook> list = null;
		int gbookCnt = 0;
		
		try {
			dao = template.getMapper(GuestbookDao.class);
			list = dao.selectMemberGuestbook(ownerNo);
			System.out.println("리스트 : "+ list);
	
//			gbookCnt = dao.selectMemberGuestbookCount(ownerNo);
//			list.get(gbookCnt).setGbookCnt(gbookCnt);
//			
//			List<Guestbook> list2 = null;
//			list2.get(gbookCnt).setGbookCnt(gbookCnt);
//		
//
//			System.out.println(" 방명록 수 : " + list.get(gbookCnt));
//			System.out.println("리스트1 : "+ list);
//			System.out.println("리스트2 : "+ list2);
			
			
			log.info(list);
			System.out.println("리스트 타입 : "+ list.getClass().getName());

		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
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
