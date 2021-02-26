package com.aia.main.weatherapi.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aia.main.weatherapi.domain.Address;
import com.aia.main.weatherapi.service.AddressService;

@RestController
@RequestMapping("/address")
public class AddressController {
	
	@Autowired
	private AddressService addressService;
	
	// x,y 좌표와 동일한 주소 조회
	@GetMapping("/{x}/{y}")
	public List<Address> getPossibleAddress(@PathVariable("x") int x, @PathVariable("y") int y) {
		
		System.out.println("x = " + x);
		System.out.println("y = " + y);
		
		return addressService.getAddress(x, y);
		
	}

}
