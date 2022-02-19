package com.vti.entity;

public class Department {
	public int id;
	public String name;

	public void print() {
		System.out.println("ID " + id + " Name " + name);

	}

	public String printdep() {
		return "ID " + id + " Name " + name;
	}

	@Override
	public String toString() {
		return "Department [id=" + id + ", name=" + name + "]";
	}
}
