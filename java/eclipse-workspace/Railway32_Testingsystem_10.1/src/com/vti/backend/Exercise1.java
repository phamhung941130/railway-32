package com.vti.backend;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.vti.ultis.ScannerUltis;
import com.vti.ultis.jdbcUltis;

public class Exercise1 {
	private jdbcUltis jdbc;

	public Exercise1() throws FileNotFoundException, IOException {
		jdbc = new jdbcUltis();
	}

	public void question1() throws ClassNotFoundException, SQLException {
		System.out.println("--------Test ket noi-------");
		jdbc.connnectionTestting();
	}

	public void question2() throws ClassNotFoundException, SQLException {
		System.out.println("----In ra thong tin du lieu bang Position----");
		String sql = "SELECT* FROM position";

		ResultSet resultPosition = jdbc.executeQuery(sql);
		System.out.println("Thong tin Position co tren he thong la");
		System.out.println("+--------+-----------------------------+");
		System.out.println("|    ID  |        Position Name        |");
		System.out.println("+--------+-----------------------------+");

		while (resultPosition.next()) {
//			System.out.println(resultPosition.getInt(1) + "     " + resultPosition.getString(2));
			System.out.format("|%-8d|%-29s|%n", resultPosition.getInt("PositionID"),
					resultPosition.getString("PositionName"));
		}
		System.out.println("+--------+-----------------------------+");

	}

	public void question3() throws ClassNotFoundException, SQLException {
		System.out.println("----Them moi 1 Position-----");
		String sqlInsert = "INSERT INTO `position`(PositionName) \r\n" + "VALUES 				(?)";
		System.out.println("Moi ban nhap:");
		String positionName = ScannerUltis.inputString();
		PreparedStatement preparedStatement = jdbc.createPrepareStatement(sqlInsert);
		preparedStatement.setString(1, positionName);

		int result = preparedStatement.executeUpdate();
		if (result == 1) {
			System.out.println("them moi thanh cong");
			question2();
		} else {
			System.out.println("Da co loi xay ra!");
		}
	}

	public void question4() throws ClassNotFoundException, SQLException {
		System.out.println(" Update Position: ");
		String sqlUpdate = "UPDATE testingsystem.position SET PositionName = (?) WHERE PositionID = (?)";
		System.out.println("moi ban nhap vao Ten muon thay doi: ");
		String positionNameUpdate = ScannerUltis.inputString();
		System.out.println("moi ban nhap vao ID Position can thay doi: ");
		int positionId = ScannerUltis.inputIntPositive();
		PreparedStatement peStatement = jdbc.createPrepareStatement(sqlUpdate);
		peStatement.setString(1, positionNameUpdate);
		peStatement.setInt(2, positionId);
		if (peStatement.executeUpdate() == 1) {
			System.out.println("Update thanh cong");
			question2();
		} else {
			System.out.println("co loi xay ra");
		}
	}

	public void question5() throws ClassNotFoundException, SQLException {
		System.out.println("Delete Position theo ID nhap vao: ");
		String sqlDelete = "DELETE FROM testingsystem.position WHERE PositionID = (?)";
		System.out.println("Moi ban nhap vao ID can xoa: ");
		int idDelete = ScannerUltis.inputIntPositive();
		PreparedStatement peStatement = jdbc.createPrepareStatement(sqlDelete);
		peStatement.setInt(1, idDelete);
		if (peStatement.executeUpdate() == 1) {
			System.out.println("del thanh cong");
			question2();
		} else {
			System.out.println("co loi xay ra");
		}
	}
}
