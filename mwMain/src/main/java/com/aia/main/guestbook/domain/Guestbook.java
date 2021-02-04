package com.aia.main.guestbook.domain;

import java.sql.Timestamp;

public class Guestbook {
	
	private int gbookNo;			// 방명록 글 번호
	private int memberNo;			// 방명록 주인의 회원번호	: Member 테이블 참조
	private int writerNo;			// 작성자의 회원번호
	private String writerName;		// 작성자의 회원이름 
	private String writerPhoto;		// 작성자의 회원사진 
	private String writerLoc;		// 작성자의 위치 
	private String content; 		// 작성 내용 
	private String contentPhoto;	// 첨부 사진 
	private Timestamp regDate;		// 작성 날짜
	private Timestamp updateDate;	// 수정 날짜 
	private String secret;			// 비밀글 여부
	
	
	public int getGbookNo() {
		return gbookNo;
	}
	public void setGbookNo(int gbookNo) {
		this.gbookNo = gbookNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getWriterNo() {
		return writerNo;
	}
	public void setWriterNo(int writerNo) {
		this.writerNo = writerNo;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	public String getWriterPhoto() {
		return writerPhoto;
	}
	public void setWriterPhoto(String writerPhoto) {
		this.writerPhoto = writerPhoto;
	}
	public String getWriterLoc() {
		return writerLoc;
	}
	public void setWriterLoc(String writerLoc) {
		this.writerLoc = writerLoc;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getContentPhoto() {
		return contentPhoto;
	}
	public void setContentPhoto(String contentPhoto) {
		this.contentPhoto = contentPhoto;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public Timestamp getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	
	
	@Override
	public String toString() {
		return "Guestbook [gbookNo=" + gbookNo + ", memberNo=" + memberNo + ", writerNo=" + writerNo + ", writerName="
				+ writerName + ", writerPhoto=" + writerPhoto + ", writerLoc=" + writerLoc + ", content=" + content
				+ ", contentPhoto=" + contentPhoto + ", regDate=" + regDate + ", updateDate=" + updateDate + ", secret="
				+ secret + "]";
	}

}
