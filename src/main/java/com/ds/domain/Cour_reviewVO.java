package com.ds.domain;

import java.util.*;

public class Cour_reviewVO {

	private String mem_id;
	private int cour_no;
	private String rev_content;
	private int rev_score;
	private int rev_no;
	private Date rev_time;

	public Cour_reviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Cour_reviewVO(String mem_id, int cour_no, String rev_content, int rev_score, int rev_no, Date rev_time) {
		super();
		this.mem_id = mem_id;
		this.cour_no = cour_no;
		this.rev_content = rev_content;
		this.rev_score = rev_score;
		this.rev_no = rev_no;
		this.rev_time = rev_time;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getCour_no() {
		return cour_no;
	}

	public void setCour_no(int cour_no) {
		this.cour_no = cour_no;
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

	public int getRev_no() {
		return rev_no;
	}

	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}

	public Date getRev_time() {
		return rev_time;
	}

	public void setRev_time(Date rev_time) {
		this.rev_time = rev_time;
	}

	@Override
	public String toString() {
		return "Cour_reviewVO [mem_id=" + mem_id + ", cour_no=" + cour_no + ", rev_content=" + rev_content
				+ ", rev_score=" + rev_score + ", rev_no=" + rev_no + ", rev_time=" + rev_time + "]";
	}

}
