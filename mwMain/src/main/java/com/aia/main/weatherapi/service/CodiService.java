package com.aia.main.weatherapi.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.aia.main.guestbook.dao.CodiDao;
import com.aia.main.weatherapi.domain.Codi;
import com.mysql.cj.xdevapi.JsonArray;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CodiService {
		// 주소와 관련된 서비스
	
	private CodiDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public List<Codi> getCodi(int tempMin, int tempMax) {
		
		List<Codi> list = null;
		
		dao = template.getMapper(CodiDao.class);
		list = dao.selectCodiByWeather(tempMin, tempMax);
		
		log.info(list);
		System.out.println("코디 리스트 : " + list);
		
		return list;
	}
	
}
