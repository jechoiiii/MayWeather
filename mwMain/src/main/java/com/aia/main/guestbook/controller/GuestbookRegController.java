package com.aia.main.guestbook.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aia.main.guestbook.domain.GuestbookRegRequest;
import com.aia.main.guestbook.service.GuestbookRegService;

@RestController
@RequestMapping("/guestbook")
public class GuestbookRegController {

	
	@Autowired
	private GuestbookRegService regService;
	
	// 방명록 등록 
	@PostMapping("/reg")	// main/guestbook/reg
	@CrossOrigin
	public int guestbookReg(GuestbookRegRequest gbRegReq, HttpServletRequest request) {
		
		//System.out.println("request:" +request);
		//System.out.println("gbRegReq : " + gbRegReq);
		return regService.insertGbookRegRequest(gbRegReq, request);
	}

	
	
}
