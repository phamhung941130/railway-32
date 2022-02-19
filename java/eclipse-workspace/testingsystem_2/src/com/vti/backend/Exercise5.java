package com.vti.backend;

import java.time.LocalDate;
import java.util.Scanner;

public class Exercise5 {
	public void question1() {
		Scanner sc = new Scanner(System.in);
		System.out.println("mời bạn nhập vào số nguyên thứ nhất: ");
		int a = sc.nextInt();
		System.out.println("mời bạn nhập vào số nguyên thứ 2: ");
		int b = sc.nextInt();
		System.out.println("mời bạn nhập vào số nguyên thứ 3: ");
		int c = sc.nextInt();
		System.out.println("số bạn vừa nhập vào là: " + a + b + c);
	}

	public void question4() {
		Scanner sc = new Scanner(System.in);
		System.out.println("Mời bạn nhập vào năm sinh: ");
		int year = sc.nextInt();
		System.out.println("Mời bạn nhập vào tháng sinh: ");
		int month = sc.nextInt();
		System.out.println("Mời bạn nhập vào ngày sinh: ");
		int day = sc.nextInt();

		LocalDate dateBirth = LocalDate.of(year, month, day);
		System.out.println("Ngày sinh của bạn là: " + dateBirth);
	}

	public void question5() {
		Scanner sc = new Scanner(System.in);
		while (true) {
			System.out.println("mời bạn nhập vào posittion:");
			int a = sc.nextInt();

			switch (a) {

			case 1:
				System.out.println("Dev");
				break;

			case 2:
				System.out.println("Test");
				break;

			case 3:
				System.out.println("ScrumMaster");
				break;
			case 4:
				System.out.println("PM");
				break;
			default:
				System.out.println("mời nhập lại");
				break;
			}
		}
	}
}
