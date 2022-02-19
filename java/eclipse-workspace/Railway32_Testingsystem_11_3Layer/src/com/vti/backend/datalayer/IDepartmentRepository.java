package com.vti.backend.datalayer;

import java.sql.SQLException;

import com.vti.entity.Department;

public interface IDepartmentRepository {
	public Department getDepartmentById(int depid) throws ClassNotFoundException, SQLException;
}
