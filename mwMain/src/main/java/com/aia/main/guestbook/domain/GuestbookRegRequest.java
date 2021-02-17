package com.aia.main.guestbook.domain;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GuestbookRegRequest {

	private int gbOwnerNo;					// 방명록 주인의 회원번호	: Member 테이블 참조
	private int gbWriterNo;					// 작성자의 회원번호
	private String gbWriterName;			// 작성자의 회원이름 
	private String gbWriterPhoto;			// 작성자의 회원사진 
	private String gbWriterLoc;				// 작성자의 위치 
	private String gbContent; 				// 작성 내용 
	private MultipartFile gbContentPhoto;	// 첨부 사진
	private String gbSecret;				// 비밀글 여부
	
	public Guestbook toGuestbook() {
		Guestbook gbook = new Guestbook();
		gbook.setOwnerNo(gbOwnerNo);
		gbook.setWriterNo(gbWriterNo);
		gbook.setWriterName(gbWriterName);
		gbook.setWriterPhoto(gbWriterPhoto);
		gbook.setWriterLoc(gbWriterLoc);
		gbook.setContent(gbContent);
		gbook.setSecret(gbSecret);

		return gbook;
	}

	@Override
	public String toString() {
		return "GuestbookRegRequest [gbOwnerNo=" + gbOwnerNo + ", gbWriterNo=" + gbWriterNo + ", gbWriterName="
				+ gbWriterName + ", gbWriterPhoto=" + gbWriterPhoto + ", gbWriterLoc=" + gbWriterLoc + ", gbContent="
				+ gbContent + ", gbContentPhoto=" + gbContentPhoto + ", gbSecret=" + gbSecret + "]";
	}

		
}
