package com.vti.entity;

public class Mentor extends Account {

	private int yearOfExpexerice;

	public Mentor(int id, String email, String username, String fullname, int yearOfExpexerice) {
		super(id, email, username, fullname);
		this.yearOfExpexerice = yearOfExpexerice;
	}

	public int getYearOfExpexerice() {
		return yearOfExpexerice;
	}

	public void setYearOfExpexerice(int yearOfExpexerice) {
		this.yearOfExpexerice = yearOfExpexerice;
	}

	@Override
	public String toString() {
		return "Mentor [yearOfExpexerice=" + yearOfExpexerice + "]";
	}

	@Override
	public void goVTI() {
		System.out.println("di den vti");

	}

}