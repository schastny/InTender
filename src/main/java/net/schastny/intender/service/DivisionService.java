package net.schastny.intender.service;

import java.util.List;

import net.schastny.intender.domain.Division;

public interface DivisionService {
	
	// админ: добавить категорию
	// админ: редактировать категорию
	public void storeCategory(Division category);

	// админ: удалить категорию
	public void deleteCategory(Integer id);

	// все: список категорий
	public List<Division> showAll();
	
	//все:	категория детально
	public Division showCategory(Integer id);

}