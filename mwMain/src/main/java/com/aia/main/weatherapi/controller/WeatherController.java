package com.aia.main.weatherapi.controller;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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

@Controller
@RequestMapping
public class WeatherController {

	@GetMapping("/weather")
	public String getWeatherByTimeForm() {
		return "weather";	// 시간대별 뷰로 이동
	}

	@GetMapping("/excel")
	public String getExcelToJson() {
		return "excel";	// 엑셀 변환 뷰로 이동
	}
	
}
