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
@RequestMapping("/admin*")
public class AdminController {
	
	@Autowired
	private TenderService tenderService;

	@Autowired
	private DivisionService divisionService;
	
	// Просмотр всех тендеров
	@RequestMapping
	public String listTendersAll(Map<String, Object> map) {
		map.put("tender", new Tender());
		map.put("tenderList", tenderService.showAll());
		map.put("divisionMap", DivisionMapper.getDivisionMap(divisionService));
		return "admin_home";
	}

	// Просмотр тендеров для филиала
	@RequestMapping(value = "/shop/{divId}", method = RequestMethod.GET)
	public String listTendersInDivision(Map<String, Object> map, @PathVariable("divId") Integer divId) {

		map.put("division", divId);
		Tender tender = new Tender();
		tender.setDivision(divisionService.showDivision(divId));
		map.put("tender", tender);
		map.put("tenderList", tenderService.showAllInDivision(divId));
		map.put("divisionMap", DivisionMapper.getDivisionMap(divisionService));
		return "admin_division";
	}
	
	// Просмотр одного теднера
	@RequestMapping(value = "/shop/{divId}/{tenderId}", method = RequestMethod.GET)
	public String listTender(Map<String, Object> map, @PathVariable("tenderId") Integer tenderId) {
		Tender tender = tenderService.showTender(tenderId);
		map.put("tender", tender);
		map.put("divisionMap", DivisionMapper.getDivisionMap(divisionService));
		return "admin_tender";
	}
	
	// TODO Редирект после сохранения оставить на странице просмотра деталей тендера
	// TODO Загрузку изображений
	// TODO Сделать красивый вывод тендеров на главной с помощью jQuery
	// TODO Сделать ссылки на удаление и редактирование филиалов доступными только админу.

}
