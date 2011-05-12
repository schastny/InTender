package net.schastny.intender.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Entity
@Table(name = "TENDERS")
public class Tender {

	@Id
	@Column(name = "id")
	@GeneratedValue
	private int id;

	@Column(name = "title")
	@NotNull
	@Size(min = 2, max = 20)
	private String title;

	@ManyToOne
	@JoinColumn(name="division")
	private Division division;

	@Column(name = "publishDate")
	private Date publishDate;

	@Transient
	private CommonsMultipartFile attachedDoc;
	
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

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	
	public Division getDivision() {
		return division;
	}

	public void setDivision(Division category) {
		this.division = category;
	}

	public CommonsMultipartFile getAttachedDoc() {
		return attachedDoc;
	}

	public void setAttachedDoc(CommonsMultipartFile attachedDoc) {
		this.attachedDoc = attachedDoc;
	}
	
}
