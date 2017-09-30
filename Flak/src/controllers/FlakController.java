package controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import data.FlakDAO;

@Controller
public class FlakController {
	@Autowired
	private FlakDAO flakDAO;

	@RequestMapping(path = "index.do", method = RequestMethod.GET) // unfinished view
	public String show( Model model) {
		model.addAttribute("user", flakDAO.showUser(1));
		return "index.jsp";
	}
}