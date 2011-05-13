package net.schastny.intender.web;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import net.schastny.intender.domain.Division;
import net.schastny.intender.domain.Tender;
import net.schastny.intender.service.DivisionService;
import net.schastny.intender.service.TenderService;
import net.schastny.intender.web.utils.TendersByDivisionHolder;

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

	// Просмотр всех тендеров
	@RequestMapping(value = { "/", "/index", "/tenders" })
	public String listTendersAll(Map<String, Object> map) {
		List<Division> divisions = divisionService.showAll();
		List<TendersByDivisionHolder> tendersByDivision = new LinkedList<TendersByDivisionHolder>();
		for(Division div : divisions){
			List<Tender> tenders = tenderService.showInDivision(div.getId(), 4);
			TendersByDivisionHolder holder = new TendersByDivisionHolder(div, tenders);
			tendersByDivision.add(holder);
		}
		map.put("divisionList", divisions);
		map.put("tendersByDivision", tendersByDivision);
		return "main_home";
	}

	// Просмотр тендеров в категории
	@RequestMapping(value = "/tenders/{divId}", method = RequestMethod.GET)
	public String listTendersInDivision(Map<String, Object> map, @PathVariable("divId") Integer divId) {
		Division division = divisionService.showDivision(divId);
		String resultView = "main_division";
		if (division != null){
			map.put("division", division);
			map.put("tenderList", tenderService.showAllInDivision(divId));
			map.put("divisionList", divisionService.showAll());
		}else{
			resultView = "redirect:/index";
		}
		return resultView;
	}
	
	// Просмотр одного тендера
	@RequestMapping(value = "/tenders/{divId}/{tenderId}", method = RequestMethod.GET)
	public String listTender(Map<String, Object> map, @PathVariable("divId") Integer divId, @PathVariable("tenderId") Integer tenderId) {
		Tender tender = tenderService.showTender(tenderId);
		String resultView = "main_tender";
		if (tender != null && tender.getDivision().getId() == divId){
			map.put("tender", tender);
			map.put("divisionList", divisionService.showAll());
		}else{
			resultView = "redirect:/index";
		}
		return resultView;
	}
}