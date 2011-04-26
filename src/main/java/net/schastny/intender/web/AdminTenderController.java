package net.schastny.intender.web;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import net.schastny.intender.domain.Tender;
import net.schastny.intender.service.DivisionService;
import net.schastny.intender.service.TenderService;
import net.schastny.intender.web.utils.CategoryMapper;

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
public class AdminTenderController {

	@Autowired
	private TenderService tenderService;
	
	@Autowired
	private DivisionService divisionService;

	// Сохранить/обновить товар
	@RequestMapping(value = "/store", method = RequestMethod.POST)
	public String storeItem(@Valid Tender tender, 
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
			tenderService.storeTender(tender);
		} else {
			viewResult = "admin_storeError";
			map.put("categoryMap", CategoryMapper.getCategoryMap(divisionService));
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
		tenderService.deleteTender(itemId);
		return "redirect:/admin";
	}

}
