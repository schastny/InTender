package net.schastny.springcart.service;

import java.util.List;

import net.schastny.springcart.domain.Item;

public interface ItemService {
//	админ: добавить товар
//	админ: редактировать товар
	public void storeItem(Item item);
	
//	админ: удалить товар
	public void deleteItem(Integer id);

//	все:   список товаров
	public List<Item> showAll();

//	все:   список товаров в категории
	public List<Item> showAllInCategory(Integer catId);
	
//	все:	товар детально
	public Item showItem(Integer id);

}
