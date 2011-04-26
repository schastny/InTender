package net.schastny.intender.dao;

import java.util.List;

import net.schastny.intender.domain.Division;

public interface DivisionDAO {
	
	public void storeDivision(Division division);
	public void deleteDivision(Integer id);
	public List<Division> selectAll();
	public Division selectDivision(Integer id);
}