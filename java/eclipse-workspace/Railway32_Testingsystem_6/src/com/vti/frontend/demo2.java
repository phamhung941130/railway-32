package com.vti.frontend;

public class demo2 {
	public static void main(String[] args) {

		System.out.println("---code1----");
		System.out.println("---code2----");
		System.out.println("---code3----");
//		try catch
		try {

			int result = 10 / 2;

			System.out.println("---------");
			String[] namStrings = new String[3];
			namStrings[1] = "abc";

			String string = null;
			string.length();

		} catch (ArithmeticException e) {
			System.err.println("ban ko the thuc hien phep chia nay!!!");

		} catch (ArrayIndexOutOfBoundsException e) {
			System.err.println("vuot qua phan tu mang cho phep!!!");
		} catch (Exception e) {
			System.err.println("loi!!!");
		} finally {
			System.out.println("da chay xong doan code so 5");
		}

		System.out.println("---code4----");
		System.out.println("---code5----");
		System.out.println("---code6----");
	}
}