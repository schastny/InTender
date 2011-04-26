package net.schastny.intender.web;

import java.util.Map;

import net.schastny.intender.domain.Tender;
import net.schastny.intender.service.DivisionService;
import net.schastny.intender.service.TenderService;
import net.schastny.intender.web.utils.CategoryMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin*")
public class AdminController {
	
	@Autowired
	private TenderService tenderService;

	@Autowired
	private DivisionService divisionService;
	
	// Просмотр всех товаров
	@RequestMapping
	public String listItemsAll(Map<String, Object> map) {
		map.put("item", new Tender());
		map.put("itemList", tenderService.showAll());
		map.put("categoryMap", CategoryMapper.getCategoryMap(divisionService));
		return "admin_home";
	}

	// Просмотр товаров в категории
	@RequestMapping(value = "/shop/{catId}", method = RequestMethod.GET)
	public String listItemsInCategory(Map<String, Object> map, @PathVariable("catId") Integer catId) {

		map.put("category", catId);
		Tender tender = new Tender();
		tender.setDivision(divisionService.showDivision(catId));
		map.put("item", tender);
		map.put("itemList", tenderService.showAllInDivision(catId));
		map.put("categoryMap", CategoryMapper.getCategoryMap(divisionService));
		return "admin_category";
	}
	
	// Просмотр товара
	@RequestMapping(value = "/shop/{catId}/{itemId}", method = RequestMethod.GET)
	public String listItem(Map<String, Object> map, @PathVariable("itemId") Integer itemId) {
		Tender tender = tenderService.showTender(itemId);
		map.put("item", tender);
		map.put("categoryMap", CategoryMapper.getCategoryMap(divisionService));
		return "admin_item";
	}
	
	// TODO Редирект после сохранения оставить на странице просмотра деталей товара
	// TODO Загрузку изображений
	// TODO Сделать красивый вывод товаров на главной с помощью jQuery
	// TODO Сделать ссылки на удаление и редактирование категорий доступными только админу.

}
