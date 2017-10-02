package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import data.FlakDAO;
import entities.User;

@Controller
public class FlakController {
	@Autowired
	private FlakDAO flakDAO;

	@RequestMapping(path = "index.do", method = RequestMethod.GET) // unfinished view
	public String show( Model model) {
		model.addAttribute("user", flakDAO.showUser(1));
		return "login.jsp";
	}
	@RequestMapping(path="GetLoginForm.do", method=RequestMethod.GET)
	public ModelAndView getLoginForm() {
	  User u = new User();
	  ModelAndView mv = new ModelAndView();
	  mv.setViewName("login.jsp");
	  mv.addObject("user", u);
	  return mv;
	}
}