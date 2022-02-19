package com.vti.frontend;

public class demo1 {
	public static void main(String[] args) {
//		Scanner scanner = new Scanner(System.in);
//		System.out.println("moi ban nhap so thứ nhất: ");
//		int a = scanner.nextInt();
//		System.out.println("moi ban nhap so thứ hai: ");
//		int b = scanner.nextInt();

// arithmetic Exeption		
		int a = 20;
		int b = 0;
		float result = a / b;
		System.out.println("ket qua: " + result);

//		Exeption
		String name = "hieu";
		System.out.println("so ki tu trong ten cua ban la: " + name.length());
		System.out.println("other");

		String[] nameRailway32 = new String[3];
		nameRailway32[0] = "trang";
		nameRailway32[0] = "tham";
		nameRailway32[0] = "dung";

		nameRailway32[10] = "abc";
//		
		String string = "abc";
		int i = Integer.parseInt(string);
		System.out.println("so nguyen la: " + i);
		System.out.println("-----other-----");

	}
}