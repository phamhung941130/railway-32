package com.vti.backend;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.vti.DAO.AccountDAO;
import com.vti.entity.Account;
import com.vti.ultis.ScannerUltis;
import com.vti.ultis.jdbcUltis;

public class Exercise3 {
	private jdbcUltis jdbc;
	private AccountDAO accountDAO;

	public Exercise3() throws FileNotFoundException, IOException {
		jdbc = new jdbcUltis();
		accountDAO = new AccountDAO();
	}

	public void question1() throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		System.out.println("In ra thong tin cac ACC co tren he thong");
		List<Account> list = accountDAO.getListAccount();
		String leftAlignFormat = "| %-2d | %-21s | %-15s | %-21s | %-14s | %-16s | %-16s | %n";
		System.out.format(
				"+----+-----------------------+-----------------+-----------------------+----------------+------------------+------------------+%n");
		System.out.format(
				"|ID  | Email                 | Username        |   FullName            | Department     | Position         | Create Date      |%n");
		System.out.format(
				"+----+-----------------------+-----------------+-----------------------+----------------+------------------+------------------+%n");
		for (Account acc : list) {
			System.out.format(leftAlignFormat, acc.getId(), acc.getEmail(), acc.getUserName(), acc.getFullName(),
					acc.getDepartment().getId(), acc.getPosition().getId(), acc.getCreateDate());
			System.out.format(
					"+----+-----------------------+-----------------+-----------------------+----------------+------------------+------------------+%n");
		}

	}

	public void question3() throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		System.out.println("Tìm thông tin Account có ID =5");
		Account acc2 = accountDAO.getAccByID(5);
		if (acc2 != null) {
			String leftAlignFormat = "| %-2d | %-21s | %-15s | %-21s | %-14s | %-16s | %-16s | %n";
			System.out.format(
					"+----+-----------------------+-----------------+-----------------------+----------------+------------------+------------------+%n");
			System.out.format(
					"|ID  | Email                 | Username        |   FullName            | Department     | Position         | Create Date      |%n");
			System.out.format(
					"+----+-----------------------+-----------------+-----------------------+----------------+------------------+------------------+%n");

			System.out.format(leftAlignFormat, acc2.getId(), acc2.getEmail(), acc2.getUserName(), acc2.getFullName(),
					acc2.getDepartment().getName(), acc2.getPosition().getName(), acc2.getCreateDate());

			System.out.format(
					"+----+-----------------------+-----------------+-----------------------+----------------+------------------+------------------+%n");

		} else {
			System.out.println("Không tồn tại phòng này trên HT");
		}

	}

	public void question4() throws ClassNotFoundException, SQLException {
		System.out.println("Kiem tra Account tren he thong");
		System.out.println("Nhap vao Username can kiem tra: ");
		String name = ScannerUltis.inputString();

		boolean checkUsername = accountDAO.isAccountNameExists(name);
		if (checkUsername) {
			System.out.println("Account da ton tai tren he thong");

		} else {
			System.out.println("Account khong ton tai tren he thong");
		}
	}

	public void question5() throws ClassNotFoundException, SQLException, FileNotFoundException, IOException {
		System.out.println("Moi ban tao Account");
		System.out.println("Nhap vao Email");
		String email = ScannerUltis.inputString();
		System.out.println("Nhap vao Username");
		String userName = ScannerUltis.inputString();
		System.out.println("Nhap vao Fullname");
		String fullName = ScannerUltis.inputString();
		System.out.println("Nhap vao Departmentid");
		int depid = ScannerUltis.inputInt();
		System.out.println("Nhap vao Posid");
		int posid = ScannerUltis.inputInt();

		boolean a = accountDAO.createAccount(email, userName, fullName, depid, posid);
		if (a) {
			System.out.println("Create thanh cong!");
			question1();
		} else {
			System.out.println("Create ko thanh cong!");
		}
	}

	public int getMenuQuestion6() {
		while (true) {
			System.out.println(
					"Thong tin can Update: 1.Email, 2.Username, 3.Fullname, 4.DepartmentID, 5.PositionID, 6.Exit");
			int i = ScannerUltis.inputIntPositive();
			if (i == 1 || i == 2 | i == 3 | i == 4 | i == 5 | i == 6) {
				return i;
			} else {
				System.out.println("Nhap lai: ");
			}
		}
	}

	public int getAccid() throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		while (true) {
			System.out.println("Nhap AccountID can Update: ");
			int id = ScannerUltis.inputIntPositive();
			if (accountDAO.getAccByID(id) != null) {
				return id;
			} else {
				System.out.println("Account khong co tren he thong! Nhap lai:");
			}
		}
	}

	public void question6() throws ClassNotFoundException, SQLException, FileNotFoundException, IOException {
		while (true) {
			switch (getMenuQuestion6()) {
			case 1:
				System.out.println("moi ban nhap vao Email moi: ");
				String email = ScannerUltis.inputString();
				if (accountDAO.updateByEmail(email, getAccid())) {
					System.out.println("Update Email Thanh Cong!");
					question1();
				} else {
					System.out.println("Update khong thanh cong, kiem tra lai!");
				}
				break;
			case 2:
				System.out.println("moi ban nhap vao Username moi: ");
				String username = ScannerUltis.inputString();

				if (accountDAO.updateByUsername(username, getAccid())) {
					System.out.println("Update Username Thanh Cong!");
					question1();
				} else {
					System.out.println("Update khong thanh cong, kiem tra lai!");
				}
				break;
			case 3:
				System.out.println("moi ban nhap vao Fullname moi: ");
				String fullname = ScannerUltis.inputString();
				if (accountDAO.updateByFullname(fullname, getAccid())) {
					System.out.println("Update fullname Thanh Cong!");
					question1();
				} else {
					System.out.println("Update khong thanh cong, kiem tra lai!");
				}
				break;
			case 4:
				System.out.println("moi ban nhap vao DepartmentID moi: ");
				int depid = ScannerUltis.inputInt();
				if (accountDAO.updateByDepID(depid, getAccid())) {
					System.out.println("Update Department Thanh Cong!");
					question1();
				} else {
					System.out.println("Update khong thanh cong, kiem tra lai!");
				}
				break;
			case 5:
				System.out.println("moi ban nhap vao PositionID moi: ");
				int posid = ScannerUltis.inputInt();
				if (accountDAO.updateByPosID(posid, getAccid())) {
					System.out.println("Update Position Thanh Cong!");
					question1();
				} else {
					System.out.println("Update khong thanh cong, kiem tra lai!");
				}
				break;
			case 6:
				return;
			}
		}

	}
}
