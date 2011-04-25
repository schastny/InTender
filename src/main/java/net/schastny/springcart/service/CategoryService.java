package net.schastny.springcart.service;

import java.util.List;

import net.schastny.springcart.domain.Category;

public interface CategoryService {
	
	// админ: добавить категорию
	// админ: редактировать категорию
	public void storeCategory(Category category);

	// админ: удалить категорию
	public void deleteCategory(Integer id);

	// все: список категорий
	public List<Category> showAll();
	
	//все:	категория детально
	public Category showCategory(Integer id);

}