package com.vti.backend.datalayer;

import java.sql.SQLException;

import com.vti.entity.Position;

public interface IPositionRepository {
	public Position getPositionByID(int posid) throws ClassNotFoundException, SQLException;
}
