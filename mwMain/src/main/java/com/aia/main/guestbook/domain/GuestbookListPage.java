package com.aia.main.guestbook.domain;

import java.util.List;

public class GuestbookListPage {

	private int currentPage;				// 현재 페이지 번호 
	private int totalPageCount;				// 전체 페이지의 수
	private int totalGuestbookCount;		// 전체 게시물의 수 
	private int cntPerPage;					// 페이지당 게시물의 수  -> 변하지 않음
	private List<Guestbook> guestbookList;	// 페이지에 노출할 게시물의 정보를 담은 List
	private int startRow;					// 페이징 시작 번호 
	private int endRow;						// 페이징 마지막 번호 
	
	
	// 생성자 
	public GuestbookListPage(int currentPage, int totalGuestbookCount, int cntPerPage, List<Guestbook> guestbookList,
			int startRow, int endRow) {
		this.currentPage = currentPage;
		this.totalGuestbookCount = totalGuestbookCount;
		this.cntPerPage = cntPerPage;
		this.guestbookList = guestbookList;
		this.startRow = startRow;
		this.endRow = endRow;
		calTotalPageCount();
	}

	
	// 전체 페이지의 수 구하는 메서드 
	private void calTotalPageCount() {
		// 16개의 게시물을 5개씩 3페이지를 처리하고 남은 1개의 게시물을 위한 페이지까지 총 4페이지가 필요하다. 
		// 전체 게시물의 개수 % 페이지당 게시물의 수 == 0 -> 그대로 유지 
		// 전체 게시물의 개수 % 페이지당 게시물의 수 > 0 -> +1	
		
		totalPageCount = totalGuestbookCount/cntPerPage;
			// 16/5 = 3.xx = 3
		if(totalGuestbookCount%cntPerPage>0) {
			totalPageCount++;
				// 3+1 = 4
		}
	}
	
	
	// getter
	public int getCurrentPage() {
		return currentPage;
	}
	public int getTotalPageCount() {
		return totalPageCount;
	}
	public int getTotalGuestbookCount() {
		return totalGuestbookCount;
	}
	public int getCntPerPage() {
		return cntPerPage;
	}
	public List<Guestbook> getGuestbookList() {
		return guestbookList;
	}
	public int getStartRow() {
		return startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	
	
	@Override
	public String toString() {
		return "GuestbookListPage [currentPage=" + currentPage + ", totalPageCount=" + totalPageCount
				+ ", totalGuestbookCount=" + totalGuestbookCount + ", cntPerPage=" + cntPerPage + ", guestbookList="
				+ guestbookList + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}

	
}
