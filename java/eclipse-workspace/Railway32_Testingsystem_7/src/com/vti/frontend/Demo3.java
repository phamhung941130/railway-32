package com.vti.frontend;

import com.vti.entity.Toanhoc;

public class Demo3 {
	public static void main(String[] args) {
		Toanhoc toan_hoc = new Toanhoc();

		int sumResul = toan_hoc.sum(1, 2);
		System.out.println("ket qua phep cong 2 so la: " + sumResul);

		int minusResul = toan_hoc.minus(10, 2);
		System.out.println("ket qua phep tru 2 so la: " + minusResul);

		int sumreslut1 = Toanhoc.minus(10, 2);
		int minusResult1 = Toanhoc.minus(20, 10);

	}
}
