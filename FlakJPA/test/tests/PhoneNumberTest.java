package tests;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Conversation;

public class PhoneNumberTest {
	private EntityManagerFactory emf = null;
	private EntityManager em = null;
	Conversation convo;
	
	@Before
	public void setUp() {
		emf = Persistence.createEntityManagerFactory("Flak");
		em = emf.createEntityManager();
		convo = em.find(Conversation.class, 1);
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
	public void test_convo_name_mapping() {
		assertEquals(convo.getTitle(), "family stuff");
	}


}
