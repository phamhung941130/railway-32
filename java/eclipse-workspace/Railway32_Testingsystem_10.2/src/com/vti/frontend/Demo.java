package com.vti.frontend;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;

import com.vti.backend.Exercise2;
import com.vti.ultis.ScannerUltis;
import com.vti.ultis.jdbcUltis;

public class Demo {
	public static void main(String[] args)
			throws FileNotFoundException, IOException, ClassNotFoundException, SQLException {
		jdbcUltis jdbc = new jdbcUltis();
		jdbc.connnectionTestting();
		while (true) {
			String leftAlignFormat = "| %-72s |%n";
			System.out.format("+--------------------------------------------------------------------------+%n");
			System.out.format("|                        Choose please                                     |%n");
			System.out.format("+--------------------------------------------------------------------------+%n");
			System.out.format(leftAlignFormat, "1. Question 1: Lay danh sach Department co tren he thong");
			System.out.format(leftAlignFormat, "2. Question 2: Tim phong ban theo ID ");
			System.out.format(leftAlignFormat, "2. Question 4: Kiem tra phong ban tren he thong ");

			System.out.format(leftAlignFormat, "5. Question 5: Tao moi Department ");
			System.out.format(leftAlignFormat, "6. Question 6: Update Department ");
			System.out.format(leftAlignFormat, "7. Question 7: Delete Department ");
			System.out.format(leftAlignFormat, "8.Question 8: Exit");
			System.out.format("+--------------------------------------------------------------------------+%n");

			int choose = ScannerUltis.inputIntPositive();
			Exercise2 exercise2 = new Exercise2();
			switch (choose) {
			case 1:
				exercise2.question1();
				break;
			case 2:
				exercise2.question2();
				break;
			case 4:
				exercise2.question4();
				break;
			case 5:
				exercise2.question5();
				break;
			case 6:
				exercise2.question6();
				break;
			case 7:
				exercise2.question7();
				break;
			case 8:

				return;

			}
		}
	}

}
