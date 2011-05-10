package net.schastny.intender.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.Map;

import javax.validation.Valid;

import net.schastny.intender.domain.Tender;
import net.schastny.intender.service.TenderService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
@RequestMapping("/admin/tender*")
public class AdminTenderController {

	@Autowired
	private TenderService tenderService;
	
	@InitBinder
    public void initBinder(WebDataBinder binder) {
		DateFormat df = new SimpleDateFormat("dd.MM.yyyy");
		CustomDateEditor dateEditor = new CustomDateEditor(df, true);
        binder.registerCustomEditor(Tender.class, "publishDate", dateEditor);
    }
	
	// Сохранить/обновить товар
	@RequestMapping(value = "/store", method = RequestMethod.POST)
	public String storeTender(@Valid Tender tender, 
			BindingResult result,
			Map<String, Object> map,
			@RequestParam("image") CommonsMultipartFile image) {

//		String[] types = { "image/gif", "image/jpeg", "image/png" };
//		List<String> allowedContentTypes = Arrays.asList(types);
//		String contentType = image.getContentType();
//		if (!allowedContentTypes.contains(contentType) && image.getSize() != 0) {
//			FieldError imgError = new FieldError("tender", "image",
//					"Wrong image file");
//			result.addError(imgError);
//		}

		String viewResult = "redirect:/admin";
		if (!result.hasErrors()) {
			tenderService.storeTender(tender);
		} else {
			viewResult = "admin_storeError";
		}
		return viewResult;
	}

	// url store для get-запроса
	@RequestMapping(value = "/store", method = RequestMethod.GET)
	public String storeTenderGet() {
		return "redirect:/admin";
	}

	// Удалить товар
	@RequestMapping("/delete/{tenderId}")
	public String deleteTender(@PathVariable("tenderId") Integer tenderId) {
		tenderService.deleteTender(tenderId);
		return "redirect:/admin";
	}

}
