package tests;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Post;
import entities.User;


public class PostTest {
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
	  public void test_post_user_association() {
		System.out.println(em.equals(null));
	     Post post = em.find(Post.class, 1);
	     User user = post.getUser();
	     assertEquals("Jimmy", user.getUsername());
	  }
	@Test
	  public void test_user_post_association() {
		System.out.println(em.equals(null));
	     User user = em.find(User.class, 1);
	     Post post = user.getPosts().get(0);
	     assertEquals("This test works.", post.getMessage());
	  }

}