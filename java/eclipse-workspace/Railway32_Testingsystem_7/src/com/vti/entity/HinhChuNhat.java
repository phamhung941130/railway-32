package com.vti.entity;

public class HinhChuNhat extends HinhHoc {
	public HinhChuNhat(float a, float b) throws HinhHocException {
		super(a, b);
		// TODO Auto-generated constructor stub
	}

	@Override
	public float tinhChuVi(float a, float b) {
		return 2 * (a + b);
	}

	@Override
	public float tinhDienTich(float a, float b) {
		return (a * b);
	}

}
