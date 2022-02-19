package com.vti.backend.businesslayer;

import java.sql.SQLException;
import java.util.List;

import com.vti.entity.Account;

public interface IAccountService {
	public List<Account> getListAccount() throws ClassNotFoundException, SQLException;

}
