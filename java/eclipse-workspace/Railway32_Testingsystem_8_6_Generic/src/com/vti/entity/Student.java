package com.vti.entity;

public class Student<N> {
	private N id;
	private String name;

	public Student(N id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + "]";
	}

}
