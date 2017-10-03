package controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import data.FlakDAO;
import entities.Conversation;
import entities.Post;
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
	@RequestMapping(value="logout.do",method=RequestMethod.GET)
	public String closeSession(SessionStatus status){
	    status.setComplete();
	    return "index.jsp";
	}

	@RequestMapping(path = "signup.do", method = RequestMethod.GET) // unfinished view
	public String signup(Model model) {
		return "signup.jsp";
	}


	@RequestMapping(path = "about.do", method = RequestMethod.GET) // unfinished view
	public String about(Model model) {
		return "about.jsp";
	}

	@RequestMapping(path = "grouplist.do", method = RequestMethod.GET) 
	public String groupListPage(Model model, @ModelAttribute("user") User user) {
		return "grouplist.jsp";
	}

	@RequestMapping(path = "getDashboardByUser.do", method = RequestMethod.GET)
	public String groupsByUserToDashboard(@RequestParam("gid") int gid, 
										Model model,  
										@ModelAttribute("user") User user) {
		
		model.addAttribute("group", flakDAO.showGroup(gid));
		model.addAttribute("groups", user.getGroups());
		model.addAttribute("conversations",flakDAO.getConversationsByGroupId(gid));
		System.out.println("Size:" + flakDAO.getConversationsByGroupId(gid).size());
		model.addAttribute("shoplist", flakDAO.getUserActivitiesByType(user, "shopping"));
		model.addAttribute("tasklist", flakDAO.getUserActivitiesByType(user, "task"));
		model.addAttribute("eventlist", flakDAO.getUserActivitiesByType(user, "event"));
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
		model.addAttribute("cid", cid);
		model.addAttribute("user", user);
		return "dashboard.jsp";
	}

	@RequestMapping(path = "qrl.do", method = RequestMethod.GET) 
	public String QRL(Model model, @ModelAttribute("user") User user) {
		return "qrl.jsp";
	}

	@RequestMapping(path = "regstatus.do", method = RequestMethod.GET)
	public String regStatus(Model model) {
		return "regstatus.jsp";
	}

	@RequestMapping(path = "error.do", method = RequestMethod.GET) // unfinished view
	public String errorView(Model model) {
		return "error.jsp";
	}
	
	@RequestMapping(path = "editActivity.do", method = RequestMethod.GET)
	public String editActivity(Model model,
								@RequestParam("aid") int aid,
								@RequestParam("gid") int gid,
								@ModelAttribute("user") User user) {
		model.addAttribute("group", flakDAO.showGroup(gid));
		model.addAttribute("groups", user.getGroups());
		model.addAttribute("activity", flakDAO.showActivity(aid));
		model.addAttribute("types", flakDAO.getAllTypes());
		model.addAttribute("users", flakDAO.getAllUsersByGroupId(gid));
		model.addAttribute("user", user);
		return "editactivity.jsp";
	}
	
	@RequestMapping(path = "newPost.do", method = RequestMethod.POST)
	public String newPostToAdd(Model model,
								@RequestParam("gid") int gid,
								@RequestParam("cid") int cid,
								@RequestParam("message") String message,
								@ModelAttribute("user") User user) {
		if(message.length() > 0) {
			Post newPost = new Post();
			newPost.setMessage(message); 
			newPost.setConversation(flakDAO.showConversation(cid));
			newPost.setUser(user);
			newPost.setTimestamp(new java.sql.Date(new java.util.Date().getTime()));
			flakDAO.createPost(newPost);
		}
		model.addAttribute("group", flakDAO.showGroup(gid));
		model.addAttribute("groups", user.getGroups());
		model.addAttribute("posts",flakDAO.getPostsByConvoId(cid));
		model.addAttribute("cid", cid);
		model.addAttribute("user", user);
		return "dashboard.jsp";
	}
	
	@RequestMapping(path = "newThread.do", method = RequestMethod.POST)
	public String newThreadToAdd(Model model,
								@RequestParam("gid") int gid,
								@RequestParam("newthread") String threadName,
								@ModelAttribute("user") User user) {
		if(threadName.length() > 0) {
			Conversation convo = new Conversation();
			convo.setGroup(flakDAO.showGroup(gid));
			convo.setTitle(threadName);
			flakDAO.createConversation(convo);
			Post post = new Post();
			List<Post> posts = new ArrayList<>();
			posts.add(post);
			post.setMessage("Thread " + threadName + ": Welcome to Flak!");
			post.setUser(user);
			post.setTimestamp(new java.sql.Date(new java.util.Date().getTime()));
			post.setConversation(convo);
			flakDAO.createPost(post);
			convo.setPosts(posts);
			flakDAO.editConversation(convo.getId(), convo);
		}
		model.addAttribute("group", flakDAO.showGroup(gid));
		model.addAttribute("groups", user.getGroups());
		model.addAttribute("conversations",flakDAO.getConversationsByGroupId(gid));
		model.addAttribute("shoplist", flakDAO.getUserActivitiesByType(user, "shopping"));
		model.addAttribute("tasklist", flakDAO.getUserActivitiesByType(user, "task"));
		model.addAttribute("eventlist", flakDAO.getUserActivitiesByType(user, "event"));
		model.addAttribute("user", user);
		return "dashboard.jsp";
	}

	
}