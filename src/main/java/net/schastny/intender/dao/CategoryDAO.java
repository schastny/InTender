package net.schastny.intender.dao;

import java.util.List;

import net.schastny.intender.domain.Division;

public interface CategoryDAO {
	
	public void storeCategory(Division category);
	public void deleteCategory(Integer id);
	public List<Division> selectAll();
	public Division selectCategory(Integer id);
}