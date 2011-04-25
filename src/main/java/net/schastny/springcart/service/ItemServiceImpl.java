package net.schastny.springcart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.schastny.springcart.dao.ItemDAO;
import net.schastny.springcart.domain.Item;

@Service
public class ItemServiceImpl implements ItemService {

    @Autowired
    private ItemDAO itemDAO;
	
    @Transactional
	public void storeItem(Item item) {
		itemDAO.storeItem(item);
	}

    @Transactional
	public void deleteItem(Integer id) {
		itemDAO.deleteItem(id);
	}
    
    @Transactional
	public List<Item> showAll() {
		return itemDAO.selectAll();
	}
    
    @Transactional
    public List<Item> showAllInCategory(Integer catId) {
    	return itemDAO.selectAllInCategory(catId);
    }

    @Transactional
	public Item showItem(Integer id) {
		return itemDAO.selectItem(id);
	}
    
}
