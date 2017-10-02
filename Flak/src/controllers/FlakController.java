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
		return "index.jsp";
	}
	@RequestMapping(path = "login.do", method = RequestMethod.GET) // unfinished view
	public String login( Model model) {
		return "login.jsp";
	}
	@RequestMapping(path = "signup.do", method = RequestMethod.GET) // unfinished view
	public String signup( Model model) {
		return "signup.jsp";
	}

	@RequestMapping(path = "", method = RequestMethod.GET)
	public String dashboard(Model model) {
		return "dashboard.jsp";
	}
	
	@RequestMapping(path = "about.do", method = RequestMethod.GET) // unfinished view
	public String about( Model model) {
		return "about.jsp";

	}
	
	
	
	
	
	
	@RequestMapping(path="GetLoginForm.do", method=RequestMethod.GET)// form validation
	public ModelAndView getLoginForm() {
	  User u = new User();
	  ModelAndView mv = new ModelAndView();
	  mv.setViewName("login.jsp");
	  mv.addObject("user", u);
	  return mv;
	}
}