package net.schastny.intender.domain;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
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
	
	@OneToMany(mappedBy="user")
	private Collection<TenderUserRole> roles;

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

	public Collection<TenderUserRole> getRoles() {
		return roles;
	}
	
	public void addRole(TenderUserRole role){
		roles.add(role);
	}
}