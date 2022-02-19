package com.vti.backend.datalayer;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.vti.entity.Position;
import com.vti.ultis.jdbcUltis;

public class PositionRepository implements IPositionRepository {
	private jdbcUltis jdbc;

	public PositionRepository() throws FileNotFoundException, IOException {
		jdbc = new jdbcUltis();
	}

	@Override
	public Position getPositionByID(int posid) throws ClassNotFoundException, SQLException {
		String sqlpos = "SELECT * FROM position WHERE PositionID = ?";

		PreparedStatement preparedStatement = jdbc.createPrepareStatement(sqlpos);
		preparedStatement.setInt(1, posid);
		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next()) {
			Position position = new Position();
			position.setId(resultSet.getInt(1));
			position.setName(resultSet.getString(2));
			return position;

		}
		return null;
	}
}
