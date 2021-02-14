package com.ds.domain;

public class LocationVO {
	
	private int loc_no;
	private String loc_name;
	private String loc_info;
	private String loc_img;
	@Override
	public String toString() {
		return "LocationVO [loc_no=" + loc_no + ", loc_name=" + loc_name + ", loc_info=" + loc_info + ", loc_img="
				+ loc_img + "]";
	}
	public int getLoc_no() {
		return loc_no;
	}
	public void setLoc_no(int loc_no) {
		this.loc_no = loc_no;
	}
	public String getLoc_name() {
		return loc_name;
	}
	public void setLoc_name(String loc_name) {
		this.loc_name = loc_name;
	}
	public String getLoc_info() {
		return loc_info;
	}
	public void setLoc_info(String loc_info) {
		this.loc_info = loc_info;
	}
	public String getLoc_img() {
		return loc_img;
	}
	public void setLoc_img(String loc_img) {
		this.loc_img = loc_img;
	}
	public LocationVO(int loc_no, String loc_name, String loc_info, String loc_img) {
		super();
		this.loc_no = loc_no;
		this.loc_name = loc_name;
		this.loc_info = loc_info;
		this.loc_img = loc_img;
	}
	public LocationVO() {
		super();
		// TODO Auto-generated constructor stub
	}

}
