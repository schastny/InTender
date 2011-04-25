package net.schastny.springcart.dao;

import java.util.List;
import net.schastny.springcart.domain.Item;

public interface ItemDAO {

	public void storeItem(Item item);
	public void deleteItem(Integer id);
	public List<Item> selectAll();
	public List<Item> selectAllInCategory(Integer catId);
	public Item selectItem(Integer id);
}
