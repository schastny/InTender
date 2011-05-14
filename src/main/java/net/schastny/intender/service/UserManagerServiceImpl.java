package net.schastny.intender.service;

import java.util.ArrayList;
import java.util.Collection;

import net.schastny.intender.dao.UserDAO;
import net.schastny.intender.dao.UserRoleDAO;
import net.schastny.intender.domain.Division;
import net.schastny.intender.domain.TenderUser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userDetailsService") 
public class UserManagerServiceImpl implements UserManagerService {
	
	@Autowired
	private UserDAO userDao;

	@Autowired
	private UserRoleDAO userRoleDao;

	@Transactional(readOnly = true)
	public UserDetails loadUserByUsername(String login)
			throws UsernameNotFoundException, DataAccessException {
		
		TenderUser userEntity = userDao.getUser(login);
		if (null == userEntity) {
			throw new UsernameNotFoundException("user not found in database");
		}
		
	 	String userName = userEntity.getUsername();
	    String password = userEntity.getPassword();
	    boolean enabled 				= true;
	    boolean accountNonExpired 		= true;
	    boolean credentialsNonExpired 	= true;
	    boolean accountNonLocked 		= true;
	    Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
	    authorities.add(new GrantedAuthorityImpl(userEntity.getRole().getRoleName()));

	    User springSecurityUser = new User(userName, password, enabled,
	      accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		
		return springSecurityUser;
	}
	
	@Transactional
	public void createUserForDivision(Division division){
		TenderUser user = new TenderUser();
		// TODO Переделать название пользователя!
		user.setUsername("manager"+division.getManagerEmail());
		user.setPassword("1111");
		user.addRole(userRoleDao.getUserRole("ROLE_USER"));
		userDao.storeUser(user);
	}
}
