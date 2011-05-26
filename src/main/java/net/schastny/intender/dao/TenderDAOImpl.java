package net.schastny.intender.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
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
	public List<Tender> selectInDivision(Integer divId, int numTenders) {
		Criteria criteria = sessionFactory.getCurrentSession()
			.createCriteria(Tender.class)
			.add(Restrictions.like("division.id", divId) )
			.addOrder(Order.desc("publishDate"));
		criteria.setMaxResults(numTenders);
		return criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Tender> selectAllInDivision(Integer divId) {
		return sessionFactory.getCurrentSession().createQuery("from Tender where division="+divId+" order by publishDate desc").list();
	}
	
	@Override
	public Tender selectTender(Integer id) {
//		return (Tender) sessionFactory.getCurrentSession().createQuery("from Tender where id="+id).uniqueResult();
		return (Tender) sessionFactory.getCurrentSession().get(Tender.class, id);
	}

}
