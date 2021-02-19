package com.aia.main.guestbook.domain;

import lombok.Data;

@Data
public class SearchParam {

	private int ownerId;		// 방명록 주인 번호
	private int p;				// 페이징 번호 
	private String searchType;	// 검색 타입 
	private String keyword;		// 검색 키워드 
	
	
	public SearchParam(int ownerId, int p, String searchType, String keyword) {
		this.ownerId = ownerId;
		this.p = p;
		this.searchType = searchType;
		this.keyword = keyword;
		
		if(this.p<1) {
			this.p = 1;
		} 
	}

	public SearchParam() {
		this.p = 1;
	}

}
