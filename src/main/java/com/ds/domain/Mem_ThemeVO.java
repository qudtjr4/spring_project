package com.ds.domain;

public class Mem_ThemeVO {
	private String mem_id;
	private int theme_no;
	public Mem_ThemeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Mem_ThemeVO(String mem_id, int theme_no) {
		super();
		this.mem_id = mem_id;
		this.theme_no = theme_no;
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
	@Override
	public String toString() {
		return "Mem_ThemeVO [mem_id=" + mem_id + ", theme_no=" + theme_no + "]";
	}
	
	
}
