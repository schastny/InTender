package net.schastny.intender.web;

import java.util.Map;

import net.schastny.intender.domain.Item;
import net.schastny.intender.service.CategoryService;
import net.schastny.intender.service.ItemService;
import net.schastny.intender.web.utils.CategoryMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@Autowired
	private ItemService itemService;

	@Autowired
	private CategoryService categoryService;

	// Просмотр всех товаров
	@RequestMapping(value = { "/", "/index", "/shop" })
	public String listItemsAll(Map<String, Object> map) {
		map.put("item", new Item());
		map.put("itemList", itemService.showAll());
		map.put("categoryMap", CategoryMapper.getCategoryMap(categoryService));
		return "main_home";
	}

	// Просмотр товаров в категории
	@RequestMapping(value = "/shop/{catId}", method = RequestMethod.GET)
	public String listItemsInCategory(Map<String, Object> map, @PathVariable("catId") Integer catId) {

		map.put("category", catId);
		Item item = new Item();
		item.setCategory(categoryService.showCategory(catId));
		map.put("item", item);
		map.put("itemList", itemService.showAllInCategory(catId));
		map.put("categoryMap", CategoryMapper.getCategoryMap(categoryService));
		return "main_category";
	}
	
	// Просмотр товара
	@RequestMapping(value = "/shop/{catId}/{itemId}", method = RequestMethod.GET)
	public String listItem(Map<String, Object> map, @PathVariable("itemId") Integer itemId) {
		Item item = itemService.showItem(itemId);
		map.put("item", item);
		map.put("categoryMap", CategoryMapper.getCategoryMap(categoryService));
		return "main_item";
	}
	
	// TODO Редирект после сохранения оставить на странице просмотра деталей товара
	// TODO Загрузку изображений
	// TODO Сделать красивый вывод товаров на главной с помощью jQuery
	// TODO Сделать ссылки на удаление и редактирование категорий доступными только админу.
}