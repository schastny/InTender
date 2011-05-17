package net.schastny.intender.service;

import java.util.List;

import net.schastny.intender.domain.Article;

public interface ArticleService {
	
	public void storeArticle(Article article);
	public void deleteArticle(String id);
	public List<Article> getAll();
	public Article getArticle(String id);

}