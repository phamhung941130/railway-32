package com.vti.backend;

import java.time.LocalDate;
import java.util.Random;

public class Exercise4 {
	public void question1() {
		System.out.println("-----------Question 1:	In ngẫu nhiên ra 1 số nguyên-------------");
		Random random = new Random();
		int n = random.nextInt();
		System.out.println("Số ngẫu nhiên: " + n);
	}

	public void question2() {
		System.out.println("-----------Question 2:	In ngẫu nhiên ra 1 số thực-------------");
		Random random = new Random();
		float n = random.nextFloat();
		System.out.println("Số ngẫu nhiên: " + n);
	}

	public void question3() {
		System.out.println("-----------Question 3-------------");
		String[] nameArr = { "A", "B", "C", "D", "E" };
		Random random = new Random();
		int i = random.nextInt(nameArr.length);
		System.out.println("Tên ngẫu nhiên 1 bạn trong lớp: " + nameArr[i]);
	}

	public void question4() {
		System.out.println("-----------Question 4-------------");
		Random random = new Random();
		int minDay = (int) LocalDate.of(1995, 7, 24).toEpochDay();
		int maxDay = (int) LocalDate.of(1995, 12, 20).toEpochDay();
		System.out.println("minday:" + minDay);
		System.out.println("maxday:" + maxDay);
		long randomInt = minDay + random.nextInt(maxDay - minDay);
		LocalDate randomDay = LocalDate.ofEpochDay(randomInt);
		System.out.println(randomDay);
	}

	public void question5() {
		System.out.println("-----------Question 5-------------");
		Random random = new Random();
		int now = (int) LocalDate.now().toEpochDay();
		int randomday = now - random.nextInt(365);
		LocalDate resultDate = LocalDate.ofEpochDay(randomday);
		System.out.println("ngày ngẫu nhiên là: " + resultDate);

	}

	public void question6() {
		Random random = new Random();
		int maxDay1 = (int) LocalDate.now().toEpochDay();
		long randomDay1 = random.nextInt(maxDay1);
		LocalDate resultDate1 = LocalDate.ofEpochDay(randomDay1);
		System.out.println("1 Ngày ngẫu nhiên trong quá khứ: " + resultDate1);
	}

	public void question7() {
		Random random = new Random();
		int n = random.nextInt(999 - 100 + 1) + 100;
		System.out.println("Số ngẫu nhiên có 3 chữ số: " + n);
	}
}
