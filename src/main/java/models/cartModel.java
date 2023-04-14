package models;

import java.sql.Date;
import java.util.Objects;

public class cartModel {
	private String idCart, idProduct, thumbnail, description, username, productName;
	private int inCart;
	private Double price;

	@Override
	public String toString() {
		return "cartModel [idCart=" + idCart + ", idProduct=" + idProduct + ", thumbnail=" + thumbnail + ", description="
				+ description + ", username=" + username + ", productName=" + productName + ", inCart=" + inCart
				+ ", price=" + price + "]";
	}

	public String getIdCart() {
		return idCart;
	}

	public void setIdCart(String idCart) {
		this.idCart = idCart;
	}

	public String getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(String idProduct) {
		this.idProduct = idProduct;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getDesciption() {
		return description;
	}

	public void setDesciption(String description) {
		this.description = description;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getInCart() {
		return inCart;
	}

	public void setInCart(int inCart) {
		this.inCart = inCart;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public cartModel(String idCart, String idProduct, String thumbnail, String description, String username,
			String productName, int inCart, Double price) {
		super();
		this.idCart = idCart;
		this.idProduct = idProduct;
		this.thumbnail = thumbnail;
		this.description = description;
		this.username = username;
		this.productName = productName;
		this.inCart = inCart;
		this.price = price;
	}

	public cartModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public static int size() {
		// TODO Auto-generated method stub
		return 0;
	}
}
