package com.itcast.domain;

public class User {
	private String username;
	private String email;
	private String tel;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", email=" + email + ", tel="
				+ tel + "]";
	}

}
