package data;

import java.util.List;

import entities.Activity;
import entities.Contact;
import entities.Conversation;
import entities.Group;
import entities.PhoneNumber;
import entities.Post;
import entities.QRL;
import entities.Type;
import entities.User;

public interface FlakDAO {
	
	// show by id for all 9 entities;
	
	public Group showGroup(int id);
	
	public User showUser(int id);
	
	public Post showPost(int id);
	
	public Conversation showConversation(int id);
	
	public Activity showActivity(int id);
	
	public Type showType(int id);
	
	public Contact showContact(int id);
	
	public PhoneNumber showPhoneNumber(int id);
	
	public QRL showQRL(int id);
	
	
	public List<Activity> getActivitiesByType(String type);
	
	//Create, Edit, Delete for all 9 items
	
	public Group createGroup(Group group);
	
	public Group editGroup(Group group);
	
	public boolean deleteGroup(int id); //only available to Flak Administration
	
	public User createUser(User user);
	
	public User editUser(User user);
	
	public boolean deleteUser(int id);
	
	public Post createPost(Post post);
	
	public Post editPost(Post post);
	
	public boolean deletePost(int id);

	public Conversation createConversation(Conversation conv);
	
	public Conversation editConversation(Conversation conv);
	
	public boolean deleteConversation(int id);
	
	public Activity createActivity(Activity activity);
	
	public Activity editActivity(Activity activity);
	
	public boolean deleteActivity(int id);
	
	public Type createType(Type type);
	
	public Type editType(Type type);
	
	public boolean deleteType(int id);
	
	public Contact createContact(Contact contact);
	
	public Contact editContact(Contact contact);
	
	public boolean deleteContact(int id);
	
	public PhoneNumber createPhoneNumber(PhoneNumber phone);
	
	public PhoneNumber editPhoneNumber(PhoneNumber phone);
	
	public boolean deletePhoneNumber(int id);
	
	public QRL createQRL(QRL qrl);
	
	public QRL editQRL(QRL qrl);
	
	public boolean deleteQRL(int id);
	
}
