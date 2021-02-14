package com.ds.domain;

import org.springframework.web.util.*;

public class Criteria_Place {

	private int page;
	private int perPageNum;
	private int startRow;
	private int endRow;
	private String searchType;
	private String keyword;

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

	public Criteria_Place() {
		super();
		this.page = 1;
		this.perPageNum = 12;
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

		endRow = this.page * perPageNum; // 10
		startRow = endRow - perPageNum + 1; // 1

	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
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
	
	public String makeQuery(int page) {
		UriComponents uriComponents =
				UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("searchType", searchType)
				.queryParam("keyword", keyword)
				.build();
		// ?page=1&searchType=t&keyword=50
		// -> [주의] ? 포함해서 생성됨 
		// -> EL에서 작성시 맨 앞에 위치하도록 할것!
		return uriComponents.toUriString();
		
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", startRow=" + startRow + ", endRow=" + endRow
				+ ", searchType=" + searchType + ", keyword=" + keyword + "]";
	}

}
