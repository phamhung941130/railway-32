package com.vti.entity;

public class Student {
	private int id;
	private String name;
	public static String className;

	public static int COUNT = 1;

	public Student() {
		super();
		this.id = COUNT;
		COUNT++;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	@Override
	public String toString() {
		return "Stutdent [id=" + id + ", name=" + name + ", className=" + className + "]";
	}

}
