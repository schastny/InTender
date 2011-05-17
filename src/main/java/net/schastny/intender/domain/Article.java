package net.schastny.intender.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "ARTICLES")
public class Article {

	@Id
	@NotNull
	@Size(min = 2, max = 15)
	@Column(name = "id")
	private String id;
	
	@NotNull
	@Size(min = 2, max = 40)
	@Column(name = "title")
	private String title;
	
	@Column(name = "body", columnDefinition="TEXT")
	private String body;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

}