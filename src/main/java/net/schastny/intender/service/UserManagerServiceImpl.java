package net.schastny.intender.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collection;

import net.schastny.intender.dao.UserDAO;
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
	private DivisionService divisionService;

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
	    authorities.add(new GrantedAuthorityImpl(userEntity.getRole()));

	    User springSecurityUser = new User(userName, password, enabled,
	      accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		
		return springSecurityUser;
	}
	
	// TODO Запретить использовать для разных категорий одного пользователя
	@Transactional
	public void createOrUpdateUserForDivision(Division division){
		TenderUser newUser = new TenderUser();
		newUser.setUsername(division.getManagerEmail());
		newUser.addRole("ROLE_USER");
		try {
			newUser.setPassword(hash(division.getManagerPassword()));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} 
		int divId = division.getId();
		if (divId != 0){
			// We are about to update existing division
			String oldUserName = divisionService.showDivision(divId).getManagerEmail();
			String newUserName = division.getManagerEmail();
			
			// Check if the user will be the same or not
			if (!newUserName.equals(oldUserName)){
				userDao.deleteUser(oldUserName);
			}
		}
		userDao.storeUser(newUser);
	}
	
	@Transactional
	public void deleteUser(String username){
		userDao.deleteUser(username);
	}

	private String hash(String password) throws NoSuchAlgorithmException {
		byte[] passwordBytes = password.getBytes();
		MessageDigest md5 = MessageDigest.getInstance("MD5");
		md5.reset();
		md5.update(passwordBytes);
		byte hash[] = md5.digest();

		StringBuffer hexString = new StringBuffer();
		for (byte aByte:hash) {
			String byteString = Integer.toHexString(0xFF & aByte);
			String result = (byteString.length()<2)?"0"+byteString:byteString;
			hexString.append(result);
		}		
		return hexString.toString();
	}
}
