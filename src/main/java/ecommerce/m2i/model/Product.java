package ecommerce.m2i.model;

import java.io.Serializable;
import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Product implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "title", nullable = false, length = 500)
	private String title;

	@Column(name = "price", nullable = false)
	private Integer price;

	@Column(name = "size", nullable = false)
	private String sizeProduct;

	@Column(name = "description", nullable = false)
	private String description;

	@Column(name = "image", nullable = false)
	private String image;

	@Column(name = "quantity", nullable = false)
	private Integer quantity;

	@Column(name = "stock", nullable = false)
	private Integer stock;

	@Column(name = "date_creation", nullable = false)
	private LocalDate date_creation;

	public Product() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the price
	 */
	public Integer getPrice() {
		return price;
	}

	/**
	 * @param price the price to set
	 */
	public void setPrice(Integer price) {
		this.price = price;
	}

	/**
	 * @return the size
	 */
	public String getSize() {
		return sizeProduct;
	}

	/**
	 * @param size the size to set
	 */
	public void setSize(String size) {
		this.sizeProduct = size;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the image
	 */
	public String getImage() {
		return image;
	}

	/**
	 * @param image the image to set
	 */
	public void setImage(String image) {
		this.image = image;
	}

	/**
	 * @return the quantity
	 */
	public Integer getQuantity() {
		return quantity;
	}

	/**
	 * @param quantity the quantity to set
	 */
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	/**
	 * @return the stock
	 */
	public Integer getStock() {
		return stock;
	}

	/**
	 * @param stock the stock to set
	 */
	public void setStock(Integer stock) {
		this.stock = stock;
	}

	/**
	 * @return the date_creation
	 */
	public LocalDate getDate_creation() {
		return date_creation;
	}

	/**
	 * @param localDate the date_creation to set
	 */
	public void setDate_creation(LocalDate localDate) {
		this.date_creation = localDate;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", title=" + title + ", price=" + price + ", sizeProduct=" + sizeProduct
				+ ", description=" + description + ", image=" + image + ", quantity=" + quantity + ", stock=" + stock
				+ ", date_creation=" + date_creation + "]";
	}

}
