package net.schastny.intender.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "USERS")
public class TenderUser {

	@Id
	@Size(min = 2, max = 40)
	@Column(name = "username")
	private String username;
	
	@NotNull
	@Size(min = 2, max = 150)
	@Column(name = "password")
	private String password;
	
	@ManyToOne
	@JoinColumn(name="role")
	private TenderUserRole role;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public TenderUserRole getRole() {
		return role;
	}
	
	public void addRole(TenderUserRole role){
		this.role = role;
	}
}