package tests;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.QRL;

public class QRLTest {
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
	public void test_qrl_description_mapping() {
		QRL qrl = em.find(QRL.class, 1);
		assertEquals(qrl.getDescription(), "Test");
	}
	
	@Test
	public void test_qrl_contacts_mapping() {
		QRL qrl = em.find(QRL.class, 1);
		assertEquals(qrl.getContacts().get(0).getFirstName(), "Test");
		assertEquals(qrl.getContacts().get(0).getLastName(), "Testing");
	}
	
	@Test
	public void test_qrl_group_mapping() {
		QRL qrl = em.find(QRL.class, 1);
		assertEquals(qrl.getGroup().getId(), 1);
	}

}
