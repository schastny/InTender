package net.schastny.intender.service;

import java.util.List;

import net.schastny.intender.domain.Division;

public interface DivisionService {
	public void storeDivision(Division division);
	public void deleteDivision(Integer id);
	public List<Division> showAll();
	public Division showDivision(Integer id);
}