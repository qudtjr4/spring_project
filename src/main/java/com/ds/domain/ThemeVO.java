package com.ds.domain;

public class ThemeVO {

	private int theme_no;
	private String theme_title;
	private String theme_img;
	private String theme_content;
	private String theme_hashtag;
	private String mem_id;
	private double theme_totalscore;
	private int viewcount;
	private int recomand;
	public ThemeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ThemeVO(int theme_no, String theme_title, String theme_img, String theme_content, String theme_hashtag,
			String mem_id, double theme_totalscore, int viewcount, int recomand) {
		super();
		this.theme_no = theme_no;
		this.theme_title = theme_title;
		this.theme_img = theme_img;
		this.theme_content = theme_content;
		this.theme_hashtag = theme_hashtag;
		this.mem_id = mem_id;
		this.theme_totalscore = theme_totalscore;
		this.viewcount = viewcount;
		this.recomand = recomand;
	}
	public int getTheme_no() {
		return theme_no;
	}
	public void setTheme_no(int theme_no) {
		this.theme_no = theme_no;
	}
	public String getTheme_title() {
		return theme_title;
	}
	public void setTheme_title(String theme_title) {
		this.theme_title = theme_title;
	}
	public String getTheme_img() {
		return theme_img;
	}
	public void setTheme_img(String theme_img) {
		this.theme_img = theme_img;
	}
	public String getTheme_content() {
		return theme_content;
	}
	public void setTheme_content(String theme_content) {
		this.theme_content = theme_content;
	}
	public String getTheme_hashtag() {
		return theme_hashtag;
	}
	public void setTheme_hashtag(String theme_hashtag) {
		this.theme_hashtag = theme_hashtag;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public double getTheme_totalscore() {
		return theme_totalscore;
	}
	public void setTheme_totalscore(double theme_totalscore) {
		this.theme_totalscore = theme_totalscore;
	}
	public int getViewcount() {
		return viewcount;
	}
	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}
	public int getRecomand() {
		return recomand;
	}
	public void setRecomand(int recomand) {
		this.recomand = recomand;
	}
	@Override
	public String toString() {
		return "ThemeVO [theme_no=" + theme_no + ", theme_title=" + theme_title + ", theme_img=" + theme_img
				+ ", theme_content=" + theme_content + ", theme_hashtag=" + theme_hashtag + ", mem_id=" + mem_id
				+ ", theme_totalscore=" + theme_totalscore + ", viewcount=" + viewcount + ", recomand=" + recomand
				+ "]";
	}
	
}
