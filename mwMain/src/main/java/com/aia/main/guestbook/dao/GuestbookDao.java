package com.aia.main.guestbook.dao;

import java.util.List;
import java.util.Map;

import com.aia.main.guestbook.domain.Guestbook;

public interface GuestbookDao {

	// 전체 방명록 게시물 수 
	int selectGuestbookTotalCount(); 
	
	// 전체 게시물 조회
	List<Guestbook> selectAllGuestbook();
	
	// 회원 A의 방명록 게시판 조회 : ownerNo로 조회
	List<Guestbook> selectMemberGuestbook(int ownerNo);

	// 회원 A 방명록 게시판의 게시물 수 
	int selectMemberGuestbookCount(int ownerNo);
	
	// 1개의 게시물에 담긴 정보 조회 
	Guestbook selectGuestbookByGbookNo(int gbookNo);
	
	
	
	// 방명록 등록
	int insertGuestbook(Guestbook guestbook);
	
	// 회원 A의 방명록 게시판의 count 업데이트 
	int memberGbookCountUpdate();
	

	
}
