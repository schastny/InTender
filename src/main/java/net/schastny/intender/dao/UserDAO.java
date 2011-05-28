package net.schastny.intender.dao;

import net.schastny.intender.domain.TenderUser;

public interface UserDAO {
	public void storeUser(TenderUser user);
	public void deleteUser(String username);
	public TenderUser getUser(String username);
}