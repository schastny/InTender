package net.schastny.intender.dao;

import net.schastny.intender.domain.TenderUser;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public TenderUser getUser(String username) {
		return (TenderUser) sessionFactory.getCurrentSession().get(UserDetails.class, username);
	}

	@Override
	public void storeUser(TenderUser user) {
		sessionFactory.getCurrentSession().saveOrUpdate(user);
	}

	@Override
	public void deleteUser(String username) {
		TenderUser user = getUser(username);
		if (null != user) {
			sessionFactory.getCurrentSession().delete(user);
		}
	}
}
