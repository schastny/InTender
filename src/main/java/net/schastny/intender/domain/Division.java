package net.schastny.intender.domain;

import java.util.Collection;

import static javax.persistence.CascadeType.REMOVE;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "DIVISION")
public class Division {

	@Id
	@Column(name = "id")
	@GeneratedValue
	private int id;
	
	@Column(name = "title")
	private String title;

	@Column(name = "description")
	private String description;
	
	@OneToMany(cascade=REMOVE, mappedBy="division")
	private Collection<Tender> tenders;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Collection<Tender> getTenders() {
		return tenders;
	}

}