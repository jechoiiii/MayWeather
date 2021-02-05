package com.aia.main.weatherapi.domain;

public class ResponseDataHeader {

	private String resultCode;	// 응답 메시지 코드 
	private String resultMsg;	// 응답 메시지 설명 

	public String getResultCode() {
		return resultCode;
	}

	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}

	public String getResultMsg() {
		return resultMsg;
	}

	public void setResultMsg(String resultMsg) {
		this.resultMsg = resultMsg;
	}

	@Override
	public String toString() {
		return "ResponseDataHeader [resultCode=" + resultCode + ", resultMsg=" + resultMsg + "]";
	}
	
	

}
