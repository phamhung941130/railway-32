package com.vti.frontend;

import com.vti.entity.Toanhoc;

public class demo4 {
	public static void main(String[] args) {
		Toanhoc toanhoc = new Toanhoc();
		int sumInt = toanhoc.add(2, 3);
		System.out.println("tong 2 so nguyen là: " + sumInt);
		float sumFloat = toanhoc.add(2.3f, 6.5f);
		System.out.println("tong 2 so thuc là: " + sumFloat);
	}
}
