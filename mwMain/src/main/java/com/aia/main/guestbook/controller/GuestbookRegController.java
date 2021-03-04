package com.aia.main.guestbook.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aia.main.guestbook.domain.GuestbookRegRequest;
import com.aia.main.guestbook.service.GuestbookRegService;
import com.aia.main.guestbook.service.RedisService;
import com.aia.main.guestbook.domain.LoginInfo;

@RestController
@RequestMapping("/guestbook")
public class GuestbookRegController {

	
	@Autowired
	private GuestbookRegService regService;
	
	@Autowired
	private RedisService redisService;
	
	// 방명록 등록 
	@PostMapping("/reg")	// main/guestbook/reg
	@CrossOrigin
	public int guestbookReg(GuestbookRegRequest gbRegReq, HttpServletRequest request) {
		
		int result = 0;
		
		System.out.println("request:" +request);
		System.out.println("gbRegReq : " + gbRegReq);
		
		
		// JSESSION ID 가져오기
		LoginInfo redisLoginInfo = redisService.getUserInformation(gbRegReq.getJsessionId());

		// 로그인한 경우 
		if(redisLoginInfo.getMemIdx() > 0) {
			// 방명록 등록
			result = regService.insertGbookRegRequest(gbRegReq, request, redisLoginInfo);
		}
		
		return result;
	}

	
	
}
