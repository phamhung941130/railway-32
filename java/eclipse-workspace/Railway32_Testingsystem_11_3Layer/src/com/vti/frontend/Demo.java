package com.vti.frontend;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.vti.backend.presentationlayer.AccountController;
import com.vti.entity.Account;

public class Demo {
	public static void main(String[] args)
			throws FileNotFoundException, IOException, ClassNotFoundException, SQLException {
		AccountController accountController = new AccountController();
		System.out.println("danh sach nhan vien tren he thong");
		List<Account> listAccounts = accountController.getListAccount();
		for (Account account : listAccounts) {
			System.out.println(account.getId() + " " + account.getEmail() + " " + account.getFullName() + " "
					+ account.getDepartment().getName() + " " + account.getPosition().getName() + " "
					+ account.getCreateDate());
		}
	}
}
