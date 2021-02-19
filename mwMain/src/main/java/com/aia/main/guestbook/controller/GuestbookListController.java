package com.aia.main.guestbook.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.aia.main.guestbook.domain.Guestbook;
import com.aia.main.guestbook.domain.GuestbookListPage;
import com.aia.main.guestbook.service.GuestbookListService;

@RestController
@RequestMapping("/guestbook")
public class GuestbookListController {
	
	@Autowired
	private GuestbookListService listService;

	
	
	// 전체 리스트 조회 
	@GetMapping("/list")	// /main/guestbook/list
	@CrossOrigin
	public List<Guestbook> guestbookAllList() {
		return listService.getAllGbookList();
	}
	
	// 회원 A의 게시판 리스트 조회
//	@GetMapping("/list/{gbOwnerIdx}/scroll")	// /main/guestbook/list/gbOwnerIdx/scroll
//	@CrossOrigin
//	public List<Guestbook> guestbookList(@PathVariable("gbOwnerIdx") int ownerNo) {	
//		//System.out.println("ownerNo:"+ ownerNo);
//		//System.out.println(listService.getMemberGbookList(ownerNo));
//		return listService.getMemberGbookList(ownerNo);	
//	}
	
	
	// 회원 A의 게시판 리스트 (페이징) 조회
	@GetMapping("/list/{gbOwnerIdx}/{page}")	// /main/guestbook/list/gbOwnerIdx/pageNum
	@CrossOrigin
	public GuestbookListPage guestbookListPage(@PathVariable("gbOwnerIdx") int ownerNo, @PathVariable("page") int pageNum) {
		
		System.out.println("ownerNo:"+ ownerNo);
		System.out.println("pageNum:"+ pageNum);
		
		return listService.getListPage(ownerNo, pageNum);
	}
	
		
	
	

	
}
