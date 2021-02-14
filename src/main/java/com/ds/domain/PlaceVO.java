package com.ds.domain;

public class PlaceVO {

	private int plc_no;
	private String plc_name;
	private String plc_category;
	private String plc_addr;
	private String plc_tel;
	private String plc_info;
	private double plc_map_x;
	private double plc_map_y;
	private int plc_totalscore;
	private String plc_time;
	private String plc_hashtag;
	private int loc_no;
	private String plc_img;
	public PlaceVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PlaceVO(int plc_no, String plc_name, String plc_category, String plc_addr, String plc_tel, String plc_info,
			double plc_map_x, double plc_map_y, int plc_totalscore, String plc_time, String plc_hashtag, int loc_no,
			String plc_img) {
		super();
		this.plc_no = plc_no;
		this.plc_name = plc_name;
		this.plc_category = plc_category;
		this.plc_addr = plc_addr;
		this.plc_tel = plc_tel;
		this.plc_info = plc_info;
		this.plc_map_x = plc_map_x;
		this.plc_map_y = plc_map_y;
		this.plc_totalscore = plc_totalscore;
		this.plc_time = plc_time;
		this.plc_hashtag = plc_hashtag;
		this.loc_no = loc_no;
		this.plc_img = plc_img;
	}
	public int getPlc_no() {
		return plc_no;
	}
	public void setPlc_no(int plc_no) {
		this.plc_no = plc_no;
	}
	public String getPlc_name() {
		return plc_name;
	}
	public void setPlc_name(String plc_name) {
		this.plc_name = plc_name;
	}
	public String getPlc_category() {
		return plc_category;
	}
	public void setPlc_category(String plc_category) {
		this.plc_category = plc_category;
	}
	public String getPlc_addr() {
		return plc_addr;
	}
	public void setPlc_addr(String plc_addr) {
		this.plc_addr = plc_addr;
	}
	public String getPlc_tel() {
		return plc_tel;
	}
	public void setPlc_tel(String plc_tel) {
		this.plc_tel = plc_tel;
	}
	public String getPlc_info() {
		return plc_info;
	}
	public void setPlc_info(String plc_info) {
		this.plc_info = plc_info;
	}
	public double getPlc_map_x() {
		return plc_map_x;
	}
	public void setPlc_map_x(double plc_map_x) {
		this.plc_map_x = plc_map_x;
	}
	public double getPlc_map_y() {
		return plc_map_y;
	}
	public void setPlc_map_y(double plc_map_y) {
		this.plc_map_y = plc_map_y;
	}
	public int getPlc_totalscore() {
		return plc_totalscore;
	}
	public void setPlc_totalscore(int plc_totalscore) {
		this.plc_totalscore = plc_totalscore;
	}
	public String getPlc_time() {
		return plc_time;
	}
	public void setPlc_time(String plc_time) {
		this.plc_time = plc_time;
	}
	public String getPlc_hashtag() {
		return plc_hashtag;
	}
	public void setPlc_hashtag(String plc_hashtag) {
		this.plc_hashtag = plc_hashtag;
	}
	public int getLoc_no() {
		return loc_no;
	}
	public void setLoc_no(int loc_no) {
		this.loc_no = loc_no;
	}
	public String getPlc_img() {
		return plc_img;
	}
	public void setPlc_img(String plc_img) {
		this.plc_img = plc_img;
	}
	@Override
	public String toString() {
		return "PlaceVO [plc_no=" + plc_no + ", plc_name=" + plc_name + ", plc_category=" + plc_category + ", plc_addr="
				+ plc_addr + ", plc_tel=" + plc_tel + ", plc_info=" + plc_info + ", plc_map_x=" + plc_map_x
				+ ", plc_map_y=" + plc_map_y + ", plc_totalscore=" + plc_totalscore + ", plc_time=" + plc_time
				+ ", plc_hashtag=" + plc_hashtag + ", loc_no=" + loc_no + ", plc_img=" + plc_img + "]";
	}
	

}