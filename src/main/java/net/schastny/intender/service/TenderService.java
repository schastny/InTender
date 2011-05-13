package net.schastny.intender.service;

import java.util.List;

import net.schastny.intender.domain.Tender;

public interface TenderService {
	public void storeTender(Tender tender);
	public void deleteTender(Integer id);
	public List<Tender> showInDivision(Integer divId, int numTenders);
	public List<Tender> showAllInDivision(Integer divId);
	public Tender showTender(Integer id);
}
