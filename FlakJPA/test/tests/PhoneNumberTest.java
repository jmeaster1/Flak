package tests;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.PhoneNumber;

public class PhoneNumberTest {
	private EntityManagerFactory emf = null;
	private EntityManager em = null;
	PhoneNumber pn;
	
	@Before
	public void setUp() {
		emf = Persistence.createEntityManagerFactory("Flak");
		em = emf.createEntityManager();
		pn = em.find(PhoneNumber.class, 1);
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
	public void test_Data_In_Phone_Number_Table() {
		assertEquals(pn.getDescription(), "Test Complete");
		assertEquals(pn.getPhoneDigits(), 2147483647);
	}

	@Test
	public void test_Many_To_One_With_Contact() {
		assertEquals(pn.getContact().getFirstName(), "Test");
		assertEquals(pn.getContact().getQrl().getDescription(), "Test");
	}
}
