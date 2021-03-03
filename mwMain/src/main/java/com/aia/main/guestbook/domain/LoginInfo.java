package com.aia.main.guestbook.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class LoginInfo implements Serializable {
	private int memIdx = 0;
	private String memName;
	private String memPhoto;
	private String memLoc;
	private String memGender;
	
	public LoginInfo(int memIdx, String memName, String memPhoto, String memLoc, String memGender) {
		this.memIdx = memIdx;
		this.memName = memName;
		this.memPhoto = memPhoto;
		this.memLoc = memLoc;
		this.memGender = memGender;
	}
	

}
