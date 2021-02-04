package com.aia.main.guestbook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.aia.main.guestbook.service.GuestbookListService;

@Controller
public class GuestbookListController {
	
	@Autowired
	private GuestbookListService listService;
	
	@RequestMapping("/guestbook/list")
	public String guestbookList(
			Model model
			) {
		
		model.addAttribute("list", listService.getAllGbookList());
		
		return "guestbook/list";
	}
	
	
	

}
