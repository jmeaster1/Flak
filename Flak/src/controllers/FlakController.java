package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import data.FlakDAO;
import entities.User;

@Controller
@SessionAttributes("user")
public class FlakController {
	@Autowired
	private FlakDAO flakDAO;

	@RequestMapping(path = "index.do", method = RequestMethod.GET) // unfinished view
	public String show(Model model) {
		return "index.jsp";
		// return "calendar.jsp";
		// return "dashboard.jsp";
		// return "messagebrd.jsp";
		// return "regstatus.jsp";
		// return "qrl.jsp";
		// return "grouplist.jsp";
		// return "shopping.jsp";
		// return "task.jsp";
		// return "error.jsp";
	}

	@RequestMapping(path = "login.do", method = RequestMethod.GET) // unfinished view
	public String loginPage(Model model) {
		return "login.jsp";
	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String login(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model) {

		if (flakDAO.doesUsernameAndPasswordMatch(username, password)) {
			User user = flakDAO.getUserByUsername(username);
			model.addAttribute("user", user);
			model.addAttribute("groups", user.getGroups());
			return "grouplist.jsp";
		} else {
			return "error.jsp";
		}
	}

	@RequestMapping(path = "signup.do", method = RequestMethod.GET) // unfinished view
	public String signup(Model model) {
		return "signup.jsp";
	}


	@RequestMapping(path = "about.do", method = RequestMethod.GET) // unfinished view
	public String about(Model model) {
		return "about.jsp";
	}

	@RequestMapping(path = "calendar.do", method = RequestMethod.GET) // unfinished view
	public String calendar(Model model, @ModelAttribute("user") User user) {
		return "calendar.jsp";
	}

	@RequestMapping(path = "grouplist.do", method = RequestMethod.GET) // unfinished view
	public String groupListPage(Model model, @ModelAttribute("user") User user) {
		return "grouplist.jsp";
	}

	@RequestMapping(path = "getDashboardByUser.do", method = RequestMethod.GET)
	public String groupsByUserToDashboard(@RequestParam("id") int id, 
										Model model,  
										@ModelAttribute("user") User user) {
		
		model.addAttribute("group", flakDAO.showGroup(id));
		model.addAttribute("groups", user.getGroups());
		model.addAttribute("conversations",flakDAO.getConversationsByGroupId(id));
		model.addAttribute("user", user);
		return "dashboard.jsp";
	}

	@RequestMapping(path = "getConvos.do", method = RequestMethod.GET) 
	public String getPostsByConversation(@RequestParam("cid") int cid,
			@RequestParam("gid") int gid,
			Model model,  
			@ModelAttribute("user") User user) {
		
		model.addAttribute("group", flakDAO.showGroup(gid));
		model.addAttribute("groups", user.getGroups());
		model.addAttribute("posts",flakDAO.getPostsByConvoId(cid));
		model.addAttribute("user", user);
		return "dashboard.jsp";
	}
	@RequestMapping(path = "messagebrd.do", method = RequestMethod.GET) 
	public String messageBoard(Model model, @ModelAttribute("user") User user) {
		return "messagebrd.jsp";
	}

	@RequestMapping(path = "qrl.do", method = RequestMethod.GET) 
	public String QRL(Model model, @ModelAttribute("user") User user) {
		return "qrl.jsp";
	}

	@RequestMapping(path = "regstatus.do", method = RequestMethod.GET)
	public String regStatus(Model model) {
		return "regstatus.jsp";
	}

	@RequestMapping(path = "shopping.do", method = RequestMethod.GET)
	public String shopping(Model model,
						@RequestParam("gid") int gid,
						@ModelAttribute("user") User user) {
		model.addAttribute("group", flakDAO.showGroup(gid));
		model.addAttribute("groups", user.getGroups());
		model.addAttribute("list",flakDAO.getActivitiesByType("shopping"));
		model.addAttribute("user", user);
		return "dashboard.jsp";
	}

	@RequestMapping(path = "task.do", method = RequestMethod.GET) 
	public String task(Model model, @ModelAttribute("user") User user) {
		return "task.jsp";
	}

	@RequestMapping(path = "error.do", method = RequestMethod.GET) // unfinished view
	public String errorView(Model model) {
		return "error.jsp";
	}

	
}