package com.aia.main.weatherapi.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.aia.main.guestbook.dao.LocationDao;
import com.aia.main.weatherapi.domain.Address;
import com.aia.main.weatherapi.domain.Location;
import com.mysql.cj.xdevapi.JsonArray;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AddressService {
		// 주소와 관련된 서비스
	
	private LocationDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public List<Address> getAddress(int x, int y) {
		
		List<Address> list = null;
		
		dao = template.getMapper(LocationDao.class);
		list = dao.selectAddressByLocation(x, y);
		
		log.info(list);
		System.out.println("주소 리스트 : " + list);
		
		return list;
	}
	
}
