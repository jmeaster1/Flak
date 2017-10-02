package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;

import entities.Activity;
import entities.Contact;
import entities.Conversation;
import entities.Group;
import entities.PhoneNumber;
import entities.Post;
import entities.QRL;
import entities.Type;
import entities.User;

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
	public List<Activity> getActivitiesByType(String type) {
		// TODO Auto-generated method stub
		//DO LAST
		return null;
	}
	
	@Override
	public Group findGroupByName(String name) {
		// TODO Auto-generated method stub
		return null;
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
		return managedGroup;
	}

	@Override
	public boolean deleteGroup(int id) {
		// TODO Auto-generated method stub
		return false;
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
		return managedUser;
	}

	@Override
	public boolean deleteUser(int id) {
		// TODO Auto-generated method stub
		return false;
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
		}
		else {
			User user = post.getUser();
			Conversation conv = showConversation(post.getConversationId());
		}
	}

	@Override
	public boolean deletePost(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Conversation createConversation(Conversation conv) {
		em.persist(conv);
		em.flush();
		return conv;
	}

	@Override
	public Conversation editConversation(int id, Conversation conv) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteConversation(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Activity createActivity(Activity activity) {
		em.persist(activity);
		em.flush();
		return activity;
	}

	@Override
	public Activity editActivity(int id, Activity activity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteActivity(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Type createType(Type type) {
		em.persist(type);
		em.flush();
		return type;
	}

	@Override
	public Type editType(int id, Type type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteType(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Contact createContact(Contact contact) {
		em.persist(contact);
		em.flush();
		return contact;
	}

	@Override
	public Contact editContact(int id, Contact contact) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteContact(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public PhoneNumber createPhoneNumber(PhoneNumber phone) {
		em.persist(phone);
		em.flush();
		return phone;
	}

	@Override
	public PhoneNumber editPhoneNumber(int id, PhoneNumber phone) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deletePhoneNumber(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public QRL createQRL(QRL qrl) {
		em.persist(qrl);
		em.flush();
		return qrl;
	}

	@Override
	public QRL editQRL(int id, QRL qrl) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteQRL(int id) {
		// TODO Auto-generated method stub
		return false;
	}


}
