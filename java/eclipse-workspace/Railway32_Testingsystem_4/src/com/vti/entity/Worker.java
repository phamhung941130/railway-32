package com.vti.entity;

public class Worker extends Staff {
	private int rank;

	public Worker(String name, int age, Gender gender, String address, int rank) {
		super(name, age, gender, address);
		this.rank = rank;

	}

	@Override
	public String toString() {
		return "Name: " + super.getName() + " Age: " + super.getAge() + " Gender: " + super.getGender().toString()
				+ " Adress: " + super.getAddress() + " Rank: " + rank;
	}

}
