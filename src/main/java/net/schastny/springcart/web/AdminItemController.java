package net.schastny.springcart.web;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import net.schastny.springcart.domain.Item;
import net.schastny.springcart.service.CategoryService;
import net.schastny.springcart.service.ItemService;
import net.schastny.springcart.web.utils.CategoryMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
@RequestMapping("/admin/item*")
public class AdminItemController {

	@Autowired
	private ItemService itemService;
	
	@Autowired
	private CategoryService categoryService;

	// Сохранить/обновить товар
	@RequestMapping(value = "/store", method = RequestMethod.POST)
	public String storeItem(@Valid Item item, 
			BindingResult result,
			Map<String, Object> map,
			@RequestParam("image") CommonsMultipartFile image) {

		String[] types = { "image/gif", "image/jpeg", "image/png" };
		List<String> allowedContentTypes = Arrays.asList(types);
		String contentType = image.getContentType();
		if (!allowedContentTypes.contains(contentType) && image.getSize() != 0) {
			FieldError imgError = new FieldError("item", "image",
					"Wrong image file");
			result.addError(imgError);
		}

		String viewResult = "redirect:/admin";
		if (!result.hasErrors()) {
			itemService.storeItem(item);
		} else {
			viewResult = "admin_storeError";
			map.put("categoryMap", CategoryMapper.getCategoryMap(categoryService));
		}
		return viewResult;
	}

	// url store для get-запроса
	@RequestMapping(value = "/store", method = RequestMethod.GET)
	public String storeItemGet() {
		return "redirect:/admin";
	}

	// Удалить товар
	@RequestMapping("/delete/{itemId}")
	public String deleteItem(@PathVariable("itemId") Integer itemId) {
		itemService.deleteItem(itemId);
		return "redirect:/admin";
	}

}
