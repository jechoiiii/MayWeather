package com.aia.main.guestbook.dao;

import java.util.List;

import com.aia.main.weatherapi.domain.Address;

public interface LocationDao {

	// xy 좌표 동일한 주소 조회
	List<Address> selectAddressByLocation(int x, int y);
	
}
