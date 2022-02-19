package com.vti.frontend;

import com.vti.entity.Student;

public class Demo2 {
	public static void main(String[] args) {
		Student student1 = new Student();
		student1.setName("Hieu");

		Student student2 = new Student();
		student1.setName("Tham");

		Student student3 = new Student();
		student1.setName("Hung");

		Student student4 = new Student();
		student1.setName("Dat");

		System.out.println(student1.toString());
		System.out.println(student2.toString());
		System.out.println(student3.toString());
		System.out.println(student4.toString());

	}
}
