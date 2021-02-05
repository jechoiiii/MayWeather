package com.aia.main.weatherapi.domain;

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
	
	public int getX() {
		return x;
	}
	public void setX(int x) {
		this.x = x;
	}
	public int getY() {
		return y;
	}
	public void setY(int y) {
		this.y = y;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLot() {
		return lot;
	}
	public void setLot(double lot) {
		this.lot = lot;
	}
	

	@Override
	public String toString() {
		return "Location [x=" + x + ", y=" + y + ", lat=" + lat + ", lot=" + lot + "]";
	}
	
	
}
