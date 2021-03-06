package net.schastny.intender.web;

import java.util.Date;
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
@RequestMapping("/admin*")
public class AdminController {
	
	@Autowired
	private TenderService tenderService;

	@Autowired
	private DivisionService divisionService;
	
	// Просмотр всех тендеров
	@RequestMapping
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
		return "admin_home";
	}

	// Просмотр тендеров для филиала
	@RequestMapping(value = "/{divId}", method = RequestMethod.GET)
	public String listTendersInDivision(Map<String, Object> map, @PathVariable("divId") Integer divId) {
		Tender tender = new Tender();
		Division division = divisionService.showDivision(divId);
		tender.setDivision(divisionService.showDivision(divId));
		tender.setPublishDate(new Date());
		tender.setAttachedDocName("-1");

		String resultView = "admin_division";
		if (division != null){
			map.put("tender", tender);
			map.put("division", division);
			map.put("tenderList", tenderService.showAllInDivision(divId));
			map.put("divisionList", divisionService.showAll());
		}else{
			resultView = "redirect:/admin";
		}
		return resultView;
	}
	
	// Просмотр одного теднера
	@RequestMapping(value = "/{divId}/{tenderId}", method = RequestMethod.GET)
	public String listTender(Map<String, Object> map, @PathVariable("divId") Integer divId, @PathVariable("tenderId") Integer tenderId) {
		Tender tender = tenderService.showTender(tenderId);
		String resultView = "admin_tender";
		if (tender != null && tender.getDivision().getId() == divId){
			map.put("tender", tender);
			map.put("divisionList", divisionService.showAll());
		}else{
			resultView = "redirect:/admin";
		}
		return resultView;
	}
}
