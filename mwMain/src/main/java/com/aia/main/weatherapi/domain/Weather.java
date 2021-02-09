package com.aia.main.weatherapi.domain;

import java.util.Date;

public class Weather {
	
	// 동네예보 
	
	private String POP; // 강수확률
	private String PTY; // 강수형태		// 없음(0), 비(1), 비/눈(2), 눈(3), 소나기(4), 빗방울(5), 빗방울/눈날림(6), 눈날림(7)
	private String REH; // 습도
	private String SKY; // 하늘상태 		// 맑음(1), 구름많음(3), 흐림(4) 
	private String T3H; // 3시간 기온
	private String UUU; // 풍속(동서성분)	// 동(+표기), 서(-표기)
	private String VEC; // 풍향			// 0-45: N-NE ~
	private String VVV; // 풍속(남북성분)	// 북(+표기), 남(-표기)
	private String WSD; // 풍속
	
	private String TMN;	// 최저기온 -> 하루에 1번 발표 0600
	private String TMX; // 최고기온 -> 하루에 1번 발표 1500
	
	// 초단기 실황
	private String T1H;	// 기온
	private String RN1; // 1시간 강수량

}
