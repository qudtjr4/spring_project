package com.ds.domain;

import java.util.*;

public class CourseMainInfoDTO {

	private int cour_no;
	private String cour_hashtag;
	private String cour_title;
	private int cour_totalscore;
	private String cour_days;
	private String mem_id;
	private List<String> listPlcImg;
	private int reviewCount;

	public CourseMainInfoDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CourseMainInfoDTO(int cour_no, String cour_hashtag, String cour_title, int cour_totalscore, String cour_days,
			String mem_id, List<String> listPlcImg, int reviewCount) {
		super();
		this.cour_no = cour_no;
		this.cour_hashtag = cour_hashtag;
		this.cour_title = cour_title;
		this.cour_totalscore = cour_totalscore;
		this.cour_days = cour_days;
		this.mem_id = mem_id;
		this.listPlcImg = listPlcImg;
		this.reviewCount = reviewCount;
	}


	public int getCour_no() {
		return cour_no;
	}

	public void setCour_no(int cour_no) {
		this.cour_no = cour_no;
	}

	public String getCour_hashtag() {
		return cour_hashtag;
	}

	public void setCour_hashtag(String cour_hashtag) {
		this.cour_hashtag = cour_hashtag;
	}

	public String getCour_title() {
		return cour_title;
	}

	public void setCour_title(String cour_title) {
		this.cour_title = cour_title;
	}

	public int getCour_totalscore() {
		return cour_totalscore;
	}

	public void setCour_totalscore(int cour_totalscore) {
		this.cour_totalscore = cour_totalscore;
	}

	public String getCour_days() {
		return cour_days;
	}

	public void setCour_days(String cour_days) {
		this.cour_days = cour_days;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public List<String> getListPlcImg() {
		return listPlcImg;
	}

	public void setListPlcImg(List<String> listPlcImg) {
		this.listPlcImg = listPlcImg;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	@Override
	public String toString() {
		return "CourseMainInfoDTO [cour_no=" + cour_no + ", cour_hashtag=" + cour_hashtag + ", cour_title=" + cour_title
				+ ", cour_totalscore=" + cour_totalscore + ", cour_days=" + cour_days + ", mem_id=" + mem_id
				+ ", listPlcImg=" + listPlcImg + ", reviewCount=" + reviewCount + "]";
	}

	

}
