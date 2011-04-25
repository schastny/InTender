package net.schastny.springcart.dao;

import java.util.List;
import net.schastny.springcart.domain.Category;

public interface CategoryDAO {
	
	public void storeCategory(Category category);
	public void deleteCategory(Integer id);
	public List<Category> selectAll();
	public Category selectCategory(Integer id);
}