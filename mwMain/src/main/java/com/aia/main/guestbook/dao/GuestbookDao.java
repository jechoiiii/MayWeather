package com.aia.main.guestbook.dao;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.aia.main.guestbook.domain.Guestbook;

public interface GuestbookDao {

	/* ---------- 조회 ---------- */
	
	// 전체 방명록 게시물 수 
	int selectGuestbookTotalCount(); 
	
	// 전체 게시물 조회
	List<Guestbook> selectAllGuestbook();
	
	// 회원 A의 방명록 리스트 조회 : ownerNo로 조회
	List<Guestbook> selectMemberGuestbook(int ownerNo);
	
	
	// 회원 A의 방명록 리스트 조회 (페이징) 
	List<Guestbook> selectMGbListPage(int ownerNo, int startRow, int cntPerPage);
	
	
	// 회원 A 방명록 게시판의 게시물 수 
	int selectMemGbookCount(int gbookNo);
	
	// 1개의 게시물에 담긴 정보 조회 
	Guestbook selectOneGuestbook(int gbookNo);
	
	
	/* ---------- 등록 ---------- */
	
	// 방명록 등록
	int insertGuestbook(Guestbook guestbook);
	
	
	/* ---------- 수정 ---------- */
	
	// 방명록 수정 1 : 내용/비밀여부만 수정
	int updateGuestbookWithoutPhoto(Guestbook guestbook);

	// 방명록 수정 2 : 사진까지 모두 수정
	int updateGuestbookWithPhoto(Guestbook guestbook);
	
	// 방명록 수정 3 : 사진을 null로 수정 & 내용/비밀여부 수정
	int updateGuestbookNullifyOriginalFile(Guestbook guestbook);
	
	// 수정(삭제)할 첨부 파일명 받기 
	String deleteFileName(int gbookNo);
	

	
	
	/* ---------- 삭제 ---------- */
	
	// 방명록 삭제
	int deleteGuestbook(int gbookNo);
	

	
}
