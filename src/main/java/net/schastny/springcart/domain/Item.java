package net.schastny.springcart.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Entity
@Table(name = "ITEMS")
public class Item {

	@Id
	@Column(name = "id")
	@GeneratedValue
	private int id;

	@Column(name = "title")
	@NotNull
	@Size(min = 2, max = 20)
	private String title;

	@ManyToOne
	@JoinColumn(name="category")
	private Category category;

	@Column(name = "price")
	@Digits(fraction = 0, integer = 10)
	private int price;

	@Column(name = "image", columnDefinition="longblob")
	// Также можно использовать @Column(length=500000)
	// Картинку решил хранить в БД - так как она будет до 1 Мб (ограничение поставил в servlet-context.xml)
	// Подробности - http://research.microsoft.com/apps/pubs/default.aspx?id=64525
	private CommonsMultipartFile image;
	
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public CommonsMultipartFile getImage() {
		return image;
	}

	public void setImage(CommonsMultipartFile image) {
		this.image = image;
	}
	
}
