package com.vti.entity;

public class Engineer extends Staff {
	private String speccialized;

	public Engineer(String name, int age, Gender gender, String address, String speccialized) {
		super(name, age, gender, address);
		this.speccialized = speccialized;
	}

	@Override
	public String toString() {
		return "Name: " + super.getName() + " Age: " + super.getAge() + " Gender: " + super.getGender().toString()
				+ " Adress: " + super.getAddress() + " Speccialized: " + speccialized;
	}

}
