package com.aia.main.guestbook.dao;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.aia.main.guestbook.domain.Guestbook;

public interface GuestbookDao {

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
	Guestbook selectGuestbookByGbookNo(int gbookNo);
	
	
	
	// 방명록 등록
	int insertGuestbook(Guestbook guestbook);
	
	// 회원 A의 방명록 게시판의 count +1
	int memberGbookCountUpdate();
	
	
	
	// 방명록 수정 : 내용/비밀여부
	int updateNoPhotoGuestbook(Guestbook guestbook);
	
	// 방명록 수정 : 사진 
	int updatePhotoGuestbook(Guestbook guestbook);
	
	// 삭제할 첨부 파일명 받기 
	String deleteFileName(int gbookNo);
	

	
}
