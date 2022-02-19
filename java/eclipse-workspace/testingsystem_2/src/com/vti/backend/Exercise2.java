package com.vti.backend;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class Exercise2 {
	public void question1() {
		int a = 5;
		System.out.println(a);
	}

	public void question2() {
		int a = 100000000;
		System.out.printf(Locale.US, "%,d%n", a);
	}

	public void question3() {
		float a = 5.567098f;
		System.out.printf("%5.4f%n", a);
	}

	public void question4() {
		System.out.println("-------------Question 4:-------------");
		String s = "Nguyễn Văn A";
		System.out.printf("Tên tôi là \"" + s + "\" và tôi đang độc thân \n");

	}

	public void question5() {
		System.out.println("-------------Question 5:-------------");
		String pattern = "dd/MM/yyyy HH:mm:ss";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String date = simpleDateFormat.format(new Date());
		System.out.println(date);
	}

}
