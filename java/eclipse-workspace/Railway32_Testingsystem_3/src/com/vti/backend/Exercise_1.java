package com.vti.backend;

import java.util.Random;
import java.util.Scanner;

public class Exercise_1 {
	public void ques1() {
//	Question 1:
//		Khai báo 2 số lương có kiểu dữ liệu là float.
//		Khởi tạo Lương của Account 1 là 5240.5 $
//		Khởi tạo Lương của Account 2 là 10970.055$
//		Khai báo 1 số int để làm tròn Lương của Account 1 và in số int đó ra
//		Khai báo 1 số int để làm tròn Lương của Account 2 và in số int đó ra
		System.out.println("lời giải question1");
		float salary1 = 5240.5f;
		float salary2 = 10970.055f;

		int s1 = (int) salary1;
		System.out.println(s1);
		int s2 = (int) salary2;
		System.out.println(s2);
	}

	public void ques2() {
//		Question 2:
//			Lấy ngẫu nhiên 1 số có 5 chữ số (những số dưới 5 chữ số thì sẽ thêm
//			có số 0 ở đầu cho đủ 5 chữ số)
		Random random = new Random();
		int x = random.nextInt(99999 - 1000 + 1) + 1000;
		String x1 = String.valueOf(x);
		if (x1.length() == 4) {
			System.out.println(0 + x1);
		} else {
			System.out.println(x1);
		}

	}

	public void ques3() {
//	Question 3: 
//	Lấy 2 số cuối của số ở Question 2 và in ra.
//		Gợi ý: 
//		Cách 1: convert số có 5 chữ số ra String, sau đó lấy 2 số cuối
//		Cách 2: chia lấy dư số đó cho 100
		Random random = new Random();
		int x = random.nextInt(99999 - 1000 + 1) + 1000;
		String x1 = String.valueOf(x);
		Integer x2 = Integer.valueOf(x1);
		Integer x3 = x2 % 100;
		System.out.println(x3);
	}

//	Question 4:Viết 1 method nhập vào 2 số nguyên a và b và trả về thương của chúng
	public void ques4() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("moi ban nhap vao so thu 1: ");
		int a = scanner.nextInt();
		System.out.println("moi ban nhap vao so thu 2: ");
		int b = scanner.nextInt();

	}
}
