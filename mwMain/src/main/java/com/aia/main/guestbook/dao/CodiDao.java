package com.aia.main.guestbook.dao;

import java.util.List;

import com.aia.main.weatherapi.domain.Codi;

public interface CodiDao {

	// xy 좌표 동일한 주소 조회
	List<Codi> selectCodiByWeather(int tempMin, int tempMax);
	
}
