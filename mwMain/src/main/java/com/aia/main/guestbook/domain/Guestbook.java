package com.aia.main.guestbook.domain;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Guestbook {
	
	private int gbookNo;			// 방명록 글 번호
	private int ownerNo;			// 방명록 주인의 회원번호	: Member 테이블 참조
	private int writerNo;			// 작성자의 회원번호
	private String writerName;		// 작성자의 회원이름 
	private String writerPhoto;		// 작성자의 회원사진 
	private String writerLoc;		// 작성자의 위치 
	private String content; 		// 작성 내용 
	private String contentPhoto;	// 첨부 사진 
	private Timestamp regDate;		// 작성 날짜
	private Timestamp updateDate;	// 수정 날짜 
	private String secret;			// 비밀글 여부

	
	@Override
	public String toString() {
		return "Guestbook [gbookNo=" + gbookNo + ", ownerNo=" + ownerNo + ", writerNo=" + writerNo + ", writerName="
				+ writerName + ", writerPhoto=" + writerPhoto + ", writerLoc=" + writerLoc + ", content=" + content
				+ ", contentPhoto=" + contentPhoto + ", regDate=" + regDate + ", updateDate=" + updateDate + ", secret="
				+ secret + "]";
	}
	
}
