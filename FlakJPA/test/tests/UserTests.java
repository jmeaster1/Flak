package tests;

import static org.junit.Assert.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Group;
import entities.Post;
import entities.User;

public class UserTests {
	
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
	public void smoke_test() {
		assertEquals(true, true);
	}

	@Test
	public void testUserUserNameHasData() {
		User u = em.find(User.class, 1);
		assertEquals("Jimmy", u.getUsername());
	}
	
	@Test
	public void userToPostTest() {
		User u = em.find(User.class, 1);
		Post p = u.getPosts().get(0);
		assertEquals("This test works.", p.getMessage());
		
	}
	@Test
	public void testUserToFlakGroup() {
		User u = em.find(User.class, 1);
		Group g = u.getGroups().get(0);
		assertEquals("FlakFamily", g.getName());
		
	}

}
