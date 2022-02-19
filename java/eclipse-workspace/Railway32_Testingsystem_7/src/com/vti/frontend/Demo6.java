package com.vti.frontend;

import com.vti.entity.Xe;

public class Demo6 {
	public static void main(String[] args) {
		Xe oto = new Xe(150);
		oto.setId(1);
		oto.setName("kia morning");

		System.out.println("thong tin xe la");
		System.out.println(oto.toString());

		Xe xemay = new Xe(90);
		xemay.setId(2);
		xemay.setName("Wave");
		System.out.println("thong tin xe may la");
		System.out.println(xemay.toString());
	}
}
