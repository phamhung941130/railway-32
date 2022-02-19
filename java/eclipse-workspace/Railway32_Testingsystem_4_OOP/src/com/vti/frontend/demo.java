package com.vti.frontend;

import com.vti.entity.Mentor;
import com.vti.entity.Trainee;

public class demo {
	public static void main(String[] args) {
		Mentor mentor1 = new Mentor(1, "dao1@gmail.com", "dao1", "nguyendao1", 10);
		Mentor mentor2 = new Mentor(2, "dao2@gmail.com", "dao2", "nguyendao2", 9);
		System.out.println("thong tin 1:" + mentor1.toString());
		System.out.println("thong tin 2:" + mentor2.toString());

		Trainee trainee3 = new Trainee(3, "trainee3@gmail.com", "trainee3", "trainee3a", "BK");
		Trainee trainee4 = new Trainee(4, "trainee4@gmail.com", "trainee4", "trainee4a", "FR");
		System.out.println("thong tin mentor1: " + trainee3.toString());
		System.out.println("thong tin mentor2: " + trainee4.toString());

//		Account account1 = new Account(1, "acc1", "accc1", "acccc1");
//		Account account2 = new Account(2, "acc2", "accc2", "acccc2");
//		System.out.println(account1.toString());
		mentor1.goVTI();
		trainee3.goVTI();

	}
}