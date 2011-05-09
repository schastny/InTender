package net.schastny.intender.web;

import java.util.Map;

import javax.validation.Valid;

import net.schastny.intender.domain.Division;
import net.schastny.intender.service.DivisionService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/divisions*")
public class AdminDivisionsController {
	
	@Autowired
	private DivisionService divisionService;
	
	// Просмотр всех категорий
	@RequestMapping
	public String listDivisionsAll(Map<String, Object> map) {
		map.put("division", new Division());
		map.put("divisionList", divisionService.showAll());
		return "admin_divisions_configurer";
	}

	// Сохранить/обновить категорию
	@RequestMapping(value = "/store", method = RequestMethod.POST)
	public String storeDivision(@Valid Division division, BindingResult result) {
		String viewResult = "redirect:/admin";
		if (!result.hasErrors()) {
			divisionService.storeDivision(division);
		} else {
			viewResult = "admin_storeError_division";
		}
		// TODO Нельзя сохранить большие названия в поле Title
		// TODO Редирект оставить на странице просмотра деталей категории
		return viewResult;
	}

	// Удалить категорию
	@RequestMapping("/delete/{divId}")
	public String deleteDivision(@PathVariable("divId") Integer divId) {
		divisionService.deleteDivision(divId);
		return "redirect:/admin/divisions";
	}

}