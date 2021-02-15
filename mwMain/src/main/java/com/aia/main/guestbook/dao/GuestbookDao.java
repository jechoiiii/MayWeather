package com.aia.main.guestbook.dao;

import java.util.List;
import java.util.Map;

import com.aia.main.guestbook.domain.Guestbook;

public interface GuestbookDao {

	// 전체 방명록 게시물 수 
	int selectTotalCount(); 
	
	// 전체 게시물 조회
	List<Guestbook> selectAllGuestbook();
	
	// 회원 A의 방명록 게시판 조회 : memberNo로 조회
	List<Guestbook> selectGuestbookByMemberNo(int memberNo);

	// 회원 A 방명록 게시판의 게시물 수 
	int selectTotalCntByMemberNo(int memberNo);
	
	// 1개의 게시물에 담긴 정보 조회 
	Guestbook selectGuestbookByGbookNo(int gbookNo);
	
	

	
}
