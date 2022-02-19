package com.vti.frontend;

import java.time.LocalDate;

import com.vti.ultis.ScannerUltis;

public class Demo5 {
	public static void main(String[] args) {
//		System.out.println("moi ban nhap vao mot so nguyen: ");
//		int num1 = ScannerUltis.inputInt();
//		System.out.println("so ban vua nhap la" + num1);
//
//		System.out.println("moi ban nhap vao mot so nguyen +: ");
//		int num2 = ScannerUltis.inputIntPositive();
//		System.out.println("so ban vua nhap la" + num2);
//
//		System.out.println("moi ban nhap vao mot so thuc: ");
//		float num3 = ScannerUltis.inputFloat();
//		System.out.println("so ban vua nhap la" + num3);

//		System.out.println("moi ban nhap vao mot chuoi: ");
//		String name = ScannerUltis.inputString();
//		System.out.println("chuoi ban vua nhap la" + name);

		System.out.println("moi ban nhap vao mot so ngay: ");
		LocalDate birtday = ScannerUltis.inputLocalDate();
		System.out.println("so ban vua nhap la: " + birtday);
	}
}
