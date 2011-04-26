package net.schastny.intender.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.schastny.intender.dao.CategoryDAO;
import net.schastny.intender.domain.Division;

@Service
public class CategoryServiceImpl implements CategoryService {
	
    @Autowired
    private CategoryDAO categoryDAO;

    @Transactional
	@Override
	public void storeCategory(Division category) {
    	categoryDAO.storeCategory(category);
	}

    @Transactional
	@Override
	public void deleteCategory(Integer id) {
    	categoryDAO.deleteCategory(id);
	}

    @Transactional
	@Override
	public List<Division> showAll() {
    	return categoryDAO.selectAll();
	}
    
    @Transactional
	public Division showCategory(Integer id) {
		return categoryDAO.selectCategory(id);
	}

}