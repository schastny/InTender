package net.schastny.intender.service;

import java.util.List;

import net.schastny.intender.domain.Division;

public interface DivisionService {
	
	// админ: добавить категорию
	// админ: редактировать категорию
	public void storeDivision(Division division);

	// админ: удалить категорию
	public void deleteDivision(Integer id);

	// все: список категорий
	public List<Division> showAll();
	
	//все:	категория детально
	public Division showDivision(Integer id);

}