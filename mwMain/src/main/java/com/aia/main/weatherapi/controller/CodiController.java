package com.aia.main.weatherapi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aia.main.weatherapi.domain.Codi;
import com.aia.main.weatherapi.service.CodiService;

@RestController
@RequestMapping("/todaycodi")
public class CodiController {
	
	@Autowired
	private CodiService codiService;
	
	// x,y 좌표와 동일한 주소 조회
	@GetMapping("/{tmp_max}/{tmp_min}")
	@CrossOrigin
	public List<Codi> getPossibleAddress(@PathVariable("tmp_max") int tempMin, @PathVariable("tmp_min") int tempMax) {
		
		System.out.println("tempMin = " + tempMin);
		System.out.println("tempMax = " + tempMax);
		
		return codiService.getCodi(tempMin, tempMax);
		
	}

}
