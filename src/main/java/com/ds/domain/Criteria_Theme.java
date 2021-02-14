package com.ds.domain;

import org.springframework.web.util.*;

public class Criteria_Theme {

	private int page;
	private int perPageNum;
	private int startRow;
	private int endRow;
	private String searchType;
	private String keyword;
	private String lineUp;

	public String getLineUp() {
		return lineUp;
	}

	public void setLineUp(String lineUp) {
		this.lineUp = lineUp;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		System.out.println("setSearchType:" + searchType);
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Criteria_Theme() {
		super();
		this.page = 1;
		this.perPageNum = 8;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page < 1) {
			this.page = 1;

		} else {
			this.page = page;
		}
		System.out.println("setPage:" + page);

		endRow = this.page * perPageNum; //8
		startRow = endRow - perPageNum + 1; // 1

	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 8;
			return;
		}
		this.perPageNum = perPageNum;

	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	
	public String makeQuery(int page , String keyword, String lineUp) {
		UriComponents uriComponents =
				UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("keyword", keyword)
				.queryParam("lineUp", lineUp)
				.build();

		return uriComponents.toUriString();
		
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", startRow=" + startRow + ", endRow=" + endRow
				+ ", searchType=" + searchType + ", keyword=" + keyword + ", lineUp=" + lineUp + "]";
	}


}
