package net.schastny.intender.web;

import java.util.Map;

import net.schastny.intender.domain.Division;
import net.schastny.intender.service.DivisionService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/divisions*")
public class AdminDivisionsController {
	
	@Autowired
	private DivisionService divisionService;
	
	// Просмотр всех категорий
	@RequestMapping
	public String listCategoriesAll(Map<String, Object> map) {
		map.put("division", new Division());
		map.put("divisionList", divisionService.showAll());
		return "admin_divisions_configurer";
	}

	// Сохранить/обновить категорию
	@RequestMapping(value = "/store", method = RequestMethod.POST)
	public @ResponseBody Division storeCategory(@RequestBody Division category) {
		// TODO Нельзя сохранить большие названия в поле Title
		// TODO Редирект оставить на странице просмотра деталей категории
		divisionService.storeDivision(category);
		return category;
	}

	// Удалить категорию
	@RequestMapping("/delete/{divId}")
	public String deleteCategory(@PathVariable("divId") Integer divId) {
		divisionService.deleteDivision(divId);
		return "redirect:/admin/divisions";
	}

}