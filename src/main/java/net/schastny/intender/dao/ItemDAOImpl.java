package net.schastny.intender.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.schastny.intender.domain.Item;

@Repository
public class ItemDAOImpl implements ItemDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void storeItem(Item item) {
		sessionFactory.getCurrentSession().saveOrUpdate(item);
	}

	@Override
	public void deleteItem(Integer id) {
		Item item = selectItem(id);
		if (null != item) {
			sessionFactory.getCurrentSession().delete(item);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Item> selectAll() {
		return sessionFactory.getCurrentSession().createQuery("from Item").list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Item> selectAllInCategory(Integer catId) {
		return sessionFactory.getCurrentSession().createQuery("from Item where category="+catId).list();
	}
	
	@Override
	public Item selectItem(Integer id) {
//		return (Item) sessionFactory.getCurrentSession().createQuery("from Item where id="+id).uniqueResult();
		return (Item) sessionFactory.getCurrentSession().get(Item.class, id);
	}

	
	

}
