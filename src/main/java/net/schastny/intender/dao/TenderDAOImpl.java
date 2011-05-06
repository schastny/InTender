package net.schastny.intender.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.schastny.intender.domain.Tender;

@Repository
public class TenderDAOImpl implements TenderDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void storeTender(Tender tender) {
		sessionFactory.getCurrentSession().saveOrUpdate(tender);
	}

	@Override
	public void deleteTender(Integer id) {
		Tender tender = selectTender(id);
		if (null != tender) {
			sessionFactory.getCurrentSession().delete(tender);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Tender> selectAll() {
		return sessionFactory.getCurrentSession().createQuery("from Tender").list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Tender> selectAllInDivision(Integer divId) {
		return sessionFactory.getCurrentSession().createQuery("from Tender where division="+divId).list();
	}
	
	@Override
	public Tender selectTender(Integer id) {
//		return (Tender) sessionFactory.getCurrentSession().createQuery("from Tender where id="+id).uniqueResult();
		return (Tender) sessionFactory.getCurrentSession().get(Tender.class, id);
	}

}
