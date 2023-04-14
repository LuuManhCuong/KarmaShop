package models;

public class product {

	private String idProduct, name, description, category, brand, size, thumbnail, color;
	private int quantity, like;
	private double price;

	public String getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(String idProduct) {
		this.idProduct = idProduct;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public product(String idProduct, String name, String description, String category, String brand, String size,
			String thumbnail, String color, int quantity, int like, double price) {
		super();
		this.idProduct = idProduct;
		this.name = name;
		this.description = description;
		this.category = category;
		this.brand = brand;
		this.size = size;
		this.thumbnail = thumbnail;
		this.color = color;
		this.quantity = quantity;
		this.like = like;
		this.price = price;
	}

	@Override
	public String toString() {
		return "product [idProduct=" + idProduct + ", name=" + name + ", description=" + description + ", category="
				+ category + ", brand=" + brand + ", size=" + size + ", thumbnail=" + thumbnail + ", color=" + color
				+ ", quantity=" + quantity + ", like=" + like + ", price=" + price + "]";
	}

}