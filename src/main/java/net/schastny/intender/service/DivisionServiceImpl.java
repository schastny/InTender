package net.schastny.intender.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.schastny.intender.dao.DivisionDAO;
import net.schastny.intender.domain.Division;

@Service
public class DivisionServiceImpl implements DivisionService {
	
    @Autowired
    private DivisionDAO divisionDAO;

    @Transactional
	@Override
	public void storeDivision(Division division) {
    	divisionDAO.storeDivision(division);
	}

    @Transactional
	@Override
	public void deleteDivision(Integer id) {
    	divisionDAO.deleteDivision(id);
	}

    @Transactional
	@Override
	public List<Division> showAll() {
    	return divisionDAO.selectAll();
	}
    
    @Transactional
	public Division showDivision(Integer id) {
		return divisionDAO.selectDivision(id);
	}

}