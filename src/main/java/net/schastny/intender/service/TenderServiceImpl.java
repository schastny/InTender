package net.schastny.intender.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.schastny.intender.dao.TenderDAO;
import net.schastny.intender.domain.Tender;

@Service
public class TenderServiceImpl implements TenderService {

    @Autowired
    private TenderDAO tenderDAO;
	
    @Transactional
	public void storeTender(Tender tender) {
		tenderDAO.storeTender(tender);
	}

    @Transactional
	public void deleteTender(Integer id) {
		tenderDAO.deleteTender(id);
	}
    
    @Transactional
    public List<Tender> showInDivision(Integer divId, int numTenders) {
    	return tenderDAO.selectInDivision(divId, numTenders);
    }

    @Transactional
    public List<Tender> showAllInDivision(Integer divId) {
    	return tenderDAO.selectAllInDivision(divId);
    }

    @Transactional
	public Tender showTender(Integer id) {
		return tenderDAO.selectTender(id);
	}
}
