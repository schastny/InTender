package net.schastny.intender.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.schastny.intender.dao.CategoryDAO;
import net.schastny.intender.domain.Category;

@Service
public class CategoryServiceImpl implements CategoryService {
	
    @Autowired
    private CategoryDAO categoryDAO;

    @Transactional
	@Override
	public void storeCategory(Category category) {
    	categoryDAO.storeCategory(category);
	}

    @Transactional
	@Override
	public void deleteCategory(Integer id) {
    	categoryDAO.deleteCategory(id);
	}

    @Transactional
	@Override
	public List<Category> showAll() {
    	return categoryDAO.selectAll();
	}
    
    @Transactional
	public Category showCategory(Integer id) {
		return categoryDAO.selectCategory(id);
	}

}