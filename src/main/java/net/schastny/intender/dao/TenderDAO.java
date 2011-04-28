package net.schastny.intender.dao;

import java.util.List;

import net.schastny.intender.domain.Tender;

public interface TenderDAO {

	public void storeTender(Tender tender);
	public void deleteTender(Integer id);
	public List<Tender> selectAll();
	public List<Tender> selectAllInDivision(Integer divId);
	public Tender selectDivision(Integer id);
}