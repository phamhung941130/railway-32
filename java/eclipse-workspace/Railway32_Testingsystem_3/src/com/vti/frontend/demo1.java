package com.vti.frontend;

public class demo1 {

	public static void main(String[] args) {
		int a = 5;
////		Integer a1 = 5;
//		System.out.println("so a la: " + a);
//		System.out.println("so a1 la: " + a1);
		float b = 5.6f;
		Float b1 = 6.7f;
//		char d = "d";
//		Character e = "e";
		Integer a1 = Integer.valueOf(a);
		Float float1 = Float.valueOf(b);
		int a2 = a1.intValue();
// String chi co 1 loai String
// ep kieu du lieu(down casting,up casting)
		float salary = 2000.8f;
		int salary1 = (int) salary;
		System.out.println("luong dua cho vo: " + salary1);

	}

}
