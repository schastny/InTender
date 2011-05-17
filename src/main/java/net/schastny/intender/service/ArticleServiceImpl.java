package net.schastny.intender.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.schastny.intender.dao.ArticleDAO;
import net.schastny.intender.domain.Article;

@Service
public class ArticleServiceImpl implements ArticleService {
	
    @Autowired
    private ArticleDAO articleDAO;

    @Transactional
	@Override
	public void storeArticle(Article article) {
    	articleDAO.storeArticle(article);
	}

    @Transactional
	@Override
	public void deleteArticle(String id) {
    	articleDAO.deleteArticle(id);
	}
    
    @Transactional
	@Override
	public List<Article> getAll() {
    	return articleDAO.getAll();
	}

    @Transactional
	public Article getArticle(String id) {
		return articleDAO.getArticle(id);
	}
}