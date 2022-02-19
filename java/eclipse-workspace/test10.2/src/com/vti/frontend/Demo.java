package com.vti.frontend;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;

import com.vti.backend.Exercise1_test;

public class Demo {
	public static void main(String[] args)
			throws FileNotFoundException, IOException, ClassNotFoundException, SQLException {
		Exercise1_test ex1 = new Exercise1_test();
//		ex1.question1();
//		ex1.question2();
		ex1.question3();
	}
}
