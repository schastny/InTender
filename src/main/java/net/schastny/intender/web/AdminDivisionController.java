package net.schastny.intender.web;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import net.schastny.intender.domain.Division;
import net.schastny.intender.service.DivisionService;
import net.schastny.intender.service.UserManagerService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/division*")
public class AdminDivisionController {
	
	@Autowired
	private DivisionService divisionService;

	@Autowired
	private UserManagerService userService;
	
	// Просмотр всех категорий
	@RequestMapping
	public String listDivisionsAll(Map<String, Object> map) {
		List<Division> divisions = divisionService.showAll();

		map.put("division", new Division());
		map.put("divisionList", divisions);
		
		return "admin_division_new";
	}

	// Сохранить/обновить категорию
	@RequestMapping(value = "/store", method = RequestMethod.POST)
	public String storeDivision(@Valid Division division, BindingResult result) {
		
		String viewResult = "redirect:/admin";
		if (division.getId() != 0){
			viewResult += "/"+division.getId();
		}
		
		if (!result.hasErrors()) {
			userService.createOrUpdateUserForDivision(division);
			divisionService.storeDivision(division);
		} else {
			viewResult = "admin_division_storeError";
		}
		return viewResult;
	}

	// TODO Ограничить доступ к удалению категорий и тендеров, редактированию статей (Это можно делать только админу)
	// Удалить категорию
	@RequestMapping("/delete/{divId}")
	public String deleteDivision(@PathVariable("divId") Integer divId) {
		Division division = divisionService.showDivision(divId);
		userService.deleteUser(division.getManagerEmail());
		divisionService.deleteDivision(divId);
		return "redirect:/admin";
	}

}