package com.aia.main.guestbook.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GuestbookUpdateRequest {

	private int gbNo;						// 방명록 번호
	private String gbContent; 				// 작성 내용 
	private MultipartFile gbContentPhoto;	// 첨부 사진
	private String gbSecret;				// 비밀글 여부
	
	public Guestbook toGuestbook() {
		Guestbook gbook = new Guestbook();
		gbook.setGbookNo(gbNo);
		gbook.setContent(gbContent);
		gbook.setSecret(gbSecret);
		// gbContentPhoto는 서비스에서 처리 

		return gbook;
	}

	
}
