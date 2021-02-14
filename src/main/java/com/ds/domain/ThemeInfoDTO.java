package com.ds.domain;

import java.util.*;

public class ThemeInfoDTO {
	private int theme_no;
	private String theme_title;
	private String mem_id;
	private List<Map<String,String>> listMap;
	@Override
	public String toString() {
		return "ThemeInfoDTO [theme_no=" + theme_no + ", theme_title=" + theme_title + ", mem_id=" + mem_id
				+ ", listMap=" + listMap + "]";
	}
	public ThemeInfoDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ThemeInfoDTO(int theme_no, String theme_title, String mem_id, List<Map<String, String>> listMap) {
		super();
		this.theme_no = theme_no;
		this.theme_title = theme_title;
		this.mem_id = mem_id;
		this.listMap = listMap;
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
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public List<Map<String, String>> getListMap() {
		return listMap;
	}
	public void setListMap(List<Map<String, String>> listMap) {
		this.listMap = listMap;
	}
}
