package tests;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Type;

public class TypeTest {
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
	public void test_group_name_mapping() {
		Type type = em.find(Type.class, 1);
		Type type2 = em.find(Type.class, 2);
		Type type3 = em.find(Type.class, 3);
		assertEquals(type.getName(), "task");
		assertEquals(type2.getName(), "event");
		assertEquals(type3.getName(), "shopping");
	}

}
