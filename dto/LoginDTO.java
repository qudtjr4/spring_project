package com.ds.dto;

public class LoginDTO {

	private String u_id;
	private String u_pw;
	private boolean useCookie;

	@Override
	public String toString() {
		return "LoginDTO [u_id=" + u_id + ", u_pw=" + u_pw + ", useCookie=" + useCookie + "]";
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public boolean isUseCookie() {
		return useCookie;
	}

	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}

	public LoginDTO(String u_id, String u_pw, boolean useCookie) {
		super();
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.useCookie = useCookie;
	}

	public LoginDTO() {
		super();
	}
}
