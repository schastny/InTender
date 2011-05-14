package net.schastny.intender.service;

import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserManagerService extends UserDetailsService{
	public void createUser(String divisionId);
}
