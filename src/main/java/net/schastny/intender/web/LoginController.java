package net.schastny.intender.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	@RequestMapping(value = "/login")
	public String login(HttpServletRequest request, HttpServletResponse response) {
		return "login";
	}
}

//TODO Добавил товар с картинкой, сделал logout - ошибка.
//TODO Не сделал login, пытаюсь добавить товар (метод POST) - выбрасывает на страницу логина, ввожу его - ошибка.
