package com.vti.frontend;

import com.vti.entity.Account;
import com.vti.entity.Department;
import com.vti.entity.Position;
import com.vti.entity.Position.positionName;
import com.vti.ultis.ScannerUltis;

public class Demo8 {
	public static void main(String[] args) {
//		createDepartment();
//		createAccount();
		while (true) {
			System.out.println("+--------------------------------------------------------------------------+");

			System.out.printf("|%-74s|%n", "                           Moi ban chon chuc nang");
			System.out.println("+--------------------------------------------------------------------------+");
			System.out.printf("|%-74s|%n", "                               Choose please");
			System.out.println("+--------------------------------------------------------------------------+");

			System.out.printf("|%-74s|%n", "1.Tao moi Account");
			System.out.printf("|%-74s|%n", "2.Tao moi Department");
			System.out.printf("|%-74s|%n", "3.Exit");
			System.out.println("+--------------------------------------------------------------------------+");
			int choose = ScannerUltis.inputInt();
			switch (choose) {
			case 1:
				createAccount();
				break;
			case 2:
				createDepartment();
				break;
			case 3:
				return;
			default:
				break;
			}
		}

	}

	private static void createDepartment() {

		System.out.println("--moi ban tao moi phong ban--");
		Department department = new Department();
		System.out.println("moi ban nhap vao id: ");
		department.id = ScannerUltis.inputInt();

		System.out.println("moi ban nhap vao ten cua phong ban: ");
		department.name = ScannerUltis.inputString();

		System.out
				.println("Thong tin phong ban ban vua nhap vao co ID: " + department.id + " Name: " + department.name);

	}

	private static void createAccount() {
		System.out.println("--moi ban nhap vao 1 Account--");
		Account account = new Account();
		System.out.println("moi ban nhap vao ID: " + account.id);
		account.id = ScannerUltis.inputInt();

		System.out.println("moi ban nhap vao email: " + account.email);
		account.email = ScannerUltis.inputString();

		System.out.println("moi ban nhap vao userName: " + account.userName);
		account.userName = ScannerUltis.inputString();

		System.out.println("moi ban nhap vao fullName: " + account.fullName);
		account.fullName = ScannerUltis.inputString();

		System.out.println("moi ban nhap vao posittion: 1.Dev, 2.Test, 3.Scrum_Master, 4.PM");
		int choose = ScannerUltis.inputInt();
		switch (choose) {
		case 1:
			Position position1 = new Position();
			position1.name = positionName.Dev;
			account.position = position1;
			break;
		case 2:
			Position position2 = new Position();
			position2.name = positionName.Test;
			account.position = position2;
			break;
		case 3:
			Position position3 = new Position();
			position3.name = positionName.Scrum_Master;
			account.position = position3;
			break;
		case 4:
			Position position4 = new Position();
			position4.name = positionName.PM;
			account.position = position4;
			break;
		default:
			System.out.println("Ban ko chon dung yc!");
			break;
		}
		System.out.println("thong tin Account vua nhap la: ");
		System.out.println("ID: " + account.id);
		System.out.println("Email: " + account.email);
		System.out.println("Username: " + account.userName);
		System.out.println("Fullname: " + account.fullName);
		System.out.println("Posittion: " + account.position.name);

	}
}
