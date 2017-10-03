package data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import entities.Activity;
import entities.Contact;
import entities.Conversation;
import entities.Group;
import entities.PhoneNumber;
import entities.Post;
import entities.QRL;
import entities.Type;
import entities.User;

@Transactional
@Component
public class FlakDAOImpl implements FlakDAO {
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Group showGroup(int id) {
		return em.find(Group.class, id);
	}
	
	@Override
	public User showUser(int id) {
		return em.find(User.class, id);
	}

	@Override
	public Post showPost(int id) {
		return em.find(Post.class, id);
	}

	@Override
	public Conversation showConversation(int id) {
		return em.find(Conversation.class, id);
	}

	@Override
	public Activity showActivity(int id) {
		return em.find(Activity.class, id);
	}

	@Override
	public Type showType(int id) {
		return em.find(Type.class, id);
	}

	@Override
	public Contact showContact(int id) {
		return em.find(Contact.class, id);
	}

	@Override
	public PhoneNumber showPhoneNumber(int id) {
		return em.find(PhoneNumber.class, id);
	}

	@Override
	public QRL showQRL(int id) {
		return em.find(QRL.class, id);
	}

	@Override
	public List<Activity> getAllActivitiesByType(String type) {
		List<Activity> answer = new ArrayList<>();
		type = type.toLowerCase();
		String queryString = "Select a from Activity a";
		List<Activity> allActivities =  em.createQuery(queryString, Activity.class)
								.getResultList();
		for (int i = 0; i < allActivities.size(); i++) {
			String current = allActivities.get(i).getType().getName().toLowerCase();
			if(current.equals(type)) {
				answer.add(allActivities.get(i));
			}
		}
		return answer;
	}
	
	@Override
	public List<Activity> getUserActivitiesByType(User user, String type) {
		List<Activity> answer = new ArrayList<>();
		type = type.toLowerCase();
		String queryString = "Select a from Activity a join fetch a.users where a.type.name = :name";
		List<Activity> allActivities =  em.createQuery(queryString, Activity.class)
								.setParameter("name", type)
								.getResultList();
		for (int i = 0; i < allActivities.size(); i++) {
			List<User> aUsers = allActivities.get(i).getUsers();
			for (int j = 0; j < aUsers.size(); j++) {
				if(aUsers.get(i).getId()==user.getId()) {
					answer.add(allActivities.get(i));
				}	
			}
		}
		return answer;
	}
	
	@Override
	public List<Group> findGroupByWord(String word) {
		List<Group> groups;
		String queryString = "Select g from Flak_Group g where name LIKE :name";
		String searchString = "%" + word + "%";
		groups =  em.createQuery(queryString, Group.class)
								.setParameter("name", searchString)
								.getResultList();
		return groups;
	}
	@Override
	public List<Conversation> getConversationsByGroupId(int id) {
		List<Conversation> conversations;
		String queryString = "Select c from Conversation c join fetch c.posts where c.group.id = :id";
		conversations =  em.createQuery(queryString, Conversation.class)
						.setParameter("id", id)
						.getResultList();
		return conversations;
	}
	
	@Override
	public List<Post> getPostsByConvoId(int id) {
		List<Post> posts;
		String queryString = "Select p from Post p where p.conversation.id = :id";
		posts =  em.createQuery(queryString, Post.class)
				.setParameter("id", id)
				.getResultList();
		return posts;
	}
	
	@Override
	public List<Type> getAllTypes() {
		List<Type> answer = new ArrayList<>();
		String queryString = "Select t from Type t";
		answer =  em.createQuery(queryString, Type.class)
								.getResultList();
		return answer;
	}
	
	@Override
	public List<User> getAllUsersByGroupId(int id) {
		List<User> answer = new ArrayList<>();
		String queryString = "Select u from User u where u.group.id=:id";
		answer =  em.createQuery(queryString, User.class)
								.setParameter("id", id)
								.getResultList();
		return answer;
	}
	
	@Override
	public boolean doesUsernameAndPasswordMatch(String name, String pw) {
		boolean answer = false;
		String queryString = "Select u from User u where username = :name";
		List<User> users =  em.createQuery(queryString, User.class)
								.setParameter("name", name)
								.getResultList();
		User user = null;
		if(users.size() > 0) {
			user = users.get(0);
		}
		if(user != null) {
			String pass = user.getPassword();
			if (pass.equals(pw)) {
				answer = true;
			}
		}
		return answer;
	}
	
	@Override
	public User getUserByUsername(String name) {
		User user = null;
		String queryString = "Select u from User u join fetch u.groups where u.username = :name";
		List<User> users =  em.createQuery(queryString, User.class)
								.setParameter("name", name)
								.getResultList();
		if(users.size() > 0) {
			user = users.get(0);
		}
		return user;
	}


	@Override
	public Group createGroup(Group group) {
		em.persist(group);
		em.flush();
		return group;
	}

	@Override
	public Group editGroup(int id, Group group) {
		Group managedGroup = em.find(Group.class, id);
		if (managedGroup !=null) {
			if(group.getName() != "" && group.getName() != null) {
				managedGroup.setName(group.getName());
			}
			if(group.getUsers() != null) {
				managedGroup.setUsers(group.getUsers());
			}
		}
		return group;
	}

	@Override
	public boolean deleteGroup(int id) {
		Group managedGroup = em.find(Group.class, id);
		if(managedGroup==null) {
			return false;
		}
		else {
			em.remove(managedGroup);
			return true;
		}
	}

	@Override
	public User createUser(User user) {
		em.persist(user);
		em.flush();
		return user;
	}

	@Override
	public User editUser(int id, User user) {
		User managedUser = em.find(User.class, id);
		if (managedUser !=null) {
			if(user.getUsername() != "" && user.getUsername() != null) {
				managedUser.setUsername(user.getUsername());
			}
			if(user.getGroups() != null) {
				managedUser.setGroups(user.getGroups());
			}
			if(user.getPassword() != "" && user.getPassword()!= null) {
				managedUser.setPassword(user.getPassword());
			}
			if(user.getActivities() != null) {
				managedUser.setActivities(user.getActivities());
			}
			if(user.getPosts() != null) {
				managedUser.setPosts(user.getPosts());
			}
			managedUser.setAdmin(user.getAdmin());
		}
		return user;
	}

	@Override
	public boolean deleteUser(int id) {
		User managedUser = em.find(User.class, id);
		if(managedUser==null) {
			return false;
		}
		else {
			em.remove(managedUser);
			return true;
		}
	}

	@Override
	public Post createPost(Post post) {
		em.persist(post);
		em.flush();
		return post;
	}

	@Override
	public Post editPost(int id, Post post) {
		Post managedPost = em.find(Post.class, id);
		if (managedPost !=null) {
			if(post.getMessage() != "" && post.getMessage() != null) {
				managedPost.setMessage(post.getMessage());
			}
			if(post.getConversation() != null) {
				managedPost.setConversation(post.getConversation());
			}
			if(post.getTimestamp() != null) {
				managedPost.setTimestamp(post.getTimestamp());
			}
		}
		else {
			List<Post> posts = post.getConversation().getPosts();
			posts.add(post);
			post.getConversation().setPosts(posts);
		}
		return post;
	}

	@Override
	public boolean deletePost(int id) {
		Post managedPost = em.find(Post.class, id);
		if(managedPost==null) {
			return false;
		}
		else {
			em.remove(managedPost);
			return true;
		}
	}

	@Override
	public Conversation createConversation(Conversation conv) {
		em.persist(conv);
		em.flush();
		return conv;
	}

	@Override
	public Conversation editConversation(int id, Conversation conv) {
		Conversation managedConv = em.find(Conversation.class, id);
		if (managedConv !=null) {
			if(conv.getGroup() != null) {
				managedConv.setGroup(conv.getGroup());
			}
			if(conv.getPosts() != null) {
				managedConv.setPosts(conv.getPosts());
			}
			if(conv.getTitle() != "" && conv.getTitle() != null) {
				managedConv.setTitle(conv.getTitle());
			}
		}
		return conv;
	}

	@Override
	public boolean deleteConversation(int id) {
		Conversation managedConv = em.find(Conversation.class, id);
		if(managedConv==null) {
			return false;
		}
		else {
			em.remove(managedConv);
			return true;
		}
	}

	@Override
	public Activity createActivity(Activity activity) {
		em.persist(activity);
		em.flush();
		return activity;
	}

	@Override
	public Activity editActivity(int id, Activity activity) {
		Activity managedAct = em.find(Activity.class, id);
		if (managedAct !=null) {
			if(activity.getDescription() != "" && activity.getDescription() != null) {
				managedAct.setDescription(activity.getDescription());
			}
			if(activity.getName() != "" && activity.getName() != null) {
				managedAct.setName(activity.getName());
			}
			if(activity.getTimeStamp()  != null) {
				managedAct.setTimeStamp(activity.getTimeStamp());
			}
			if(activity.getType()  != null) {
				managedAct.setType(activity.getType());
			}
			if(activity.getUsers() != null) {
				managedAct.setUsers(activity.getUsers());
			}
		}
		return activity;
	}

	@Override
	public boolean deleteActivity(int id) {
		Activity managedActivity = em.find(Activity.class, id);
		if(managedActivity==null) {
			return false;
		}
		else {
			em.remove(managedActivity);
			return true;
		}
	}

	@Override
	public Type createType(Type type) {
		em.persist(type);
		em.flush();
		return type;
	}

	@Override
	public Type editType(int id, Type type) {
		Type managedType = em.find(Type.class, id);
		if (managedType !=null) {
			if(type.getName() != "" && type.getName() != null) {
				managedType.setName(type.getName());
			}
		}
		return type;
	}

	@Override
	public boolean deleteType(int id) {
		Type managedType = em.find(Type.class, id);
		if(managedType==null) {
			return false;
		}
		else {
			em.remove(managedType);
			return true;
		}
	}

	@Override
	public Contact createContact(Contact contact) {
		em.persist(contact);
		em.flush();
		return contact;
	}

	@Override
	public Contact editContact(int id, Contact contact) {
		Contact managedContact = em.find(Contact.class, id);
		if (managedContact !=null) {
			if(contact.getDescription() != "" && contact.getDescription() != null) {
				managedContact.setDescription(contact.getDescription());
			}
			if(contact.getFirstName() != "" && contact.getFirstName() != null) {
				managedContact.setFirstName(contact.getFirstName());
			}
			if(contact.getLastName() != "" && contact.getLastName() != null) {
				managedContact.setLastName(contact.getLastName());
			}
			if(contact.getPhoneNumbers() != null) {
				managedContact.setPhoneNumbers(contact.getPhoneNumbers());
			}
			if(contact.getQrl() != null) {
				managedContact.setQrl(contact.getQrl());
			}
		}
		return contact;
	}

	@Override
	public boolean deleteContact(int id) {
		Contact managedContact = em.find(Contact.class, id);
		if(managedContact==null) {
			return false;
		}
		else {
			em.remove(managedContact);
			return true;
		}
	}

	@Override
	public PhoneNumber createPhoneNumber(PhoneNumber phone) {
		em.persist(phone);
		em.flush();
		return phone;
	}

	@Override
	public PhoneNumber editPhoneNumber(int id, PhoneNumber phone) {
		PhoneNumber managedPhone = em.find(PhoneNumber.class, id);
		if (managedPhone !=null) {
			if(phone.getContact() != null) {
				managedPhone.setContact(phone.getContact());
			}
			if(phone.getDescription() != "" && phone.getDescription() != null) {
				managedPhone.setDescription(phone.getDescription());
			}
			if(phone.getPhoneDigits() != 0) {
				managedPhone.setPhoneDigits(phone.getPhoneDigits());
			}
		}
		return phone;
	}

	@Override
	public boolean deletePhoneNumber(int id) {
		PhoneNumber managedPhone = em.find(PhoneNumber.class, id);
		if(managedPhone==null) {
			return false;
		}
		else {
			em.remove(managedPhone);
			return true;
		}
	}

	@Override
	public QRL createQRL(QRL qrl) {
		em.persist(qrl);
		em.flush();
		return qrl;
	}

	@Override
	public QRL editQRL(int id, QRL qrl) {
		QRL managedQRL = em.find(QRL.class, id);
		if (managedQRL !=null) {
			if(qrl.getDescription()  != "" && qrl.getDescription() != null) {
				managedQRL.setDescription(qrl.getDescription());
			}
			if(qrl.getGroup() != null) {
				managedQRL.setGroup(qrl.getGroup());
			}
			if(qrl.getContacts() != null) {
				managedQRL.setContacts(qrl.getContacts());
			}
		}
		return qrl;
	}

	@Override
	public boolean deleteQRL(int id) {
		QRL managedQRL = em.find(QRL.class, id);
		if(managedQRL==null) {
			return false;
		}
		else {
			em.remove(managedQRL);
			return true;
		}
	}


}
