package com.ds.domain;

public class PageMaker {
	
	private int totalCount;
	private int startPage;
	private int maxPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int displayNum = 10;
	
	private Criteria cri;

	public PageMaker() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PageMaker(int totalCount, int startPage, int maxPage, int endPage, boolean prev, boolean next,
			int displayNum, Criteria cri) {
		super();
		this.totalCount = totalCount;
		this.startPage = startPage;
		this.maxPage = maxPage;
		this.endPage = endPage;
		this.prev = prev;
		this.next = next;
		this.displayNum = displayNum;
		this.cri = cri;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	private void calcData() {
		maxPage = (int) (Math.ceil((double) totalCount / cri.getPerPageNum()));
		startPage = ((cri.getPage() - 1) / cri.getPerPageNum()) * cri.getPerPageNum() + 1;
		endPage = startPage + cri.getPerPageNum() - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		if (cri.getPage() != 1) {
			prev = true;
		}
		if (endPage != maxPage) {
			next = true;
		}
	}
	
	public void setCriAndTotalCount(Criteria cri, int totalCount) {
		setCri(cri);
		setTotalCount(totalCount);
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayNum() {
		return displayNum;
	}

	public void setDisplayNum(int displayNum) {
		this.displayNum = displayNum;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", maxPage=" + maxPage
				+ ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", displayNum=" + displayNum + ", cri="
				+ cri + "]";
	}
	
	
	

}
