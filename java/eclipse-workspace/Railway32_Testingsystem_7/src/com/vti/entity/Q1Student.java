package com.vti.entity;

import com.vti.ultis.ScannerUltis;

public class Q1Student {
	private int id;
	private String name;
	public static String college = "Đại học công nghệ";
	public static int COUNT = 0;
	public static int moneyGroup = 0;

	public Q1Student() {
		COUNT++;
		if (COUNT > 7) {
			System.err.println("So luong sinh vien da vuot qua 7, ko the tao them sinh vien");
		} else {
			this.id = COUNT;
			System.out.println("nhập vào tên sinh viên: ");
			this.name = ScannerUltis.inputString();
		}

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

	public static String getCollege() {
		return Q1Student.college;
	}

	public static void setCollege(String newcollege) {
		Q1Student.college = newcollege;
	}

	@Override
	public String toString() {
		return "Q1Student [id=" + id + ", name=" + name + "]";
	}

}
