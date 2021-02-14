package com.ds.domain;

public class MemberVO {

	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_email;
	private String mem_img;
	private int mem_blind;

	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberVO(String mem_id, String mem_pw, String mem_name, String mem_email, String mem_img, int mem_blind) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_email = mem_email;
		this.mem_img = mem_img;
		this.mem_blind = mem_blind;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_img() {
		return mem_img;
	}

	public void setMem_img(String mem_img) {
		this.mem_img = mem_img;
	}

	public int getMem_blind() {
		return mem_blind;
	}

	public void setMem_blind(int mem_blind) {
		this.mem_blind = mem_blind;
	}

	@Override
	public String toString() {
		return "MemberVO [mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_name=" + mem_name + ", mem_email="
				+ mem_email + ", mem_img=" + mem_img + ", mem_blind=" + mem_blind + "]";
	}

}
