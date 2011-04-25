package net.schastny.springcart.web;

import java.util.Map;

import net.schastny.springcart.domain.Category;
import net.schastny.springcart.service.CategoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/category*")
public class AdminCategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	// Просмотр всех категорий
	@RequestMapping
	public String listCategoriesAll(Map<String, Object> map) {
		map.put("category", new Category());
		map.put("categoryList", categoryService.showAll());
		return "admin_cat_configurer";
	}

	// Сохранить/обновить категорию
	@RequestMapping(value = "/store", method = RequestMethod.POST)
	public @ResponseBody Category storeCategory(@RequestBody Category category) {
		// TODO Нельзя сохранить большие названия в поле Title
		// TODO Редирект оставить на странице просмотра деталей категории
		categoryService.storeCategory(category);
		return category;
	}

	// Удалить категорию
	@RequestMapping("/delete/{catId}")
	public String deleteCategory(@PathVariable("catId") Integer catId) {
		categoryService.deleteCategory(catId);
		return "redirect:/admin/category";
	}

}