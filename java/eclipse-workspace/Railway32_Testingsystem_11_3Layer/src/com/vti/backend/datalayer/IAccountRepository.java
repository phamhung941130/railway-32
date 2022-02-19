package com.vti.backend.datalayer;

import java.sql.SQLException;
import java.util.List;

import com.vti.entity.Account;

public interface IAccountRepository {
	public List<Account> getListAccount() throws ClassNotFoundException, SQLException;
}
