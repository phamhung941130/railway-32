package com.vti.entity;

public class HinhHocException extends Exception {
	public HinhHocException() {
		super("sl hinh da tao vuot qua sl cho phep la: " + Configs.slhtd + " hay kiem tra lai");
	}
}
