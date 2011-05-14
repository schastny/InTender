package net.schastny.intender.dao;

import net.schastny.intender.domain.TenderUserRole;

public interface UserRoleDAO {
	
	public void storeUserRole(TenderUserRole userRole);
	public void deleteUserRole(String userRoleName);
	public TenderUserRole getUserRole(String userRoleName);

}
