package com.vti.backend;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import com.vti.entity.Exam;

public class Exercise3 {
	private SimpleDateFormat simpleDateFormat;

	public void question1() {
		Exam exam1 = new Exam(1, "code1", "title1", 60, new Date());

		Locale locale = new Locale("vi", "VN");
		DateFormat dateformat = DateFormat.getDateInstance(DateFormat.DEFAULT, locale);
		String date = dateformat.format(exam1.CreateDate);
		System.out.println(exam1.code + ": " + date);
	}

	public void question2() {
		Exam exam1 = new Exam(1, "code1", "title1", 60, new Date());
		Exam exam2 = new Exam(2, "code2", "title1", 60, new Date());

		String patter = "yyyy-MM-dd-HH:mm:ss";
		simpleDateFormat = new SimpleDateFormat(patter);
		Exam[] exams = { exam1, exam2 };
		for (Exam exam : exams) {
			String date = simpleDateFormat.format(exam.CreateDate);
			System.out.println(exam.code + ": " + date);
		}
	}

	public void question3() {
		Exam exam1 = new Exam(1, "code1", "title1", 60, new Date());
		Exam exam2 = new Exam(2, "code2", "title1", 60, new Date());
		Exam[] exams = { exam1, exam2 };
		String pattern = "yyyy";
		simpleDateFormat = new SimpleDateFormat(pattern);
		for (Exam exam : exams) {
			String date = simpleDateFormat.format(exam.CreateDate);
			System.out.println(exam.CreateDate);
		}
	}
}