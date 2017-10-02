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
//		return "calendar.jsp";
//		return "dashboard.jsp";
//		return "messagebrd.jsp";
//		return "regstatus.jsp";
//		return "qrl.jsp";
//		return "grouplist.jsp";
//		return "shopping.jsp";
//		return "task.jsp";
//		return "error.jsp";
	}
	@RequestMapping(path = "login.do", method = RequestMethod.GET) // unfinished view
	public String login( Model model) {
		return "login.jsp";
	}
	@RequestMapping(path = "signup.do", method = RequestMethod.GET) // unfinished view
	public String signup( Model model) {
		return "signup.jsp";
	}

	@RequestMapping(path = "dashboard.do", method = RequestMethod.GET)
	public String dashboard(Model model) {
		return "dashboard.jsp";
	}
	
	@RequestMapping(path = "about.do", method = RequestMethod.GET) // unfinished view
	public String about( Model model) {
		return "about.jsp";
	}	
	
	@RequestMapping(path = "calendar.do", method = RequestMethod.GET) // unfinished view
	public String calendar( Model model) {
		return "calendar.jsp";
	}	
	
	@RequestMapping(path = "grouplist.do", method = RequestMethod.GET) // unfinished view
	public String groupList( Model model) {
		return "grouplist.jsp";
	}	
	
	@RequestMapping(path = "messagebrd.do", method = RequestMethod.GET) // unfinished view
	public String messageBoard( Model model) {
		return "messagebrd.jsp";
	}	
	
	@RequestMapping(path = "qrl.do", method = RequestMethod.GET) // unfinished view
	public String QRL( Model model) {
		return "qrl.jsp";
	}	
	
	@RequestMapping(path = "regstatus.do", method = RequestMethod.GET) // unfinished view
	public String regStatus( Model model) {
		return "regstatus.jsp";
	}
	
	@RequestMapping(path = "shopping.do", method = RequestMethod.GET) // unfinished view
	public String shopping( Model model) {
		return "shopping.jsp";
	}
	
	@RequestMapping(path = "task.do", method = RequestMethod.GET) // unfinished view
	public String task( Model model) {
		return "task.jsp";
	}	
	
	@RequestMapping(path = "error.do", method = RequestMethod.GET) // unfinished view
	public String errorView( Model model) {
		return "error.jsp";
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