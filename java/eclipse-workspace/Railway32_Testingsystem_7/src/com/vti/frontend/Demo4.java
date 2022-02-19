package com.vti.frontend;

import java.util.Scanner;

import com.vti.ultis.ScannerUltis;

public class Demo4 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("chuong trinh quan ly nhan vien");
		System.out.println("moi ban nhap vao ID cua sinh vien: ");
		int id = ScannerUltis.inputIntPositive();

		System.out.println("moi ban nhap vao ten cua sinh vien: ");
		String name = scanner.next();

		System.out.println("Thong tin sinh vien ban vua nhap ID :" + id + " Name :" + name);

	}
}
