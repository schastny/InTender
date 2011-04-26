package net.schastny.intender.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.schastny.intender.domain.Category;

@Repository
public class CategoryDAOImpl implements CategoryDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void storeCategory(Category category) {
		sessionFactory.getCurrentSession().saveOrUpdate(category);
	}

	@Override
	public void deleteCategory(Integer id) {
		Category category = selectCategory(id);
		if (null != category) {
			sessionFactory.getCurrentSession().delete(category);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> selectAll() {
		return sessionFactory.getCurrentSession().createQuery("from Category").list();
	}

	@Override
	public Category selectCategory(Integer id) {
		return (Category) sessionFactory.getCurrentSession().get(Category.class, id);
	}

}