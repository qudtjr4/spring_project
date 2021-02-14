package com.ds.domain;

import java.sql.*;

public class Theme_ReviewDTO {
	private String mem_id;
	private int theme_no;
	private String rev_content;
	private int rev_score;
	private Date rev_time;
	private String mem_img;
	private int rev_no;
	public Theme_ReviewDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Theme_ReviewDTO(String mem_id, int theme_no, String rev_content, int rev_score, Date rev_time,
			String mem_img, int rev_no) {
		super();
		this.mem_id = mem_id;
		this.theme_no = theme_no;
		this.rev_content = rev_content;
		this.rev_score = rev_score;
		this.rev_time = rev_time;
		this.mem_img = mem_img;
		this.rev_no = rev_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getTheme_no() {
		return theme_no;
	}
	public void setTheme_no(int theme_no) {
		this.theme_no = theme_no;
	}
	public String getRev_content() {
		return rev_content;
	}
	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}
	public int getRev_score() {
		return rev_score;
	}
	public void setRev_score(int rev_score) {
		this.rev_score = rev_score;
	}
	public Date getRev_time() {
		return rev_time;
	}
	public void setRev_time(Date rev_time) {
		this.rev_time = rev_time;
	}
	public String getMem_img() {
		return mem_img;
	}
	public void setMem_img(String mem_img) {
		this.mem_img = mem_img;
	}
	public int getRev_no() {
		return rev_no;
	}
	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}
	@Override
	public String toString() {
		return "Theme_ReviewDTO [mem_id=" + mem_id + ", theme_no=" + theme_no + ", rev_content=" + rev_content
				+ ", rev_score=" + rev_score + ", rev_time=" + rev_time + ", mem_img=" + mem_img + ", rev_no=" + rev_no
				+ "]";
	}



}
