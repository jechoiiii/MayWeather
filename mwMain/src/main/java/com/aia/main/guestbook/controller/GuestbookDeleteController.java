package com.aia.main.guestbook.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aia.main.guestbook.service.GuestbookDeleteService;

@RestController
@RequestMapping("/guestbook")
public class GuestbookDeleteController {

	@Autowired
	private GuestbookDeleteService deleteService;
	
	// 방명록 삭제 
	@PostMapping("/delete/{gbNo}")	// main/guestbook/delete/gbNo
	@CrossOrigin
	public int guestbookDelete(@PathVariable("gbNo") int gbookNo, HttpServletRequest request) {
		
		System.out.println("삭제한 게시물 번호 : "+gbookNo);
		return deleteService.deleteGuestbook(gbookNo, request);
	}
	
	
}
