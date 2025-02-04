package com.aia.main.guestbook.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aia.main.guestbook.domain.Guestbook;
import com.aia.main.guestbook.domain.GuestbookUpdateRequest;
import com.aia.main.guestbook.service.GuestbookListService;
import com.aia.main.guestbook.service.GuestbookUpdateService;

@RestController
@RequestMapping("/guestbook")
public class GuestbookUpdateController {
	
	@Autowired
	private GuestbookUpdateService updateService;
	
	@Autowired
	private GuestbookListService listService;
	
	// 방명록 수정 
	@PostMapping("/update/{gbNo}")		//main/guestbook/update/gbNo
	@CrossOrigin
	public int guestbookUpdate(@PathVariable("gbNo") int gbookNo, GuestbookUpdateRequest updateRequest, HttpServletRequest request) {
		
		System.out.println("컨트롤러 도달 성공");
		System.out.println("gbookNo: "+gbookNo);
		System.out.println("updateRequest"+updateRequest);
		//System.out.println("request"+request);
		
		
		return updateService.updateGuestbook(gbookNo, updateRequest, request);
	}
	
	
	// 수정할 방명록 정보 조회 
	@GetMapping("/update/{gbNo}/form")
	@CrossOrigin
	public Guestbook guestbookInfo(@PathVariable("gbNo") int gbookNo) {
		
		return listService.getGuestbookInfo(gbookNo);
	}
	
	
}
