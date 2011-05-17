package net.schastny.intender.dao;

import java.util.List;

import net.schastny.intender.domain.Article;

public interface ArticleDAO {
	
	public void storeArticle(Article article);
	public void deleteArticle(String id);
	public List<Article> getAll();
	public Article getArticle(String id);
}