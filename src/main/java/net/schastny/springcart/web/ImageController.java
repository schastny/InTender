package net.schastny.springcart.web;

import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import net.schastny.springcart.service.ItemService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


/*
 *  Контроллер для вывода картинок.
 */
@Controller
public class ImageController {

	@Autowired
	private ItemService itemService;

	@RequestMapping(value = "/image/{itemId}", method = RequestMethod.GET)
	public void viewImage(@PathVariable("itemId") Integer itemId,
			HttpServletResponse response) {
		
		CommonsMultipartFile image = itemService.showItem(itemId).getImage();
		response.setContentType(image.getContentType());
		
		response.setStatus(HttpServletResponse.SC_OK);
		ServletOutputStream out;
		try {
			out = response.getOutputStream();
			out.write(image.getBytes());
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}