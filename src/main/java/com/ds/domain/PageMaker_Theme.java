package com.ds.domain;


public class PageMaker_Theme {

	// [�씠�쟾] 1 2 3 4 5 6 7 8 9 10 [�떎�쓬]
	private int totalCount;
	private int startPage;
	private int maxPage;
	private int endPage;
	private boolean prev;
	private boolean next;

	private int displayNum = 5;

	private Criteria_Theme cri;

	public Criteria_Theme getCri() {
		return cri;
	}
	
	private void setCri(Criteria_Theme cri) {
		this.cri = cri;
	}

	public int getTotalCount() {
		return totalCount;
	}
	
	private void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	public void setCriAndTotalCount(Criteria_Theme cri, int totalCount) {
		setCri(cri);
		setTotalCount(totalCount);
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

	public int getStartPage() {
		return startPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getDisplayNum() {
		return displayNum;
	}
	
	
	

	@Override
	public String toString() {
		return "PageMaker_Theme [totalCount=" + totalCount + ", startPage=" + startPage + ", maxPage=" + maxPage
				+ ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", displayNum=" + displayNum + ", cri="
				+ cri + "]";
	}
	
	

}
