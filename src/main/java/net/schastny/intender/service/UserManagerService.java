package net.schastny.intender.service;

import net.schastny.intender.domain.Division;

import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserManagerService extends UserDetailsService{
	public void createUserForDivision(Division division);
}
