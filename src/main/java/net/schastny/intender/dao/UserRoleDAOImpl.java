package net.schastny.intender.dao;

import net.schastny.intender.domain.TenderUserRole;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserRoleDAOImpl implements UserRoleDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public TenderUserRole getUserRole(String userRoleName) {
		return (TenderUserRole) sessionFactory.getCurrentSession().get(TenderUserRole.class, userRoleName);
	}

	@Override
	public void storeUserRole(TenderUserRole userRole) {
		sessionFactory.getCurrentSession().saveOrUpdate(userRole);
	}

	@Override
	public void deleteUserRole(String userRoleName) {
		TenderUserRole userRole = getUserRole(userRoleName);
		if (null != userRole) {
			sessionFactory.getCurrentSession().delete(userRole);
		}
	}
}
