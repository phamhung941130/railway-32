package com.vti.entity;

public class HinhTron extends HinhHoc {

	public HinhTron(float a, float b) throws HinhHocException {
		super(a, b);
		// TODO Auto-generated constructor stub
	}

	@Override
	public float tinhChuVi(float a, float b) {
		return 2 * a * (Configs.PI);
	}

	@Override
	public float tinhDienTich(float a, float b) {
		return (float) (Configs.PI * (Math.pow(a, 2)));
	}

}
