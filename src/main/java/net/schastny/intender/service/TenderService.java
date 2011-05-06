package net.schastny.intender.service;

import java.util.List;

import net.schastny.intender.domain.Tender;

public interface TenderService {
//	админ: добавить товар
//	админ: редактировать товар
	public void storeTender(Tender tender);
	
//	админ: удалить товар
	public void deleteTender(Integer id);

//	все:   список товаров 
//	TODO Подготовить к удалению!! 
	public List<Tender> showAll();
	
	public List<Tender> showInDivision(Integer divId, int numTenders);

	//	все:   список товаров в категории
	public List<Tender> showAllInDivision(Integer divId);
	
//	все:	товар детально
	public Tender showTender(Integer id);

}
