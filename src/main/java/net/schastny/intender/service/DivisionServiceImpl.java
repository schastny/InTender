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
	public void storeCategory(Division category) {
    	divisionDAO.storeCategory(category);
	}

    @Transactional
	@Override
	public void deleteCategory(Integer id) {
    	divisionDAO.deleteCategory(id);
	}

    @Transactional
	@Override
	public List<Division> showAll() {
    	return divisionDAO.selectAll();
	}
    
    @Transactional
	public Division showCategory(Integer id) {
		return divisionDAO.selectCategory(id);
	}

}