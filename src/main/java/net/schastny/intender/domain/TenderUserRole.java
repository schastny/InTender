package net.schastny.intender.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "USER_ROLES")
public class TenderUserRole {

	@Id
	@GeneratedValue
	@Column(name = "id")
	private int id;

	@NotNull
	@Size(min = 2, max = 40)
	@Column(name = "role")
	private String role;

	@ManyToOne
	@JoinColumn(name="user")
	private TenderUser user;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public TenderUser getUser() {
		return user;
	}

	public void setUser(TenderUser user) {
		this.user = user;
	}
}