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
	
	
	//Special Searches
	public List<Activity> getAllActivitiesByType(String type);
	
	public List<Activity> getUserActivitiesByType(User user, String type);
	
	public List<Group> findGroupByWord(String word);
	
	public List<Conversation> getConversationsByGroupId(int id);
	
	public List<Type> getAllTypes();
	
	public List<User> getAllUsersByGroupId(int id);
	
	public List<User> getUsersByActivityId(int id);
	
	public boolean doesUsernameAndPasswordMatch(String name, String pw);
	
	public User getUserByUsername(String name);
	
	List<Post> getPostsByConvoId(int id);
	
	public boolean isUsernameUnique(String name);

	public boolean isGroupNameUnique(String name);

	
	
	//Create, Edit, Delete for all 9 items
	
	public Group createGroup(Group group);
	
	public Group editGroup(int id, Group group);
	
	public boolean deleteGroup(int id); //only available to Flak Administration
	
	public User createUser(User user);
	
	public User editUser(int id, User user);
	
	public boolean deleteUser(int id);
	
	public Post createPost(Post post);
	
	public Post editPost(int id, Post post);
	
	public boolean deletePost(int id);

	public Conversation createConversation(Conversation conv);
	
	public Conversation editConversation(int id, Conversation conv);
	
	public boolean deleteConversation(int id);
	
	public Activity createActivity(Activity activity);
	
	public Activity addUserToActivity(int uid, int aid, User user, Activity activity);
	
	public Activity editActivity(int id, Activity activity);
	
	public boolean deleteActivity(int id);
	
	public Type createType(Type type);
	
	public Type editType(int id, Type type);
	
	public boolean deleteType(int id);
	
	public Contact createContact(Contact contact);
	
	public Contact editContact(int id, Contact contact);
	
	public boolean deleteContact(int id);
	
	public PhoneNumber createPhoneNumber(PhoneNumber phone);
	
	public PhoneNumber editPhoneNumber(int id, PhoneNumber phone);
	
	public boolean deletePhoneNumber(int id);
	
	public QRL createQRL(QRL qrl);
	
	public QRL editQRL(int id, QRL qrl);
	
	public boolean deleteQRL(int id);

	
}
