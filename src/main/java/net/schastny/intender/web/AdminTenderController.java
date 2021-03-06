package net.schastny.intender.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

//import javax.servlet.ServletContext;
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
        binder.registerCustomEditor(Date.class, "publishDate", dateEditor);
    }
	
	// Сохранить/обновить товар
	@RequestMapping(value = "/store", method = RequestMethod.POST)
	public String storeTender(
			@Valid Tender tender, 
			BindingResult result,
			Map<String, Object> map) {

		String viewResult = "redirect:/admin/"+tender.getDivision().getId();
		CommonsMultipartFile attachedDoc = tender.getAttachedDoc();
		
		// Проверить, подходящее ли расширение у загруженного файла.
		// Если нет - добавить ошибку.
		// TODO Сделать возможность загружать .docx
		String[] types = { "application/msword", "application/vnd.ms-word", "application/vnd.openxmlformats-officedocument.wordprocessingml.document" };
		List<String> allowedContentTypes = Arrays.asList(types);
		String contentType = attachedDoc.getContentType();
		if (!attachedDoc.isEmpty() && !allowedContentTypes.contains(contentType)) {
			FieldError docError = new FieldError("tender", "attachedDoc", "Wrong document file");
			result.addError(docError);
		}
		
		// При добавлении нового тендера поле attachedDoc не должно быть пустым
		// При модифицировании тендера поле attachedDoc может быть пустым
		if (attachedDoc.isEmpty() && tender.getAttachedDocName().equals("-1")){
			FieldError docError = new FieldError("tender", "attachedDoc", "Document should not be empty!");
			result.addError(docError);
		}

		if (!result.hasErrors()) {
			tenderService.storeTender(tender);
		} else {
			viewResult = "admin_tender_storeError";
		}
		return viewResult;
	}

	// store url для get-запроса
	@RequestMapping(value = "/store", method = RequestMethod.GET)
	public String storeTenderGet() {
		return "redirect:/admin";
	}

	// Удалить товар
	@RequestMapping("/delete/{tenderId}")
	public String deleteTender(@PathVariable("tenderId") Integer tenderId) {
		// TODO При удалении всей категории тендеры удаляются, а про файлы я забыл (они не удаляются)
		Tender tender = tenderService.showTender(tenderId);
		tenderService.deleteTender(tenderId);
		return "redirect:/admin/"+tender.getDivision().getId();
	}
	
}
