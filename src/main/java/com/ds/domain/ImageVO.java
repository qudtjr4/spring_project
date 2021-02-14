package com.ds.domain;

public class ImageVO {

	private int plc_no;
	private String img_name;
	public ImageVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ImageVO(int plc_no, String img_name) {
		super();
		this.plc_no = plc_no;
		this.img_name = img_name;
	}
	public int getPlc_no() {
		return plc_no;
	}
	public void setPlc_no(int plc_no) {
		this.plc_no = plc_no;
	}
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	@Override
	public String toString() {
		return "ImageVO [plc_no=" + plc_no + ", img_name=" + img_name + "]";
	}
	
	
}
