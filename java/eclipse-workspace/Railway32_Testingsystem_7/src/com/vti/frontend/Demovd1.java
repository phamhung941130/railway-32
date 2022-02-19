package com.vti.frontend;

import com.vti.entity.StudentVd;

public class Demovd1 {
	public static void main(String[] args) {

		StudentVd studentVd1 = new StudentVd();
		studentVd1.setId(1);
		studentVd1.setName("hieu");

		StudentVd studentVd2 = new StudentVd();
		studentVd2.setId(1);
		studentVd2.setName("hung");

		StudentVd studentVd3 = new StudentVd();
		studentVd3.setId(1);
		studentVd3.setName("nam");

		StudentVd.className = "Raiway 32";

		System.out.println("thong tin cac ban hoc vien");
		System.out.println("Ban hoc vien 1: " + studentVd1.toString());
		System.out.println("Ban hoc vien 2: " + studentVd2.toString());
		System.out.println("Ban hoc vien 3: " + studentVd3.toString());

//		==> Mock Project ==> Team ==> Mock30
		System.out.println("chuyen sang mock30");
		StudentVd.className = "Mock30";
		System.out.println("Ban hoc vien 1: " + studentVd1.toString());
		System.out.println("Ban hoc vien 2: " + studentVd2.toString());
		System.out.println("Ban hoc vien 3: " + studentVd3.toString());

	}
}
