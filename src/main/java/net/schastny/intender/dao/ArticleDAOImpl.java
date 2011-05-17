package net.schastny.intender.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.schastny.intender.domain.Article;

@Repository
public class ArticleDAOImpl implements ArticleDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void storeArticle(Article article) {
		sessionFactory.getCurrentSession().saveOrUpdate(article);
	}

	@Override
	public void deleteArticle(Integer id) {
		Article article = getArticle(id);
		if (null != article) {
			sessionFactory.getCurrentSession().delete(article);
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Article> getAll() {
		return sessionFactory.getCurrentSession().createQuery("from Article").list();
	}

	@Override
	public Article getArticle(Integer id) {
		return (Article) sessionFactory.getCurrentSession().get(Article.class, id);
	}

}