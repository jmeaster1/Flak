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
	public User showUser(int id) {
		return em.find(User.class, id);
		
	}

	@Override
	public Group showGroup(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Post showPost(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Conversation showConversation(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Activity showActivity(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Type showType(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Contact showContact(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PhoneNumber showPhoneNumber(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public QRL showQRL(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Activity> getActivitiesByType(String type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Group createGroup(Group group) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Group editGroup(Group group) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteGroup(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public User createUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User editUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteUser(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Post createPost(Post post) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Post editPost(Post post) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deletePost(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Conversation createConversation(Conversation conv) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Conversation editConversation(Conversation conv) {
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Activity editActivity(Activity activity) {
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Type editType(Type type) {
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Contact editContact(Contact contact) {
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PhoneNumber editPhoneNumber(PhoneNumber phone) {
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public QRL editQRL(QRL qrl) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteQRL(int id) {
		// TODO Auto-generated method stub
		return false;
	}

}
