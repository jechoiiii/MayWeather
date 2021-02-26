package com.aia.main.weatherapi.domain;

import lombok.Data;

@Data
public class Location { // Ajax 데이터를 담을 Location 빈즈
	
	int x;			// 기상청 x 좌표 
	int y;			// 기상청 y 좌표 
	double lat;		// 위도 
	double lot;		// 경도
	
	
	
	public Location(int x, int y, double lat, double lot) {
		this.x = x;
		this.y = y;
		this.lat = lat;
		this.lot = lot;
	}
	
	public Location() {
		
	}
	
	
	
}
