package net.schastny.intender.web.utils;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import net.schastny.intender.domain.Division;
import net.schastny.intender.service.DivisionService;

public class DivisionMapper {
	
	/*
	 * Преобразовывает список всех категорий в ассоциативный массив для передачи
	 * его в шаблон фримаркера. Особенность шаблона в том, что и ключи и
	 * значения массива будут строками. Так как численные типы в качестве ключа
	 * макрос @spring.formSingleSelect не понимает.
	 */
	public static Map<String, String> getDivisionMap(DivisionService divisionService) {
		List<Division> divisionList = divisionService.showAll();
		LinkedHashMap<String, String> divisionMap = new LinkedHashMap<String, String>();
		for (Division division : divisionList) {
			divisionMap.put(Integer.toString(division.getId()),
					division.getTitle());
		}
		return divisionMap;
	}

}
