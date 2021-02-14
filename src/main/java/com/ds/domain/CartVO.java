package com.ds.domain;

public class CartVO {

	private String mem_id;
	private int plc_no;

	public CartVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CartVO(String mem_id, int plc_no) {
		super();
		this.mem_id = mem_id;
		this.plc_no = plc_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getPlc_no() {
		return plc_no;
	}

	public void setPlc_no(int plc_no) {
		this.plc_no = plc_no;
	}

	@Override
	public String toString() {
		return "CartVO [mem_id=" + mem_id + ", plc_no=" + plc_no + "]";
	}

}
