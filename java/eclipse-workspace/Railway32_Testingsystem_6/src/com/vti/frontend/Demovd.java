package com.vti.frontend;

import com.vti.backend.Toanhoc1;

public class Demovd {
	public static void main(String[] args) {
		Toanhoc1 toanhoc1 = new Toanhoc1();
		float result = 0;

		try {
			result = toanhoc1.divide(10, 0);
			System.out.println("Ket qua: " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
