package net.schastny.intender.web;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import net.schastny.intender.domain.Tender;
import net.schastny.intender.service.TenderService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
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
	
	@Autowired
	private ServletContext servletContext;
	
//	private String uploadDir = servletContext.getRealPath("/")+"/uploads/";
//	{
//		// Creating directory to save uploaded documents.
//		File dir = new File(uploadDir);
//		dir.mkdir();
//	}
	
	@InitBinder
    public void initBinder(WebDataBinder binder) {
		DateFormat df = new SimpleDateFormat("dd.MM.yyyy");
		CustomDateEditor dateEditor = new CustomDateEditor(df, true);
        binder.registerCustomEditor(Date.class, "publishDate", dateEditor);
    }
	
	// Сохранить/обновить товар
	@RequestMapping(value = "/store", method = RequestMethod.POST)
	public String storeTender(@Valid Tender tender, BindingResult result,
			Map<String, Object> map,
			@RequestParam("attachedDoc") CommonsMultipartFile attachedDoc) {

		String viewResult = "redirect:/admin";

		// TODO Сделать возможность загружать .docx
		String[] types = { "application/msword", "application/vnd.ms-word", "application/vnd.openxmlformats-officedocument.wordprocessingml.document"};
		List<String> allowedContentTypes = Arrays.asList(types);
		String contentType = attachedDoc.getContentType();
		if (!attachedDoc.isEmpty() && !allowedContentTypes.contains(contentType)) {
			FieldError docError = new FieldError("tender", "attachedDoc", "Wrong document file");
			result.addError(docError);
		}

		if (!result.hasErrors()) {
			// store the bytes somewhere
			try {
//				File destinationFile = new File(uploadDir+"1.doc");
//				attachedDoc.transferTo(destinationFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// !store the bytes somewhere
			
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
