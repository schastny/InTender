package net.schastny.intender.web;

import java.util.Map;

import net.schastny.intender.domain.Tender;
import net.schastny.intender.service.DivisionService;
import net.schastny.intender.service.TenderService;
import net.schastny.intender.web.utils.DivisionMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@Autowired
	private TenderService tenderService;

	@Autowired
	private DivisionService divisionService;

	// Просмотр всех товаров
	@RequestMapping(value = { "/", "/index", "/tenders" })
	public String listTendersAll(Map<String, Object> map) {
		map.put("tender", new Tender());
		map.put("tenderList", tenderService.showAll());
		map.put("divisionMap", DivisionMapper.getDivisionMap(divisionService));
		return "main_home";
	}

	// Просмотр товаров в категории
	@RequestMapping(value = "/tenders/{divId}", method = RequestMethod.GET)
	public String listTendersInDivision(Map<String, Object> map, @PathVariable("divId") Integer divId) {

		map.put("division", divId);
		Tender tender = new Tender();
		tender.setDivision(divisionService.showDivision(divId));
		map.put("tender", tender);
		map.put("tenderList", tenderService.showAllInDivision(divId));
		map.put("divisionMap", DivisionMapper.getDivisionMap(divisionService));
		return "main_category";
	}
	
	// Просмотр товара
	@RequestMapping(value = "/tenders/{divId}/{tenderId}", method = RequestMethod.GET)
	public String listTender(Map<String, Object> map, @PathVariable("tenderId") Integer tenderId) {
		Tender tender = tenderService.showTender(tenderId);
		map.put("tender", tender);
		map.put("divisionMap", DivisionMapper.getDivisionMap(divisionService));
		return "main_tender";
	}
	
	// TODO Редирект после сохранения оставить на странице просмотра деталей товара
	// TODO Загрузку изображений
	// TODO Сделать красивый вывод товаров на главной с помощью jQuery
	// TODO Сделать ссылки на удаление и редактирование категорий доступными только админу.
}