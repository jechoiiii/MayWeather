package com.aia.main.guestbook.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.aia.main.guestbook.domain.Guestbook;
import com.aia.main.guestbook.service.GuestbookListService;
import com.aia.main.guestbook.service.GuestbookRegService;

@RestController
@RequestMapping("/guestbook")
public class GuestbookRestController {
	
	@Autowired
	private GuestbookListService listService;
	
	@Autowired
	private GuestbookRegService regService;
	
	
	// 전체 리스트 조회 
	@GetMapping("/list")	// /main/guestbook/list
	@CrossOrigin
	public List<Guestbook> guestbookAllList(
			Model model
			) {
		
		model.addAttribute("list", listService.getAllGbookList());
		
		return listService.getAllGbookList();
	}
	
	// 회원 A의 게시판 리스트 조회
	@GetMapping("/list/{gbOwnerIdx}")	// /main/guestbook/list/gbOwnerIdx
	@CrossOrigin
	public List<Guestbook> guestbookList(
			@PathVariable("gbOwnerIdx") int memberNo,
			Model model
			) {
		
		System.out.println(memberNo);
		model.addAttribute("list", listService.getGbookList(memberNo));
		
		return listService.getGbookList(memberNo);
	}
	
	// 회원 A의 게시판 게시물의 수 

	
}
