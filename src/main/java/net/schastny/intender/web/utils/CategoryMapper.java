package net.schastny.intender.web.utils;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import net.schastny.intender.domain.Category;
import net.schastny.intender.service.CategoryService;

public class CategoryMapper {
	
	/*
	 * Преобразовывает список всех категорий в ассоциативный массив для передачи
	 * его в шаблон фримаркера. Особенность шаблона в том, что и ключи и
	 * значения массива будут строками. Так как численные типы в качестве ключа
	 * макрос @spring.formSingleSelect не понимает.
	 */
	public static Map<String, String> getCategoryMap(CategoryService categoryService) {
		List<Category> categoryList = categoryService.showAll();
		LinkedHashMap<String, String> categoryMap = new LinkedHashMap<String, String>();
		for (Category category : categoryList) {
			categoryMap.put(Integer.toString(category.getId()),
					category.getTitle());
		}
		return categoryMap;
	}

}
