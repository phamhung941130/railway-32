package com.vti.backend;

import com.vti.entity.MyMath2;
import com.vti.entity.Student;
import com.vti.ultis.ScannerUltis;

public class Exercise2 {
	public void question1() {
		System.out.println("nhap vao so int: ");
		int a = ScannerUltis.inputInt();
		System.out.println("tong voi so Pi la: " + MyMath2.sum(a));

	}

	public void question2() {
		for (int i = 0; i < 3; i++) {
			Student student1 = new Student();
			System.out.println("student" + (i + 1) + ": " + student1.getId() + "    " + student1.getName());

		}

	}
}
