package tests;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Activity;
import entities.Post;
import entities.Type;
import entities.User;


public class ActivityTests {
	private EntityManagerFactory emf = null;
	private EntityManager em = null;
	
	@Before 
	public void setUp() {
		emf = Persistence.createEntityManagerFactory("Flak");
		em = emf.createEntityManager();
		}
	@After
	public void tearDown() {
		em.close();
		emf.close();
	}
	
	@Test
	  public void test_activity_user_association() {
	     Activity activity = em.find(Activity.class, 1);
	     User user = activity.getUsers().get(0);
	     assertEquals("Jimmy", user.getUsername());
	  }
	@Test
	  public void test_user_activity_association() {
	     User user = em.find(User.class, 1);
	     Activity activity = user.getActivities().get(0);
	     assertEquals("Garbage", activity.getName());
	  }
	@Test
	  public void test_activity_type_association() {
	     Activity activity = em.find(Activity.class, 1);
	     Type type = activity.getType();
	     assertEquals("task", type.getName());
	  }
	@Test
	  public void test_type_activity_association() {
	     Type type = em.find(Type.class, 1);
	     Activity activity = type.getActivities().get(0);
	     assertEquals("Garbage", activity.getName());
	  }
}