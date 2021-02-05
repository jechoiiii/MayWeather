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
public class WeatherApiController {

	@GetMapping
	@CrossOrigin
	@RequestMapping("/weatherByTime") // 동네예보 API 사용 (3시간 단위로 발표) -> 오늘 날짜의 전날 23시를 기준으로 153개의 데이터 요청 -> 오늘&내일 예보 정보 받기
	public ApiData getAllWeatherData(HttpServletResponse response,
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
		String base_date = "" + reqTime.getYear() + reqTime.getMonth() + (reqTime.getDay()-1);	// 전날 "20210204" Day-1
		String base_time = "2300";		// 2300
		
		System.out.println("base_date : "+ base_date + "base_time : " +base_time);

	   
		apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst"
				+ "?ServiceKey=" + serviceKey
				+ "&pageNo="+ pageNo
				+ "&numOfRows=" + numOfRows
				+ "&dataType=" + dataType
				+ "&base_date=" + base_date
				+ "&base_time=" + base_time
				+ "&nx=" + nx
				+ "&ny=" + ny;

		
		//URI 코드 % -> 25 encoding 방지.
		URI uri = new URI(apiUrl);

		ApiData apiData = template.getForObject(uri, ApiData.class);		
		
		System.out.println(apiData);

		return apiData;
	}
	
	
	
	@GetMapping
	@CrossOrigin
	@RequestMapping("/weatherNow") // 초단기 예보 API 사용 (1시간 단위로 발표)
	public ApiData getNowWeatherData(HttpServletResponse response,
			Location loc,
			RequestTime reqTime			
			) throws URISyntaxException {

		// REST API 통신을 위한 클래스 : SPRING 4 버전부터 제공  
		RestTemplate template = new RestTemplate();

		// ***** 초단기 예보 API 발표 시각에 따라 요청 시간 계산해야 함 *****
		Date now = new Date();
	
		// 초단기 예보 API 사용
		String apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getUltraSrtFcst";
		String serviceKey = "Ul4%2BcYS7f9Q31NjJP%2FIk1ly9GOGQ8G%2FYPCnJyBsV3hh6ZLptcQZZuR3WufjzBKZb1QEs8%2BqUwJJzc6rlACTkyA%3D%3D";
		String pageNo = "1";		// 페이지 번호
		String numOfRows = "153";	// 한 페이지 결과 수
		String dataType = "json";	// 받는 데이터 타입
		// 추후 수정
		String base_date = "";			// 추후 수정 
		String base_time = "";			// 추후 수정
		String nx = "" + loc.getX(); 	// 예보지점 x좌표 
		String ny = "" + loc.getY();	// 예보지점 y좌표		
		
		// 전날 23시부터 153개의 데이터를 조회하면 오늘과 내일의 날씨를 알 수 있음 
	   
		apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst"
				+ "?ServiceKey=" + serviceKey
				+ "&pageNo="+ pageNo
				+ "&numOfRows=" + numOfRows
				+ "&dataType=" + dataType
				+ "&base_date=" + base_date
				+ "&base_time=" + base_time
				+ "&nx=" + nx
				+ "&ny=" + ny;

		
		//URI 코드 % -> 25 encoding 방지.
		URI uri = new URI(apiUrl);

		ApiData apiData = template.getForObject(uri, ApiData.class);
		
		System.out.println(apiData);

		return apiData;
	}
	

}
