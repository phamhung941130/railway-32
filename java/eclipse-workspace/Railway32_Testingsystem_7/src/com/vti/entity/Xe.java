package com.vti.entity;

public class Xe {
	private int id;
	private String name;
	private final int maxSpeed;

	public static final float PI = 3.14f;

	public Xe(int maxSpeed) {
		super();
		this.maxSpeed = maxSpeed;
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

	public int getMaxSpeed() {
		return maxSpeed;
	}

//	public void setMaxSpeed(int maxSpeed) {
//		this.maxSpeed = maxSpeed;
//	}

	@Override
	public String toString() {
		return "Xe [id=" + id + ", name=" + name + ", maxSpeed=" + maxSpeed + "]";
	}

	public void test() {
		System.out.println("test xe");
	}
}
