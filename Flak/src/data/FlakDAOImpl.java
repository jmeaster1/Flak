package data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;

import entities.User;

@Component
public class FlakDAOImpl implements FlakDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public User showUser(int id) {
		return em.find(User.class, id);
		
	}

}
