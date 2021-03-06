package net.schastny.intender.domain;

import java.util.Collection;

import static javax.persistence.CascadeType.REMOVE;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "DIVISIONS")
public class Division {

	@Id
	@Column(name = "id")
	@GeneratedValue
	private int id;
	
	@NotNull
	@Size(min = 2, max = 40)
	@Column(name = "title")
	private String title;
	
	@NotNull
	@Size(min = 2, max = 150)
	@Column(name = "fullTitle")
	private String fullTitle;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "contacts")
	private String contacts;

	@Column(name = "description", columnDefinition="TEXT")
	private String description;
	
	//TODO Сделать проверку адреса на валидность
	@Size(min = 5, max = 100)
	@Column(name = "managerEmail")
	private String managerEmail;
	
	@Size(min = 6, max = 20)
	@Transient
	private String managerPassword;
	
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
	
	public String getFullTitle() {
		return fullTitle;
	}

	public void setFullTitle(String fullTitle) {
		this.fullTitle = fullTitle;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManagerEmail() {
		return managerEmail;
	}

	public void setManagerEmail(String managerEmail) {
		this.managerEmail = managerEmail;
	}
	
	public String getManagerPassword() {
		return managerPassword;
	}

	public void setManagerPassword(String managerPassword) {
		this.managerPassword = managerPassword;
	}

	public Collection<Tender> getTenders() {
		return tenders;
	}
}