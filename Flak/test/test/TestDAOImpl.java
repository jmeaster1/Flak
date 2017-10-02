package test;


import static org.junit.Assert.*;
import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Group;

public class TestDAOImpl {
	private EntityManagerFactory emf = null;
	private EntityManager em = null;
	Group gr;
	
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
	
//	@Test
//	public void smoke_test() {
//		assertEquals(true, true);
//	}
	
	@Test
	public void testShowGroup() {
		gr = em.find(Group.class, 1);
		assertEquals("Flak Development T", gr.getName());
	}

}
