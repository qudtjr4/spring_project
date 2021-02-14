package com.ds.domain;

import java.util.*;

public class CourseMainInfoDTO2 {

	private int cour_no;
	private String cour_title;
	private String mem_id;
	private List<Map<String,String>> listMap;
	public CourseMainInfoDTO2() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CourseMainInfoDTO2(int cour_no, String cour_title, String mem_id, List<Map<String, String>> listMap) {
		super();
		this.cour_no = cour_no;
		this.cour_title = cour_title;
		this.mem_id = mem_id;
		this.listMap = listMap;
	}
	public int getCour_no() {
		return cour_no;
	}
	public void setCour_no(int cour_no) {
		this.cour_no = cour_no;
	}
	public String getCour_title() {
		return cour_title;
	}
	public void setCour_title(String cour_title) {
		this.cour_title = cour_title;
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
	@Override
	public String toString() {
		return "CourseMainInfoDTO2 [cour_no=" + cour_no + ", cour_title=" + cour_title + ", mem_id=" + mem_id
				+ ", listMap=" + listMap + "]";
	}

}
