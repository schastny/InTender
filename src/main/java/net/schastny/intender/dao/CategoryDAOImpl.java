package net.schastny.intender.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.schastny.intender.domain.Division;

@Repository
public class CategoryDAOImpl implements CategoryDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void storeCategory(Division category) {
		sessionFactory.getCurrentSession().saveOrUpdate(category);
	}

	@Override
	public void deleteCategory(Integer id) {
		Division category = selectCategory(id);
		if (null != category) {
			sessionFactory.getCurrentSession().delete(category);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Division> selectAll() {
		return sessionFactory.getCurrentSession().createQuery("from Category").list();
	}

	@Override
	public Division selectCategory(Integer id) {
		return (Division) sessionFactory.getCurrentSession().get(Division.class, id);
	}

}