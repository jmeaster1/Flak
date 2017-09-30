package entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Type {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	@OneToMany(mappedBy = "type")
	private List<Activity> activities;

	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Activity> getActivities() {
		return activities;
	}

	public void setActivities(List<Activity> activities) {
		this.activities = activities;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "Type [id=" + id + ", name=" + name + ", activities=" + activities + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((activities == null) ? 0 : activities.hashCode());
		result = prime * result + id;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Type other = (Type) obj;
		if (activities == null) {
			if (other.activities != null)
				return false;
		} else if (!activities.equals(other.activities))
			return false;
		if (id != other.id)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}

}
