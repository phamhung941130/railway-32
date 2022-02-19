package com.vti.entity;

public class StudentVd {
	private int id;
	private String name;
	public static String className;
	public static int COUNT = 1;

	public StudentVd() {
		this.id = COUNT;
		COUNT++;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
		return "StudentVd [id=" + id + ", name=" + name + ", className=" + className + "]";
	}

}
