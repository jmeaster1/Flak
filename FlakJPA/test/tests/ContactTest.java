package tests;

import static org.junit.Assert.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Contact;
import entities.PhoneNumber;
import entities.QRL;
import entities.User;

public class ContactTest {

	
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
	public void testGetFirstNameFromContact() {
		Contact c = em.find(Contact.class, 1);
		assertEquals("Test", c.getFirstName());
	}
	@Test 
	public void testGetDescriptionFromContact() {
		Contact c = em.find(Contact.class, 1);
		assertEquals("testing date", c.getDescription());
	}
	
	@Test 
	public void testGetQrlDescriptionFromContact() {
		Contact c = em.find(Contact.class, 1);
		QRL q = c.getQrl();
		assertEquals("Test", q.getDescription());
	}

	

}
