package tests;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Conversation;

public class ConversationTest {
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
	public void test_Data_In_Convo_Table() {
		assertEquals(convo.getTitle(), "Test convo");
	}
	
	@Test
	public void test_Many_Convos_To_One_Flak_Group() {
		assertEquals(convo.getGroup().getId(), 1);
		assertEquals(convo.getGroup().getName(), "FlakFamily");
		assertEquals(convo.getGroup().getUsers().get(0).getUsername(), "Jimmy");
	}

}
