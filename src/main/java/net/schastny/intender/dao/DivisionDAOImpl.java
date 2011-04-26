package net.schastny.intender.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.schastny.intender.domain.Division;

@Repository
public class DivisionDAOImpl implements DivisionDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void storeDivision(Division division) {
		sessionFactory.getCurrentSession().saveOrUpdate(division);
	}

	@Override
	public void deleteDivision(Integer id) {
		Division division = selectDivision(id);
		if (null != division) {
			sessionFactory.getCurrentSession().delete(division);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Division> selectAll() {
		return sessionFactory.getCurrentSession().createQuery("from Division").list();
	}

	@Override
	public Division selectDivision(Integer id) {
		return (Division) sessionFactory.getCurrentSession().get(Division.class, id);
	}

}