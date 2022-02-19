package com.vti.frontend;

import com.vti.entity.Student;

public class Demo1 {
	public static void main(String[] args) {

		Student student1 = new Student();
		student1.setId(1);
		student1.setName("Hieu");

		Student student2 = new Student();
		student2.setId(2);
		student2.setName("Dung");

		Student student3 = new Student();
		student3.setId(3);
		student3.setName("Tham");

		Student.className = "Railway 32";

		System.out.println("Thong tin cac ban hoc vien");
		System.out.println("ban hoc vien 1: " + student1.toString());
		System.out.println("ban hoc vien 2: " + student2.toString());
		System.out.println("ban hoc vien 3: " + student3.toString());

//	==> Mock Project ==> Team ==> Mock30
		System.out.println("hoc phan Mock Project");
		Student.className = "Mock 30";
		System.out.println("ban hoc vien 1: " + student1.toString());
		System.out.println("ban hoc vien 2: " + student2.toString());
		System.out.println("ban hoc vien 3: " + student3.toString());
//	
		System.out.println("chuyen student 1 sang railway35:");
		student1.className = "Railway 35";
		System.out.println("Ban hoc vien 1: " + student1.toString());
		System.out.println("Ban hoc vien 2: " + student2.toString());
	}
}
