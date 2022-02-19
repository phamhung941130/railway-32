package com.vti.frontend;

import com.vti.backend.Toanhoc;

public class Demo3 {
	public static void main(String[] args) {
		Toanhoc toanhoc = new Toanhoc();
		float result;
		try {
			result = toanhoc.divide(10, 0);
			System.out.println("kq phep chia: " + result);

		} catch (Exception e) {
			e.printStackTrace();

		}
	}
}
