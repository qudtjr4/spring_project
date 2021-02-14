package com.ds.domain;

public class Plc_ThemeVO {

	private int plc_no;
	private int theme_no;
	public Plc_ThemeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Plc_ThemeVO(int plc_no, int theme_no) {
		super();
		this.plc_no = plc_no;
		this.theme_no = theme_no;
	}
	public int getPlc_no() {
		return plc_no;
	}
	public void setPlc_no(int plc_no) {
		this.plc_no = plc_no;
	}
	public int getTheme_no() {
		return theme_no;
	}
	public void setTheme_no(int theme_no) {
		this.theme_no = theme_no;
	}
	
	
	@Override
	public String toString() {
		return "Plc_ThemeVO [plc_no=" + plc_no + ", theme_no=" + theme_no + "]";
	}
	
	
	
}
