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
import entities.Activity;
import entities.Conversation;
import entities.Group;
import entities.Post;
import entities.Type;
import entities.User;

@Controller
@SessionAttributes("user")
public class FlakController {
	@Autowired
	private FlakDAO flakDAO;

	@RequestMapping(path = "index.do", method = RequestMethod.GET) // unfinished view
	public String show(Model model) {
		return "index.jsp";
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

	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String closeSession(SessionStatus status) {
		status.setComplete();
		return "index.jsp";
	}

	@RequestMapping(path = "signup.do", method = RequestMethod.GET) // unfinished view
	public String signup(Model model) {
		return "signup.jsp";
	}

	@RequestMapping(path = "signUp.do", method = RequestMethod.POST)
	public String signUp(@RequestParam("username") String username, @RequestParam("password1") String password1,
			@RequestParam("password2") String password2, Model model) {
		if (username.length() > 0 && flakDAO.isUsernameUnique(username)) {
			User user = new User();
			user.setUsername(username);
			if (password1.equals(password2)) {
				user.setPassword(password1);
				user.setAdmin(true);
				user.setGroups(new ArrayList<Group>());
				flakDAO.createUser(user);
				model.addAttribute("user", user);
				model.addAttribute("groups", user.getGroups());
				return "grouplist.jsp";
			} else {
				model.addAttribute("message", "Password does not match");
				return "signup.jsp";

			}
		}
		model.addAttribute("message", "Username is already in use.");
		return "signup.jsp";
	}
	
	@RequestMapping(path="newGroup.do", method=RequestMethod.POST)
	public String newGroup(Model model, @RequestParam("newGroup") String newGroupName
							, @ModelAttribute("user") User user) {
		if (newGroupName.length() > 0 && flakDAO.isGroupNameUnique(newGroupName)) {
			Group group = new Group();
			group.setName(newGroupName);
			List<User> users = new ArrayList<>(); //Group requires a list of User
			users.add(user); // adding current user that's in session
			group.setUsers(users); // sets List of User in the new group to ^^ 
			flakDAO.createGroupForUser(user, group); // creates/persists in DB
			model.addAttribute("user", user); //adds to model so we can pull out in EL
			model.addAttribute("groups", user.getGroups());//adds List of Group like ^^
			model.addAttribute("message", "Welcome to FLAK!");
			model.addAttribute("group", flakDAO.showGroup(group.getId()));
			return "dashboard.jsp";
		}else {
			model.addAttribute("user", user); //adds to model so we can pull out in EL
			model.addAttribute("groups", user.getGroups());//adds List of Group like ^^
			model.addAttribute("message", "Group Name Already In Use");
			return "grouplist.jsp";
		}
		
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
	public String groupsByUserToDashboard(@RequestParam("gid") int gid, Model model,
			@ModelAttribute("user") User user) {
		model = loadUpModel(gid, model, user);
		model.addAttribute("conversations", flakDAO.getConversationsByGroupId(gid));
		return "dashboard.jsp";
	}

	@RequestMapping(path = "getConvos.do", method = RequestMethod.GET)
	public String getPostsByConversation(@RequestParam("cid") int cid, @RequestParam("gid") int gid, Model model,
			@ModelAttribute("user") User user) {
		model = loadUpModel(gid, model, user);
		model.addAttribute("posts", flakDAO.getPostsByConvoId(cid));
		model.addAttribute("cid", cid);
		return "dashboard.jsp";
	}

	@RequestMapping(path = "editActivity.do", method = RequestMethod.GET)
	public String editActivity(Model model, @RequestParam("aid") int aid, @RequestParam("gid") int gid,
			@ModelAttribute("user") User user) {
		model.addAttribute("group", flakDAO.showGroup(gid));
		model.addAttribute("groups", user.getGroups());
		model.addAttribute("activity", flakDAO.showActivity(aid));
		model.addAttribute("aUsers", flakDAO.getUsersByActivityId(aid));
		model.addAttribute("types", flakDAO.getAllTypes());
		model.addAttribute("users", flakDAO.getAllUsersByGroupId(gid));
		model.addAttribute("user", user);
		return "editAnActivity.jsp";
	}
	
	@RequestMapping(path = "saveActivity.do", method = RequestMethod.POST)
	public String saveEditedActivity(Model model, 
									@RequestParam("gid") int gid, 
									@RequestParam("aid") int aid,
									@RequestParam("name") String name, 
									@RequestParam("description") String description, 
									@RequestParam("tid") int tid, 
									@RequestParam("assignedUser") int uid, 
									@ModelAttribute("user") User user) {
		Activity activity = new Activity();
		activity.setDescription(description);
		activity.setName(name);
		Type type = flakDAO.showType(tid);
		activity.setType(type);
		User user1 = flakDAO.showUser(uid);
		flakDAO.addUserToActivity(uid, aid, user1, activity);
		flakDAO.editActivity(aid, activity);
		model = loadUpModel(gid, model, user);
		model.addAttribute("conversations", flakDAO.getConversationsByGroupId(gid));
		return "dashboard.jsp";
	}
	
	@RequestMapping(path = "newActivity.do", method = RequestMethod.POST)
	public String newActivity(Model model, 
									@RequestParam("gid") int gid, 
									@RequestParam("name") String name, 
									@RequestParam("description") String description, 
									@RequestParam("tid") int tid, 
									@ModelAttribute("user") User user) {
		if(name.length() > 0) {
			Activity activity = new Activity();
			activity.setDescription(description);
			activity.setName(name);
			Type type = flakDAO.showType(tid);
			activity.setType(type);
			List<User> users = new ArrayList<>();
			users.add(user);
			activity.setUsers(users);
			activity.setAssigned(true);
			activity.setGroup(flakDAO.showGroup(gid));
			activity.setTimeStamp(new java.sql.Date(new java.util.Date().getTime()));
			flakDAO.createActivity(activity);
		}
		model = loadUpModel(gid, model, user);
		model.addAttribute("conversations", flakDAO.getConversationsByGroupId(gid));
		return "dashboard.jsp";
	}
	
	@RequestMapping(path = "deleteActivity.do", method = RequestMethod.GET)
	public String deleteActivity(Model model, 
								@RequestParam("aid") int aid, 
								@RequestParam("gid") int gid,
								@ModelAttribute("user") User user) {
		flakDAO.deleteActivity(aid);
		model = loadUpModel(gid, model, user);
		model.addAttribute("conversations", flakDAO.getConversationsByGroupId(gid));
		return "dashboard.jsp";
	}

	@RequestMapping(path = "newPost.do", method = RequestMethod.POST)
	public String newPostToAdd(Model model, @RequestParam("gid") int gid, @RequestParam("cid") int cid,
			@RequestParam("message") String message, @ModelAttribute("user") User user) {
		if (message.length() > 0) {
			Post newPost = new Post();
			newPost.setMessage(message);
			newPost.setConversation(flakDAO.showConversation(cid));
			newPost.setUser(user);
			newPost.setTimestamp(new java.sql.Date(new java.util.Date().getTime()));
			flakDAO.createPost(newPost);
		}
		model = loadUpModel(gid, model, user);
		model.addAttribute("posts", flakDAO.getPostsByConvoId(cid));
		model.addAttribute("cid", cid);
		return "dashboard.jsp";
	}

	@RequestMapping(path = "editThread.do", method = RequestMethod.GET)
	public String editThread(Model model, @RequestParam("gid") int gid, @RequestParam("cid") int cid,
			@ModelAttribute("user") User user) {
		model.addAttribute("group", flakDAO.showGroup(gid));
		model.addAttribute("groups", user.getGroups());
		model.addAttribute("posts", flakDAO.getPostsByConvoId(cid));
		model.addAttribute("conversation", flakDAO.showConversation(cid));
		model.addAttribute("cid", cid);
		model.addAttribute("user", user);
		return "editMessageBoard.jsp";
	}

	@RequestMapping(path = "saveThread.do", method = RequestMethod.POST)
	public String saveEditedThread(Model model, @RequestParam("gid") int gid, @RequestParam("cid") int cid,
			@RequestParam("title") String title, @ModelAttribute("user") User user) {
		Conversation convo = flakDAO.showConversation(cid);
		convo.setTitle(title);
		flakDAO.editConversation(cid, convo);
		model = loadUpModel(gid, model, user);
		model.addAttribute("conversations", flakDAO.getConversationsByGroupId(gid));
		model.addAttribute("cid", cid);
		return "dashboard.jsp";
	}
	
	@RequestMapping(path = "editPost.do", method = RequestMethod.GET)
	public String editPost(Model model, 
							@RequestParam("gid") int gid, 
							@RequestParam("pid") int pid,
							@ModelAttribute("user") User user) {
		model.addAttribute("group", flakDAO.showGroup(gid));
		model.addAttribute("groups", user.getGroups());
		model.addAttribute("pid", pid);
		model.addAttribute("post", flakDAO.showPost(pid));
		model.addAttribute("user", user);
		return "editMessageBoard.jsp";
	}

	@RequestMapping(path = "savePost.do", method = RequestMethod.POST)
	public String saveEditedPost(Model model, 
								@RequestParam("gid") int gid, 
								@RequestParam("pid") int pid,
								@RequestParam("message") String message, 
								@ModelAttribute("user") User user) {
		Post post = flakDAO.showPost(pid);
		post.setMessage(message);
		flakDAO.editPost(pid, post);
		model = loadUpModel(gid, model, user);
		model.addAttribute("conversations", flakDAO.getConversationsByGroupId(gid));
		return "dashboard.jsp";
	}
	
	@RequestMapping(path = "deletePost.do", method = RequestMethod.GET)
	public String deletePost(Model model, 
			@RequestParam("gid") int gid, 
			@RequestParam("pid") int pid,
			@ModelAttribute("user") User user) {
		flakDAO.deletePost(pid);
		model = loadUpModel(gid, model, user);
		model.addAttribute("conversations", flakDAO.getConversationsByGroupId(gid));
		return "dashboard.jsp";
	}
	
	@RequestMapping(path = "newThread.do", method = RequestMethod.POST)
	public String newThreadToAdd(Model model, @RequestParam("gid") int gid,
			@RequestParam("newthread") String threadName, @ModelAttribute("user") User user) {
		if (threadName.length() > 0) {
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
		model = loadUpModel(gid, model, user);
		model.addAttribute("conversations", flakDAO.getConversationsByGroupId(gid));
		return "dashboard.jsp";
	}
	
	public Model loadUpModel (int gid, Model model, @ModelAttribute("user") User user) {
		model.addAttribute("group", flakDAO.showGroup(gid));
		model.addAttribute("groups", user.getGroups());
		model.addAttribute("shoplist", flakDAO.getUserActivitiesByType(user, "shopping"));
		model.addAttribute("tasklist", flakDAO.getUserActivitiesByType(user, "task"));
		model.addAttribute("eventlist", flakDAO.getUserActivitiesByType(user, "event"));
		model.addAttribute("types", flakDAO.getAllTypes());
		model.addAttribute("user", user);
		return model;
	}

}