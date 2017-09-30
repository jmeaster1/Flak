package entities;

import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="flak_group")
public class Group {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	// one group can have many conversatons
	@OneToMany(mappedBy="group")
	private List<Conversation> conversations;
	
	// many users can have many groups
	@ManyToMany(mappedBy="groups")
	private List<User> users;
	
	@OneToMany(mappedBy = "group")
	private List<QRL> refLists;

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public List<QRL> getRefLists() {
		return refLists;
	}

	public void setRefLists(List<QRL> refLists) {
		this.refLists = refLists;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Conversation> getConversations() {
		return conversations;
	}

	public void setConversations(List<Conversation> conversations) {
		this.conversations = conversations;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Group [id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append("]");
		return builder.toString();
	}

}
