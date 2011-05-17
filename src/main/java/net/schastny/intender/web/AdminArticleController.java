package net.schastny.intender.web;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import net.schastny.intender.domain.Article;
import net.schastny.intender.service.ArticleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/article*")
public class AdminArticleController {
	
	@Autowired
	private ArticleService articleService;
	
	// Просмотр всех статей/создать новую
	@RequestMapping
	public String listAll(Map<String, Object> map) {
		List<Article> articles = articleService.getAll();

		map.put("article", new Article());
		map.put("articleList", articles);
		
		return "admin_article";
	}
	
	// Просмотр/редактирование статьи
	@RequestMapping("/{artId}")
	public String listArticle(Map<String, Object> map, @PathVariable("artId") String artId) {
		Article article = articleService.getArticle(artId);
		List<Article> articles = articleService.getAll();
		
		map.put("article", article);
		map.put("articleList", articles);
		
		return "admin_article";
	}
	
	// Сохранить/обновить статью
	@RequestMapping(value = "/store", method = RequestMethod.POST)
	public String storeArticle(@Valid Article article, BindingResult result) {
		
		String viewResult = "redirect:/admin/article";
		
		if (!result.hasErrors()) {
			articleService.storeArticle(article);
		} else {
			viewResult = "admin_article_storeError";
		}
		
		return viewResult;
	}

	// Удалить статью
	@RequestMapping("/delete/{artId}")
	public String deleteArticle(@PathVariable("artId") String artId) {
		articleService.deleteArticle(artId);
		return "redirect:/admin/article";
	}

}