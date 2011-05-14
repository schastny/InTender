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
@Table(name = "USER_ROLES")
public class TenderUserRole {

	@Id
	@NotNull
	@Size(min = 2, max = 40)
	@Column(name = "roleName")
	private String roleName;
	
	@OneToMany(mappedBy="role")
	private Collection<TenderUser> users;

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
}