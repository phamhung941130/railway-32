package com.vti.backend.datalayer;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.vti.entity.Department;
import com.vti.ultis.jdbcUltis;

public class DepartmentRepository implements IDepartmentRepository {
	private jdbcUltis jdbc;

	public DepartmentRepository() throws FileNotFoundException, IOException {
		jdbc = new jdbcUltis();
	}

	@Override
	public Department getDepartmentById(int depid) throws ClassNotFoundException, SQLException {
		String sqlGetDepByID = "SELECT * FROM department WHERE DepartmentID = ?";
		PreparedStatement preparedStatement = jdbc.createPrepareStatement(sqlGetDepByID);
		preparedStatement.setInt(1, depid);
		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next()) {
			Department department = new Department();
			department.setId(resultSet.getInt(1));
			department.setName(resultSet.getString(2));
			return department;

		}
		return null;
	}
}
