package com.aia.main.weatherapi.domain;

import lombok.Data;

@Data
public class Codi { // Ajax 데이터를 담을 Codi 빈즈
	
	String item;
	int tempMin;
	int tempMax;
	String name;
	
	
}
