package com.ds.domain;

public class Cour_plcVO {
	private int cour_plc_no;
	private int cour_no;
	private int plc_no;

	public Cour_plcVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Cour_plcVO(int cour_plc_no, int cour_no, int plc_no) {
		super();
		this.cour_plc_no = cour_plc_no;
		this.cour_no = cour_no;
		this.plc_no = plc_no;
	}

	public int getCour_plc_no() {
		return cour_plc_no;
	}

	public void setCour_plc_no(int cour_plc_no) {
		this.cour_plc_no = cour_plc_no;
	}

	public int getCour_no() {
		return cour_no;
	}

	public void setCour_no(int cour_no) {
		this.cour_no = cour_no;
	}

	public int getPlc_no() {
		return plc_no;
	}

	public void setPlc_no(int plc_no) {
		this.plc_no = plc_no;
	}

	@Override
	public String toString() {
		return "Cour_plcVO [cour_plc_no=" + cour_plc_no + ", cour_no=" + cour_no + ", plc_no=" + plc_no + "]";
	}

}
