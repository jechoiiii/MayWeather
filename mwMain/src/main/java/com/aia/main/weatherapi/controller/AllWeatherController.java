package com.aia.main.weatherapi.controller;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.aia.main.weatherapi.domain.ApiData;
import com.aia.main.weatherapi.domain.Location;
import com.aia.main.weatherapi.domain.RequestTime;
import com.aia.main.weatherapi.domain.ResponseDataItem;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;

@RestController
@RequestMapping
public class AllWeatherController {

	
	
	@GetMapping
	public String getWeatherByTime() {
		return "weather";	// 시간대별 뷰로 이동
	}
	
	@CrossOrigin
	@GetMapping("/weatherbytime") // 동네예보 API 사용 (3시간 단위로 발표) -> 오늘 날짜의 전날 23시를 기준으로 153개의 데이터 요청 -> 오늘&내일 예보 정보 받기
	public String getAllWeatherData(HttpServletResponse response,
			Location loc,
			RequestTime reqTime
			) throws URISyntaxException { 

		// REST API 통신을 위한 클래스 : SPRING 4 버전부터 제공  
		RestTemplate template = new RestTemplate();
		
		System.out.println(loc);
		
		// 동네예보 API 
		String apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst";	
		String serviceKey = "Ul4%2BcYS7f9Q31NjJP%2FIk1ly9GOGQ8G%2FYPCnJyBsV3hh6ZLptcQZZuR3WufjzBKZb1QEs8%2BqUwJJzc6rlACTkyA%3D%3D";
		String pageNo = "1";		// 페이지 번호
		String numOfRows = "153";	// 한 페이지 결과 수
		String dataType = "json";	// 받는 데이터 타입
		String nx = "" + loc.getX(); 	// 예보지점 x좌표 
		String ny = "" + loc.getY();	// 예보지점 y좌표		

		// 전날 23시부터 153개의 데이터를 조회하면 오늘과 내일의 날씨를 알 수 있음 	
		String base_date = "" + reqTime.getYear() + "0"+ reqTime.getMonth()+ "0"+ (reqTime.getDay()-1);	// 전날 "20210204" Day-1
		String base_time = "2300";		// 2300
		
		System.out.println("base_date : "+ base_date + "base_time : " +base_time);

	   
		apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst"
				+ "?serviceKey=" + serviceKey
				+ "&pageNo="+ pageNo
				+ "&numOfRows=" + numOfRows
				+ "&dataType=" + dataType
				+ "&base_date=" + base_date
				+ "&base_time=" + base_time
				+ "&nx=" + nx
				+ "&ny=" + ny;

		
		//URI 코드 % -> 25 encoding 방지.
		URI uri = new URI(apiUrl);

		String apiData = template.getForObject(uri, String.class);		
		
		System.out.println(apiData);
		
		response.setContentType("application/JSON; charset=UTF-8");
		
		
//		String fcstTime = apiData.getResponse().getBody().getItems().getItem().get(4).getFcstTime();
//		String category = apiData.getResponse().getBody().getItems().getItem().get(2).getCategory();
//		String fcstValue = apiData.getResponse().getBody().getItems().getItem().get(5).getFcstValue();
//		
//		
//		System.out.println(fcstDate+" "+fcstTime+" "+category+" "+fcstValue);
		

		
		return apiData;
	}
	


}
