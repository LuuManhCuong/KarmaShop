package models;

import java.sql.Date;
import java.util.Objects;

public class cart {
	private String idCart, idUser, idProduct;
	private Date time;

	public cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	public cart(String idCart, String idUser, String idProduct, Date time) {
		super();
		this.idCart = idCart;
		this.idUser = idUser;
		this.idProduct = idProduct;
		this.time = time;
	}

	public String getIdCart() {
		return idCart;
	}

	public void setIdCart(String idCart) {
		this.idCart = idCart;
	}

	public String getIdUser() {
		return idUser;
	}

	public void setIdUser(String idUser) {
		this.idUser = idUser;
	}

	public String getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(String idProduct) {
		this.idProduct = idProduct;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

}
