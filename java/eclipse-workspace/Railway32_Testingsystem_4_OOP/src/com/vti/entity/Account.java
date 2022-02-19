package com.vti.entity;

public abstract class Account {
	private int id;
	private String email;
	private String username;
	private String fullname;

	public Account(int id, String email, String username, String fullname) {
		super();
		this.id = id;
		this.email = email;
		this.username = username;
		this.fullname = fullname;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public abstract void goVTI();

	@Override
	public String toString() {
		return "Account [id=" + id + ", email=" + email + ", username=" + username + ", fullname=" + fullname + "]";
	}

}
