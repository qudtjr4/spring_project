package com.ds.domain;

public class CourseVO {
	
	private int cour_no;
	private String cour_hashtag;
	private String cour_title;
	private int cour_totalscore;
	private String cour_days;
	private String mem_id;
	public CourseVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CourseVO(int cour_no, String cour_hashtag, String cour_title, int cour_totalscore, String cour_days,
			String mem_id) {
		super();
		this.cour_no = cour_no;
		this.cour_hashtag = cour_hashtag;
		this.cour_title = cour_title;
		this.cour_totalscore = cour_totalscore;
		this.cour_days = cour_days;
		this.mem_id = mem_id;
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
	@Override
	public String toString() {
		return "CourseVO [cour_no=" + cour_no + ", cour_hashtag=" + cour_hashtag + ", cour_title=" + cour_title
				+ ", cour_totalscore=" + cour_totalscore + ", cour_days=" + cour_days + ", mem_id=" + mem_id
				+ ", getCour_no()=" + getCour_no() + ", getCour_hashtag()=" + getCour_hashtag() + ", getCour_title()="
				+ getCour_title() + ", getCour_totalscore()=" + getCour_totalscore() + ", getCour_days()="
				+ getCour_days() + ", getMem_id()=" + getMem_id() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}

}
